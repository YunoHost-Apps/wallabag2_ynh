#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

# dependencies used by the app
pkg_dependencies="php$YNH_DEFAULT_PHP_VERSION-cli php$YNH_DEFAULT_PHP_VERSION-mysql php$YNH_DEFAULT_PHP_VERSION-json php$YNH_DEFAULT_PHP_VERSION-gd php$YNH_DEFAULT_PHP_VERSION-tidy php$YNH_DEFAULT_PHP_VERSION-curl php$YNH_DEFAULT_PHP_VERSION-gettext php$YNH_DEFAULT_PHP_VERSION-redis"

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
