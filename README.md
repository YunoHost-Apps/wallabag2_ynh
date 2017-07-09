Wallabag v2 for Yunohost
------------------------

This is a Wallabag v2 package for YunoHost.

---

**NB: Since @jeromelebleu is no longer maintaining this package, I (@lapineige) take over this repository. But I have limited time and experience, so feel free to help !**

**Shipped version:** 2.2.3

[Wallabag](https://www.wallabag.org/) is a self hostable Read-It-Later application allowing
you to not miss any content anymore. Click, save, read it when you can.
It extracts content so that you can read it when you have time.

[![Install Wallabag v2 with 
YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=wallabag2)

## Features

In addition to Wallabag core features, the following are made available with
this package:

 * Integrate with YunoHost users and SSO - i.e. logout button
 * Allow one user to be the administrator (set at the installation)
 * Asynchronous import using Redis (need to be enabled in the *Internal Settings*)


## Upgrade from v1

The upgrade from the YunoHost [Wallabag v1](https://github.com/YunoHost-Apps/wallabag_ynh)
app requires a manual operation, that's why it's provided as a new package.
For the migration process, please refer to the
[Wallabag official documentation](https://doc.wallabag.org/fr/user/import/wallabagv1.html).

## Links

 * Report a bug: https://github.com/YunoHost-Apps/wallabag2_ynh/issues
 * Wallabag website: https://www.wallabag.org/
 * YunoHost website: https://yunohost.org/
