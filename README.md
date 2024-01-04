<!--
N.B.: This README was automatically generated by https://github.com/YunoHost/apps/tree/master/tools/README-generator
It shall NOT be edited by hand.
-->

# Wallabag for YunoHost

[![Integration level](https://dash.yunohost.org/integration/wallabag2.svg)](https://dash.yunohost.org/appci/app/wallabag2) ![Working status](https://ci-apps.yunohost.org/ci/badges/wallabag2.status.svg) ![Maintenance status](https://ci-apps.yunohost.org/ci/badges/wallabag2.maintain.svg)

[![Install Wallabag with YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=wallabag2)

*[Lire ce readme en français.](./README_fr.md)*

> *This package allows you to install Wallabag quickly and simply on a YunoHost server.
If you don't have YunoHost, please consult [the guide](https://yunohost.org/#/install) to learn how to install it.*

## Overview

[Wallabag](https://www.wallabag.org/) is a self hostable Read-It-Later application allowing you to not miss any content anymore. Click, save, read it when you can.
It extracts content so that you can read it when you have time.

It provides a web interface, browser (Firefox / Chrome / Opera) add-ons, mobile apps (Android / iOS / Windows Phone) and even on e-reader (PocketBook / Kobo).


**Shipped version:** 2.6.8~ynh1

**Demo:** https://demo.yunohost.org/wallabag/

## Screenshots

![Screenshot of Wallabag](./doc/screenshots/screenshot1.webp)

## Disclaimers / important information

### YunoHost specific features
In addition to Wallabag core features, the following are made available with this package:

 * Integrate with YunoHost users and SSO - i.e. logout button
 * Allow one user to be the administrator (set at the installation)
 * Asynchronous import using *Redis* (need to be enabled in the *Internal Settings*). *RabbitMQ* import not supported (yet?).

### Limitations

* Removing a Yunohost's user won't delete the related wallabag user, but only desactivate it. You need to manualy remove it from wallabag before. See: https://github.com/YunoHost-Apps/wallabag2_ynh/issues/39
* Upgrade from the YunoHost [Wallabag v1](https://github.com/YunoHost-Apps/wallabag_ynh) app requires a manual operation. That's why it's provided as a new package. For the migration process, please refer to the [Wallabag official documentation](https://doc.wallabag.org/en/user/import/wallabagv1.html).

### (Beta) Testing branch
*Please be aware that the testing branch (or any PR branch)* might *contains some bugs and is not recommended if you need a stable app.*

(Beta) Testers are welcome to try new upgrades (such as a new version), as listed in the [Pull Requests section](https://github.com/YunoHost-Apps/wallabag2_ynh/pulls). More testing will allow us to provide upgrades faster 🙂. In order to try the testing branch, use `sudo yunohost app upgrade wallabag2 -u https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing`.

Warning : Doing a normal upgrade of the package with the web admin or `sudo yunohost app upgrade wallabag2` (without any URL specified) will revert you app to the master branch. *This may break you wallabag* if it goes to a previous version (if the newest is not retrocompatible).
## Documentation and resources

* Official app website: <https://www.wallabag.org>
* Official admin documentation: <https://doc.wallabag.org/en/>
* Upstream app code repository: <https://github.com/wallabag/wallabag>
* YunoHost Store: <https://apps.yunohost.org/app/wallabag2>
* Report a bug: <https://github.com/YunoHost-Apps/wallabag2_ynh/issues>

## Developer info

Please send your pull request to the [testing branch](https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing).

To try the testing branch, please proceed like that.

``` bash
sudo yunohost app install https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing --debug
or
sudo yunohost app upgrade wallabag2 -u https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing --debug
```

**More info regarding app packaging:** <https://yunohost.org/packaging_apps>
