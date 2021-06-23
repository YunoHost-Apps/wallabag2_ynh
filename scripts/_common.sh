#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

YNH_PHP_VERSION="7.3"

# dependencies used by the app
pkg_dependencies="php$YNH_DEFAULT_PHP_VERSION-cli php$YNH_DEFAULT_PHP_VERSION-mysql php$YNH_DEFAULT_PHP_VERSION-json php$YNH_DEFAULT_PHP_VERSION-gd php$YNH_DEFAULT_PHP_VERSION-tidy php$YNH_DEFAULT_PHP_VERSION-curl php$YNH_DEFAULT_PHP_VERSION-gettext php$YNH_DEFAULT_PHP_VERSION-redis"

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
