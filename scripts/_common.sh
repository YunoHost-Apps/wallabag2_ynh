#
# Common variables
#

# Wallabag version
VERSION="2.1.1"

# Package name for Wallabag dependencies
DEPS_PKG_NAME="wallabag-deps"

# Full Wallabag sources tarball URL
WALLABAG_SOURCE_URL="https://framabag.org/wallabag-release-${VERSION}.tar.gz"

# Full Wallabag sources tarball checksum
WALLABAG_SOURCE_SHA256="59649f777932cd5a0cbc950c57fffbee851cc4222dda5ecbb462900a6e2a7ef2"

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
    sudo sudo -u "$USER" $@
  fi
}

# Execute a command through the wallabag console
# usage: exec_console AS_USER WORKDIR COMMAND [ARG ...]
exec_console() {
  local AS_USER=$1
  local WORKDIR=$2
  shift 2

  (cd "$WORKDIR" && \
   exec_as "$AS_USER" php "bin/console" --no-interaction --env=prod $@)
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
