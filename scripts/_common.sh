#
# Common variables
#

# Wallabag version
VERSION="2.2.2"

# Package name for Wallabag dependencies
DEPS_PKG_NAME="wallabag-deps"

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
