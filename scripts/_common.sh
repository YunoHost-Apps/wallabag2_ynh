#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

wb_conf="$install_dir/app/config/parameters.yml"

#=================================================
# PERSONAL HELPERS
#=================================================

function set_permissions {
  # Set permissions to app files
  chown -R $app:www-data $install_dir
  chmod -R g=u,g-w,o-rwx $install_dir

  # Restrict rights to Wallabag user only
  chmod 600 $wb_conf
  if [ -e $install_dir/var/cache/prod/appProdProjectContainer.php ]; then
    chmod 700 $install_dir/var/cache/prod/appProdProjectContainer.php
  fi
}

#=================================================
# EXPERIMENTAL HELPERS
#=================================================
