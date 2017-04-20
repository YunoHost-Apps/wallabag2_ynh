#
# Common variables
#

# Wallabag version
VERSION="2.2.2"

# Package dependencies
PKG_DEPENDENCIES="php5-cli php5-mysql php5-json php5-gd php5-tidy php5-curl php-gettext redis-server"

# Full Wallabag sources tarball URL
WALLABAG_SOURCE_URL="https://static.wallabag.org/releases/wallabag-release-${VERSION}.tar.gz"

# Full Wallabag sources tarball checksum
WALLABAG_SOURCE_SHA256="40d98bd556116dbc28f92339f0e5b93836ece87dcb01e7aaa628ea98855a1f51"

# App package root directory should be the parent folder
PKGDIR=$(cd ../; pwd)

#
# Common helpers
#

# Source app helpers
. /usr/share/yunohost/helpers

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

# Download and extract Wallabag sources to the given directory
# usage: extract_wallabag DESTDIR [AS_USER]
extract_wallabag() {
  local DESTDIR=$1
  local AS_USER=${2:-$USER}

  # retrieve and extract Roundcube tarball
  wb_tarball="/tmp/wallabag.tar.gz"
  rm -f "$wb_tarball"
  wget -q -O "$wb_tarball" "$WALLABAG_SOURCE_URL" \
    || ynh_die "Unable to download Wallabag tarball"
  echo "$WALLABAG_SOURCE_SHA256 $wb_tarball" | sha256sum -c >/dev/null \
    || ynh_die "Invalid checksum of downloaded tarball"
  exec_as "$AS_USER" tar xf "$wb_tarball" -C "$DESTDIR" --strip-components 1 \
    || ynh_die "Unable to extract Wallabag tarball"
  rm -f "$wb_tarball"

  # apply patches
  (cd "$DESTDIR" \
   && for p in ${PKGDIR}/patches/*.patch; do patch -p1 < $p; done) \
    || ynh_die "Unable to apply patches to Wallabag"
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

CHECK_USER () {	# Check user validity
# $1 = User
	ynh_user_exists "$1" || ynh_die "Wrong user"
}

CHECK_DOMAINPATH () {	# Check domain/path availability
	sudo yunohost app checkurl $domain$path_url -a $app
}

CHECK_FINALPATH () {	# Check if destination directory already exists
	final_path="/var/www/$app"
	test ! -e "$final_path" || ynh_die "This path already contains a folder"
}


BACKUP_FAIL_UPGRADE () {
	WARNING echo "Upgrade failed."
	app_bck=${app//_/-}	# Replace all '_' by '-'
	if sudo yunohost backup list | grep -q $app_bck-pre-upgrade$backup_number; then	# Check if existing archive before removing app and restoring
		sudo yunohost app remove $app	# Remove app before restoring it
		sudo yunohost backup restore --ignore-hooks $app_bck-pre-upgrade$backup_number --apps $app --force	# Restore the backup if upgrade failed
		ynh_die "The app was restored to the way it was before the failed upgrade."
	fi
}

BACKUP_BEFORE_UPGRADE () {	# Backup the current version of the app, restore it if the upgrade fails
	backup_number=1
	old_backup_number=2
	app_bck=${app//_/-}	# Replace all '_' by '-'
	if sudo yunohost backup list | grep -q $app_bck-pre-upgrade1; then	# Check for existing archive numbered 1
		backup_number=2	# And change archive number to 2
		old_backup_number=1
	fi

	sudo yunohost backup create --ignore-hooks --apps $app --name $app_bck-pre-upgrade$backup_number	# Create a backup different from the existing one
	if [ "$?" -eq 0 ]; then	# If backup succfessful, delete former archive
		if sudo yunohost backup list | grep -q $app_bck-pre-upgrade$old_backup_number; then	# Check for existing archive before removing it
			QUIET sudo yunohost backup delete $app_bck-pre-upgrade$old_backup_number
		fi
	else	# If backup failed
		ynh_die "Backup failed, the upgrade process was aborted."
	fi
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


# Correct the name given in argument for mariadb
# Avoid invalid characters in your database name
#
# Exemple: dbname=$(ynh_sanitize_dbid $app)
#
# usage: ynh_sanitize_dbid name
# | arg: name - name to correct/sanitize
# | ret: the corrected name
ynh_sanitize_dbid () {
	dbid=${1//[-.]/_}	# Mariadb doesn't support - and . in the name of databases. It will be replace by _
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