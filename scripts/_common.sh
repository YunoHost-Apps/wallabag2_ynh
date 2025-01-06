#!/bin/bash

#=================================================
# COMMON VARIABLES AND CUSTOM HELPERS
#=================================================

composer_version="2.7.7"

# Define a function to execute commands with `php_exec`
php_exec() {
  (cd "$install_dir" && ynh_exec_as_app \
      php${php_version} "$install_dir/bin/console" --no-interaction --env=prod "$@")
}
