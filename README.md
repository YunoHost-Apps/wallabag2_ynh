Wallabag v2 for Yunohost
------------------------

This is a work-in-progress Wallabag v2 package for YunoHost.

---

**NB: Since @jeromelebleu is no longer maintaining this package, I (@lapineige) take over this repository. But I have limited time and experience, so feel free to help !**

**Shipped version:** 2.2.2

[Wallabag](https://www.wallabag.org/) is a self hostable Read-It-Later application allowing
you to not miss any content anymore. Click, save, read it when you can.
It extracts content so that you can read it when you have time.

## Features

In addition to Wallabag core features, the following are made available with
this package:

 * Integrate with YunoHost users and SSO - i.e. logout button
 * Allow one user to be the administrator (set at the installation)
 * Asynchronous import using Redis (need to be enabled in the *Internal Settings*)

## TODO

 * Write the `backup` / `restore` scripts (meanwhile please make your own backup, e.g. with the export tool)
 * Refactor the application to apply for replacing wallabag v1 official application!

## Upgrade from v1

The upgrade from the [Wallabag v1](https://github.com/YunoHost-Apps/wallabag_ynh)
app requires a manual operation, that's why it's provided as a new package.
For the migration process, please refer to the
[official documentation](http://doc.wallabag.org/en/master/user/import.html#id6).

## Links

 * Report a bug: https://dev.yunohost.org/projects/apps/issues
 * Wallabag website: https://www.wallabag.org/
 * YunoHost website: https://yunohost.org/
