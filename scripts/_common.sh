#
# Common variables
#

# Package dependencies
PKG_DEPENDENCIES="php5-cli php5-mysql php5-json php5-gd php5-tidy php5-curl php-gettext redis-server"

# Execute a command as another user
# usage: exec_as USER COMMAND [ARG ...]
exec_as() {
  local USER=$1
  shift 1

  if [[ $USER = $(whoami) ]]; then
    eval $@
  else
    # use sudo twice to be root and be allowed to use another user
    sudo sudo -u "$USER" "$@"
  fi
}

# Execute a command through the wallabag console
# usage: exec_console AS_USER WORKDIR COMMAND [ARG ...]
exec_console() {
  local AS_USER=$1
  local WORKDIR=$2
  shift 2
  exec_as "$AS_USER" php "$WORKDIR/bin/console" --no-interaction --env=prod "$@"
}

WARNING () {	# Print on error output
	$@ >&2
}

QUIET () {	# redirect standard output to /dev/null
	$@ > /dev/null
}

HUMAN_SIZE () {	# Transforms a Kb-based size to a human-readable size
	human=$(numfmt --to=iec --from-unit=1K $1)
	echo $human
}

CHECK_SIZE () {	# Check if enough disk space available on backup storage
	file_to_analyse=$1
	backup_size=$(sudo du --summarize "$file_to_analyse" | cut -f1)
	free_space=$(sudo df --output=avail "/home/yunohost.backup" | sed 1d)

	if [ $free_space -le $backup_size ]
	then
		WARNING echo "Not enough backup disk space for: $file_to_analyse."
		WARNING echo "Space available: $(HUMAN_SIZE $free_space)"
		ynh_die "Space needed: $(HUMAN_SIZE $backup_size)"
	fi
}

CHECK_DOMAINPATH () {	# Check domain/path availability
	sudo yunohost app checkurl $domain$path_url -a $app
}

CHECK_FINALPATH () {	# Check if destination directory already exists
	final_path="/var/www/$app"
	test ! -e "$final_path" || ynh_die "This path already contains a folder"
}

#=================================================
# FUTURE YUNOHOST HELPERS - TO BE REMOVED LATER
#=================================================
 
# Normalize the url path syntax
# Handle the slash at the beginning of path and its absence at ending
# Return a normalized url path
#
# example: url_path=$(ynh_normalize_url_path $url_path)
#          ynh_normalize_url_path example -> /example
#          ynh_normalize_url_path /example -> /example
#          ynh_normalize_url_path /example/ -> /example
#          ynh_normalize_url_path / -> /
#
# usage: ynh_normalize_url_path path_to_normalize
# | arg: url_path_to_normalize - URL path to normalize before using it
ynh_normalize_url_path () {
	path_url=$1
	test -n "$path_url" || ynh_die "ynh_normalize_url_path expect a URL path as first argument and received nothing."
	if [ "${path_url:0:1}" != "/" ]; then    # If the first character is not a /
		path_url="/$path_url"    # Add / at begin of path variable
	fi
	if [ "${path_url:${#path_url}-1}" == "/" ] && [ ${#path_url} -gt 1 ]; then    # If the last character is a / and that not the only character.
		path_url="${path_url:0:${#path_url}-1}"	# Delete the last character
	fi
	echo $path_url
}

# Manage a fail of the script
#
# Print a warning to inform that the script was failed
# Execute the ynh_clean_setup function if used in the app script
#
# usage of ynh_clean_setup function
# This function provide a way to clean some residual of installation that not managed by remove script.
# To use it, simply add in your script:
# ynh_clean_setup () {
#        instructions...
# }
# This function is optionnal.
#
# Usage: ynh_exit_properly is used only by the helper ynh_abort_if_errors.
# You must not use it directly.
ynh_exit_properly () {
	exit_code=$?
	if [ "$exit_code" -eq 0 ]; then
			exit 0	# Exit without error if the script ended correctly
	fi

	trap '' EXIT	# Ignore new exit signals
	set +eu	# Do not exit anymore if a command fail or if a variable is empty

	echo -e "!!\n  $app's script has encountered an error. Its execution was cancelled.\n!!" >&2

	if type -t ynh_clean_setup > /dev/null; then	# Check if the function exist in the app script.
		ynh_clean_setup	# Call the function to do specific cleaning for the app.
	fi

	ynh_die	# Exit with error status
}

# Exit if an error occurs during the execution of the script.
#
# Stop immediatly the execution if an error occured or if a empty variable is used.
# The execution of the script is derivate to ynh_exit_properly function before exit.
#
# Usage: ynh_abort_if_errors
ynh_abort_if_errors () {
	set -eu	# Exit if a command fail, and if a variable is used unset.
	trap ynh_exit_properly EXIT	# Capturing exit signals on shell script
}

# Define and install dependencies with a equivs control file
# This helper can/should only be called once per app
#
# usage: ynh_install_app_dependencies dep [dep [...]]
# | arg: dep - the package name to install in dependence
ynh_install_app_dependencies () {
    dependencies=$@
    manifest_path="../manifest.json"
    if [ ! -e "$manifest_path" ]; then
    	manifest_path="../settings/manifest.json"	# Into the restore script, the manifest is not at the same place
    fi
    version=$(sudo python3 -c "import sys, json;print(json.load(open(\"$manifest_path\"))['version'])")	# Retrieve the version number in the manifest file.
    dep_app=${app//_/-}	# Replace all '_' by '-'

    if ynh_package_is_installed "${dep_app}-ynh-deps"; then
		echo "A package named ${dep_app}-ynh-deps is already installed" >&2
    else
        cat > ./${dep_app}-ynh-deps.control << EOF	# Make a control file for equivs-build
Section: misc
Priority: optional
Package: ${dep_app}-ynh-deps
Version: ${version}
Depends: ${dependencies// /, }
Architecture: all
Description: Fake package for ${app} (YunoHost app) dependencies
 This meta-package is only responsible of installing its dependencies.
EOF
        ynh_package_install_from_equivs ./${dep_app}-ynh-deps.control \
            || ynh_die "Unable to install dependencies"	# Install the fake package and its dependencies
        ynh_app_setting_set $app apt_dependencies $dependencies
    fi
}

# Remove fake package and its dependencies
#
# Dependencies will removed only if no other package need them.
#
# usage: ynh_remove_app_dependencies
ynh_remove_app_dependencies () {
    dep_app=${app//_/-}	# Replace all '_' by '-'
    ynh_package_autoremove ${dep_app}-ynh-deps	# Remove the fake package and its dependencies if they not still used.
}

# Check if a mysql user exists
#
# usage: ynh_mysql_user_exists user
# | arg: user - the user for which to check existence
function ynh_mysql_user_exists()
{
   local user=$1
   if [[ -z $(ynh_mysql_execute_as_root "SELECT User from mysql.user WHERE User = '$user';") ]]
   then
      return 1
   else
      return 0
   fi
}

# Create a database, an user and its password. Then store the password in the app's config
#
# After executing this helper, the password of the created database will be available in $db_pwd
# It will also be stored as "mysqlpwd" into the app settings.
#
# usage: ynh_mysql_setup_db user name
# | arg: user - Owner of the database
# | arg: name - Name of the database
ynh_mysql_setup_db () {
	local db_user="$1"
	local db_name="$2"
	db_pwd=$(ynh_string_random)	# Generate a random password
	ynh_mysql_create_db "$db_name" "$db_user" "$db_pwd"	# Create the database
	ynh_app_setting_set $app mysqlpwd $db_pwd	# Store the password in the app's config
}

# Remove a database if it exists, and the associated user
#
# usage: ynh_mysql_remove_db user name
# | arg: user - Owner of the database
# | arg: name - Name of the database
ynh_mysql_remove_db () {
	local db_user="$1"
	local db_name="$2"
	local mysql_root_password=$(sudo cat $MYSQL_ROOT_PWD_FILE)
	if mysqlshow -u root -p$mysql_root_password | grep -q "^| $db_name"; then	# Check if the database exists
		echo "Removing database $db_name" >&2
		ynh_mysql_drop_db $db_name	# Remove the database	
	else
		echo "Database $db_name not found" >&2
	fi

	# Remove mysql user if it exists
        if $(ynh_mysql_user_exists $db_user); then
		ynh_mysql_drop_user $db_user
	fi
}

# Sanitize a string intended to be the name of a database
# (More specifically : replace - and . by _)
#
# Exemple: dbname=$(ynh_sanitize_dbid $app)
#
# usage: ynh_sanitize_dbid name
# | arg: name - name to correct/sanitize
# | ret: the corrected name
ynh_sanitize_dbid () {
	dbid=${1//[-.]/_}	# We should avoid having - and . in the name of databases. They are replaced by _
	echo $dbid
}

# Substitute/replace a string by another in a file
#
# usage: ynh_replace_string match_string replace_string target_file
# | arg: match_string - String to be searched and replaced in the file
# | arg: replace_string - String that will replace matches
# | arg: target_file - File in which the string will be replaced.
ynh_replace_string () {
	delimit=@
	match_string=${1//${delimit}/"\\${delimit}"}	# Escape the delimiter if it's in the string.
	replace_string=${2//${delimit}/"\\${delimit}"}
	workfile=$3

	sudo sed --in-place "s${delimit}${match_string}${delimit}${replace_string}${delimit}g" "$workfile"
}

# Remove a file or a directory securely
#
# usage: ynh_secure_remove path_to_remove
# | arg: path_to_remove - File or directory to remove
ynh_secure_remove () {
	path_to_remove=$1
	forbidden_path=" \
	/var/www \
	/home/yunohost.app"

	if [[ "$forbidden_path" =~ "$path_to_remove" \
		# Match all paths or subpaths in $forbidden_path
		|| "$path_to_remove" =~ ^/[[:alnum:]]+$ \
		# Match all first level paths from / (Like /var, /root, etc...)
		|| "${path_to_remove:${#path_to_remove}-1}" = "/" ]]
		# Match if the path finishes by /. Because it seems there is an empty variable
	then
		echo "Avoid deleting $path_to_remove." >&2
	else
		if [ -e "$path_to_remove" ]
		then
			sudo rm -R "$path_to_remove"
		else
			echo "$path_to_remove wasn't deleted because it doesn't exist." >&2
		fi
	fi
}

# Create a system user
#
# usage: ynh_system_user_create user_name [home_dir]
# | arg: user_name - Name of the system user that will be create
# | arg: home_dir - Path of the home dir for the user. Usually the final path of the app. If this argument is omitted, the user will be created without home
ynh_system_user_create () {
	if ! ynh_system_user_exists "$1"	# Check if the user exists on the system
	then	# If the user doesn't exist
		if [ $# -ge 2 ]; then	# If a home dir is mentioned
			user_home_dir="-d $2"
		else
			user_home_dir="--no-create-home"
		fi
		sudo useradd $user_home_dir --system --user-group $1 --shell /usr/sbin/nologin || ynh_die "Unable to create $1 system account"
	fi
}

# Delete a system user
#
# usage: ynh_system_user_delete user_name
# | arg: user_name - Name of the system user that will be create
ynh_system_user_delete () {
    if ynh_system_user_exists "$1"	# Check if the user exists on the system
    then
		echo "Remove the user $1" >&2
		sudo userdel $1
	else
		echo "The user $1 was not found" >&2
    fi
}

# Restore a previous backup if the upgrade process failed
#
# usage:
# ynh_backup_before_upgrade
# ynh_clean_setup () {
# 	ynh_backup_after_failed_upgrade
# }
# ynh_abort_if_errors
#
ynh_backup_after_failed_upgrade () {
	echo "Upgrade failed." >&2
	app_bck=${app//_/-}	# Replace all '_' by '-'
    # Check if a existing backup can be found before remove and restore the application.
	if sudo yunohost backup list | grep -q $app_bck-pre-upgrade$backup_number
    then
    	# Remove the application then restore it
		sudo yunohost app remove $app
        # Restore the backup if the upgrade failed
		sudo yunohost backup restore --ignore-hooks $app_bck-pre-upgrade$backup_number --apps $app --force
		ynh_die "The app was restored to the way it was before the failed upgrade."
	fi
}

# Make a backup in case of failed upgrade
#
# usage:
# ynh_backup_before_upgrade
# ynh_clean_setup () {
# 	ynh_backup_after_failed_upgrade
# }
# ynh_abort_if_errors
#
ynh_backup_before_upgrade () {
	backup_number=1
	old_backup_number=2
	app_bck=${app//_/-}	# Replace all '_' by '-'
    # Check if a backup already exist with the prefix 1.
	if sudo yunohost backup list | grep -q $app_bck-pre-upgrade1
    then
        # Prefix become 2 to preserve the previous backup
		backup_number=2
		old_backup_number=1
	fi

	# Create another backup
	sudo yunohost backup create --ignore-hooks --apps $app --name $app_bck-pre-upgrade$backup_number
	if [ "$?" -eq 0 ]
    then
       	# If the backup succedded, remove the previous backup
		if sudo yunohost backup list | grep -q $app_bck-pre-upgrade$old_backup_number
        then
            # Remove the previous backup only if it exists
			sudo yunohost backup delete $app_bck-pre-upgrade$old_backup_number > /dev/null
		fi
	else
		ynh_die "Backup failed, the upgrade process was aborted."
	fi
}

# Create a dedicated nginx config
#
# usage: ynh_add_nginx_config
ynh_add_nginx_config () {
	finalnginxconf="/etc/nginx/conf.d/$domain.d/$app.conf"
	ynh_backup_if_checksum_is_different "$finalnginxconf" 1
	sudo cp ../conf/nginx.conf "$finalnginxconf"

	# To avoid a break by set -u, use a void substitution ${var:-}. If the variable is not set, it's simply set with an empty variable.
	# Substitute in a nginx config file only if the variable is not empty
	if test -n "${path_url:-}"; then
		ynh_replace_string "__PATH__" "$path_url" "$finalnginxconf"
	fi
	if test -n "${domain:-}"; then
		ynh_replace_string "__DOMAIN__" "$domain" "$finalnginxconf"
	fi
	if test -n "${port:-}"; then
		ynh_replace_string "__PORT__" "$port" "$finalnginxconf"
	fi
	if test -n "${app:-}"; then
		ynh_replace_string "__NAME__" "$app" "$finalnginxconf"
	fi
	if test -n "${final_path:-}"; then
		ynh_replace_string "__FINALPATH__" "$final_path" "$finalnginxconf"
	fi
	ynh_store_file_checksum "$finalnginxconf"

	sudo systemctl reload nginx
}

# Remove the dedicated nginx config
#
# usage: ynh_remove_nginx_config
ynh_remove_nginx_config () {
	ynh_secure_remove "/etc/nginx/conf.d/$domain.d/$app.conf"
	sudo systemctl reload nginx
}

# Create a dedicated php-fpm config
#
# usage: ynh_add_fpm_config
ynh_add_fpm_config () {
	finalphpconf="/etc/php5/fpm/pool.d/$app.conf"
	ynh_backup_if_checksum_is_different "$finalphpconf" 1
	sudo cp ../conf/php-fpm.conf "$finalphpconf"
	ynh_replace_string "__NAMETOCHANGE__" "$app" "$finalphpconf"
	ynh_replace_string "__FINALPATH__" "$final_path" "$finalphpconf"
	ynh_replace_string "__USER__" "$app" "$finalphpconf"
	sudo chown root: "$finalphpconf"
	ynh_store_file_checksum "$finalphpconf"

	if [ -e "../conf/php-fpm.ini" ]
	then
		finalphpini="/etc/php5/fpm/conf.d/20-$app.ini"
		ynh_backup_if_checksum_is_different "$finalphpini" 1
		sudo cp ../conf/php-fpm.ini "$finalphpini"
		sudo chown root: "$finalphpini"
		ynh_store_file_checksum "$finalphpini"
	fi

	sudo systemctl reload php5-fpm
}

# Remove the dedicated php-fpm config
#
# usage: ynh_remove_fpm_config
ynh_remove_fpm_config () {
	ynh_secure_remove "/etc/php5/fpm/pool.d/$app.conf"
	ynh_secure_remove "/etc/php5/fpm/conf.d/20-$app.ini" 2>&1
	sudo systemctl reload php5-fpm
}

# Calculate and store a file checksum into the app settings
#
# $app should be defined when calling this helper
#
# usage: ynh_store_file_checksum file
# | arg: file - The file on which the checksum will performed, then stored.
ynh_store_file_checksum () {
	local checksum_setting_name=checksum_${1//[\/ ]/_}	# Replace all '/' and ' ' by '_'
	ynh_app_setting_set $app $checksum_setting_name $(sudo md5sum "$1" | cut -d' ' -f1)
}

# Verify the checksum and backup the file if it's different
# This helper is primarily meant to allow to easily backup personalised/manually 
# modified config files.
#
# $app should be defined when calling this helper
#
# usage: ynh_backup_if_checksum_is_different file [compress]
# | arg: file - The file on which the checksum test will be perfomed.
# | arg: compress - 1 to compress the backup instead of a simple copy
# A compression is needed for a file which will be analyzed even if its name is different.
#
# | ret: Return the name a the backup file, or nothing
ynh_backup_if_checksum_is_different () {
	local file=$1
	local compress_backup=${2:-0}	# If $2 is empty, compress_backup will set at 0
	local checksum_setting_name=checksum_${file//[\/ ]/_}	# Replace all '/' and ' ' by '_'
	local checksum_value=$(ynh_app_setting_get $app $checksum_setting_name)
	if [ -n "$checksum_value" ]
	then	# Proceed only if a value was stored into the app settings
		if ! echo "$checksum_value $file" | sudo md5sum -c --status
		then	# If the checksum is now different
			backup_file="$file.backup.$(date '+%d.%m.%y_%Hh%M,%Ss')"
			if [ $compress_backup -eq 1 ]
			then
				sudo tar --create --gzip --file "$backup_file.tar.gz" "$file"	# Backup the current file and compress
				backup_file="$backup_file.tar.gz"
			else
				sudo cp -a "$file" "$backup_file"	# Backup the current file
			fi
			echo "File $file has been manually modified since the installation or last upgrade. So it has been duplicated in $backup_file" >&2
			echo "$backup_file"	# Return the name of the backup file
		fi
	fi
}

YNH_EXECUTION_DIR=$(pwd)
# Download, check integrity, uncompress and patch the source from app.src
#
# The file conf/app.src need to contains:
# 
# SOURCE_URL=Address to download the app archive
# SOURCE_SUM=Control sum
# # (Optional) Programm to check the integrity (sha256sum, md5sum$YNH_EXECUTION_DIR/...)
# # default: sha256
# SOURCE_SUM_PRG=sha256
# # (Optional) Archive format
# # default: tar.gz
# SOURCE_FORMAT=tar.gz
# # (Optional) Put false if source are directly in the archive root
# # default: true
# SOURCE_IN_SUBDIR=false
# # (Optionnal) Name of the local archive (offline setup support)
# # default: ${src_id}.${src_format}
# SOURCE_FILENAME=example.tar.gz 
#
# Details:
# This helper download sources from SOURCE_URL if there is no local source
# archive in /opt/yunohost-apps-src/APP_ID/SOURCE_FILENAME
# 
# Next, it check the integrity with "SOURCE_SUM_PRG -c --status" command.
# 
# If it's ok, the source archive will be uncompress in $dest_dir. If the
# SOURCE_IN_SUBDIR is true, the first level directory of the archive will be
# removed.
#
# Finally, patches named sources/patches/${src_id}-*.patch and extra files in
# sources/extra_files/$src_id will be applyed to dest_dir
#
#
# usage: ynh_setup_source dest_dir [source_id]
# | arg: dest_dir  - Directory where to setup sources
# | arg: source_id - Name of the app, if the package contains more than one app
ynh_setup_source () {
    local dest_dir=$1
    local src_id=${2:-app} # If the argument is not given, source_id equal "app"
    
    # Load value from configuration file (see above for a small doc about this file
    # format)
    local src_url=$(grep 'SOURCE_URL=' "$YNH_EXECUTION_DIR/../conf/${src_id}.src" | cut -d= -f2-)
    local src_sum=$(grep 'SOURCE_SUM=' "$YNH_EXECUTION_DIR/../conf/${src_id}.src" | cut -d= -f2-)
    local src_sumprg=$(grep 'SOURCE_SUM_PRG=' "$YNH_EXECUTION_DIR/../conf/${src_id}.src" | cut -d= -f2-)
    local src_format=$(grep 'SOURCE_FORMAT=' "$YNH_EXECUTION_DIR/../conf/${src_id}.src" | cut -d= -f2-)
    local src_in_subdir=$(grep 'SOURCE_IN_SUBDIR=' "$YNH_EXECUTION_DIR/../conf/${src_id}.src" | cut -d= -f2-)
    local src_filename=$(grep 'SOURCE_FILENAME=' "$YNH_EXECUTION_DIR/../conf/${src_id}.src" | cut -d= -f2-)
    
    # Default value
    src_sumprg=${src_sumprg:-sha256sum}
    src_in_subdir=${src_in_subdir:-true}
    src_format=${src_format:-tar.gz}
    src_format=$(echo "$src_format" | tr '[:upper:]' '[:lower:]')
    if [ "$src_filename" = "" ] ; then
        src_filename="${src_id}.${src_format}"
    fi
    local local_src="/opt/yunohost-apps-src/${YNH_APP_ID}/${src_filename}"

    if test -e "$local_src"
    then    # Use the local source file if it is present
        cp $local_src $src_filename
    else    # If not, download the source
        wget -nv -O $src_filename $src_url
    fi

    # Check the control sum
    echo "${src_sum} ${src_filename}" | ${src_sumprg} -c --status \
        || ynh_die "Corrupt source"

    # Extract source into the app dir
    mkdir -p "$dest_dir"
    if [ "$src_format" = "zip" ]
    then 
        # Zip format
        # Using of a temp directory, because unzip doesn't manage --strip-components
        if $src_in_subdir ; then
            local tmp_dir=$(mktemp -d)
            unzip -quo $src_filename -d "$tmp_dir"
            cp -a $tmp_dir/*/. "$dest_dir"
            ynh_secure_remove "$tmp_dir"
        else
            unzip -quo $src_filename -d "$dest_dir"
        fi
    else
        local strip=""
        if $src_in_subdir ; then
            strip="--strip-components 1"
        fi
        if [[ "$src_format" =~ ^tar.gz|tar.bz2|tar.xz$ ]] ; then
            tar -xf $src_filename -C "$dest_dir" $strip
        else
            ynh_die "Archive format unrecognized."
        fi
    fi

    # Apply patches
    if (( $(find $YNH_EXECUTION_DIR/../sources/patches/ -type f -name "${src_id}-*.patch" 2> /dev/null | wc -l) > "0" )); then
        local old_dir=$(pwd)
        (cd "$dest_dir" \
            && for p in $YNH_EXECUTION_DIR/../sources/patches/${src_id}-*.patch; do \
                patch -p1 < $p; done) \
            || ynh_die "Unable to apply patches"
        cd $old_dir
    fi

    # Add supplementary files
    if test -e "$YNH_EXECUTION_DIR/../sources/extra_files/${src_id}"; then
        cp -a $YNH_EXECUTION_DIR/../sources/extra_files/$src_id/. "$dest_dir"
    fi

}