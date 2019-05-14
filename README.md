# Wallabag for YunoHost

[![Integration level](https://dash.yunohost.org/integration/wallabag2.svg)](https://dash.yunohost.org/appci/app/wallabag2)  
[![Install Wallabag with YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=wallabag2)

*[Lire ce readme en français.](./README_fr.md)*

> *This package allow you to install Wallabag quickly and simply on a YunoHost server.  
If you don't have YunoHost, please see [here](https://yunohost.org/#/install) to know how to install and enjoy it.*

## Overview

[Wallabag](https://www.wallabag.org/) is a self hostable Read-It-Later application allowing
you to not miss any content anymore. Click, save, read it when you can.
It extracts content so that you can read it when you have time.

It provides a web interface, browser (Firefox / Chrome / Opera) add-ons, mobile apps (Android / iOS / Windows Phone) and even on e-reader (PocketBook / Kobo).

**Shipped version:** 2.3.8

## Screenshots

![](https://www.linuxbabe.com/wp-content/uploads/2016/10/wallabag-quick-start-page.png)

## Demo

* [YunoHost demo](https://demo.yunohost.org/wallabag/)
* [Video demo](https://player.vimeo.com/video/167435064)

## Configuration

## Documentation

 * Official documentation: https://doc.wallabag.org/en/
 * YunoHost documentation: https://yunohost.org/#/app_wallabag2

## YunoHost specific features

In addition to Wallabag core features, the following are made available with
this package:

 * Integrate with YunoHost users and SSO - i.e. logout button
 * Allow one user to be the administrator (set at the installation)
 * Asynchronous import using Redis (need to be enabled in the *Internal Settings*). RabbitMQ import not supported (yet ?)

#### Multi-users support

#### Supported architectures

* x86-64b - [![Build Status](https://ci-apps.yunohost.org/ci/logs/wallabag2%20%28Official%29.svg)](https://ci-apps.yunohost.org/ci/apps/wallabag2/)
* ARMv8-A - [![Build Status](https://ci-apps-arm.yunohost.org/ci/logs/wallabag2%20%28Official%29.svg)](https://ci-apps-arm.yunohost.org/ci/apps/wallabag2/)
* Jessie x86-64b - [![Build Status](https://ci-stretch.nohost.me/ci/logs/wallabag2%20%28Official%29.svg)](https://ci-stretch.nohost.me/ci/apps/wallabag2/)

## Limitations

* Removing a Yunohost's user won't delete the related wallabag user, but only desactivate it. You need to manualy remove it from wallabag before. See: https://github.com/YunoHost-Apps/wallabag2_ynh/issues/39

## Additional information

**NB: Since @jeromelebleu is no longer maintaining this package, I (@lapineige) take over this repository. But I have limited time and experience, so feel free to help !**

#### Upgrade from v1

The upgrade from the YunoHost [Wallabag v1](https://github.com/YunoHost-Apps/wallabag_ynh)
app requires a manual operation, that's why it's provided as a new package.
For the migration process, please refer to the
[Wallabag official documentation](https://doc.wallabag.org/en/user/import/wallabagv1.html).

## Links

 * Report a bug: https://github.com/YunoHost-Apps/wallabag2_ynh/issues
 * App website: https://www.wallabag.org/
 * YunoHost website: https://yunohost.org/

---

Developers and testers info
----------------

**Only if you want to use a testing branch for coding, instead of merging directly into master.**
Please do your pull request to the [testing branch](https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing).

To try the testing branch, please proceed like that:
```
sudo yunohost app install https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing --debug
or
sudo yunohost app upgrade wallabag2 -u https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing --debug
```
Please be aware that the testing branch *might* contains some bugs and is not recommended if you need a stable app.
Doing a normal upgrade of the package avec `sudo yunohost app upgrade wallabag2` (without any URL specified) will revert you app to the master branch.
