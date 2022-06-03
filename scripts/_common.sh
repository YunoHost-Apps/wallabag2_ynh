#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

# Overload "default php" version to bypass package limitation not ready to use 7.4 yet (version 2.4.0 minimun. See https://github.com/wallabag/wallabag/blob/master/CHANGELOG.md#240)
# Fallback to php 7.3 as on debian 11 / bulleyes, 7.4 is used by default
YNH_DEFAULT_PHP_VERSION=7.3

# dependencies used by the app
pkg_dependencies="
php$YNH_DEFAULT_PHP_VERSION-cli
php$YNH_DEFAULT_PHP_VERSION-mysql
php$YNH_DEFAULT_PHP_VERSION-json
php$YNH_DEFAULT_PHP_VERSION-gd
php$YNH_DEFAULT_PHP_VERSION-tidy
php$YNH_DEFAULT_PHP_VERSION-curl
php$YNH_DEFAULT_PHP_VERSION-gettext
php$YNH_DEFAULT_PHP_VERSION-redis
php$YNH_DEFAULT_PHP_VERSION-common
"

#=================================================
# PERSONAL HELPERS
#=================================================

function set_permissions {
  # Set permissions to app files
  chown -R $app:www-data $final_path
  chmod -R g=u,g-w,o-rwx $final_path

  # Restrict rights to Wallabag user only
  chmod 600 $wb_conf
  if [ -e $final_path/var/cache/prod/appProdProjectContainer.php ]; then
    chmod 700 $final_path/var/cache/prod/appProdProjectContainer.php
  fi
}

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

# Execute a command as another user
# usage: exec_as USER COMMAND [ARG ...]
ynh_exec_as() {
  local USER=$1
  shift 1

  if [[ $USER = $(whoami) ]]; then
    eval "$@"
  else
    sudo -u "$USER" "$@"
  fi
}
