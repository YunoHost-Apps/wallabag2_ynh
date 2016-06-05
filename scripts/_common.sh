#
# Common variables
#

# Wallabag version
VERSION=2.0.5

# Package name for Wallabag dependencies
DEPS_PKG_NAME="wallabag-deps"

## Wallabag git repository URL
#WALLABAG_GIT_URL="https://github.com/wallabag/wallabag.git"

# Full Wallabag sources tarball URL
WALLABAG_SOURCE_URL="https://framabag.org/wallabag-release-${VERSION}.tar.gz"

# Full Wallabag sources tarball checksum
WALLABAG_SOURCE_SHA256="c3df0fe67782538cc7fbdeedb48845a8a23eceb11b58888fbd8ee3b97f8842fc"

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

## Execute a composer command from a given directory
## usage: exec_composer AS_USER WORKDIR COMMAND [ARG ...]
#exec_composer() {
#  local AS_USER=$1
#  local WORKDIR=$2
#  shift 2
#
#  exec_as "$AS_USER" COMPOSER_HOME="${WORKDIR}/.composer" SYMFONY_ENV=prod \
#    php "${WORKDIR}/composer.phar" $@ \
#      -d "${WORKDIR}" --no-interaction
#}

## Install and initialize Composer in the given directory
## usage: init_composer DESTDIR [AS_USER]
#init_composer() {
#  local DESTDIR=$1
#  local AS_USER=${2:-$USER}
#
#  # install composer
#  curl -sS https://getcomposer.org/installer \
#    | COMPOSER_HOME="${DESTDIR}/.composer" \
#        php -- --quiet --install-dir="$DESTDIR" \
#    || die "Unable to install Composer"
# 
#  # install dependencies
#  exec_composer "$AS_USER" "$DESTDIR" install --no-dev --prefer-dist
#}

# Execute a command through the wallabag console
# usage: exec_console AS_USER WORKDIR COMMAND [ARG ...]
exec_console() {
  local AS_USER=$1
  local WORKDIR=$2
  shift 2

  (cd "$WORKDIR" && \
   exec_as "$AS_USER" php "bin/console" --no-interaction --env=prod $@)
}

## Fetch git repository and checkout Wallabag version to the given directory
## usage: clone_wallabag DESTDIR
#clone_wallabag() {
#  local DESTDIR=$1
#
#  # clone git repository
#  git clone -q "$WALLABAG_GIT_URL" "$DESTDIR" \
#    || ynh_die "Unable to fetch Wallabag sources"
#  (cd "$DESTDIR" && git checkout -q "$VERSION") \
#    || ynh_die "Unable to retrieve Wallabag version"
#}

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
