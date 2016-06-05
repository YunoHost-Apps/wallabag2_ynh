Wallabag v2 for Yunohost
------------------------

**Warning! This is a work-in-process package... Please read the TODO below
to see what's not done yet. Also, note that you should install this app
for testing purpose only since there is no guarantee that the upgrade works
at the current state.**

**Shipped version:** 2.0.5

[Wallabag](https://www.wallabag.org/) is a self hostable application allowing
you to not miss any content anymore. Click, save, read it when you can. It
extracts content so that you can read it when you have time.

## TODO

 * Improve the LDAP integration, see [#1](https://github.com/YunoHost-Apps/wallabag2_ynh/issues/1)
 * Add a `post_user_create` hook to create new YunoHost users in Wallabag -
   or consider to do that dynamically
 * Write the `upgrade` / `backup` / `restore` scripts
 * Consider using composer to fetch dependencies and retrieve Wallabag sources
   from the git repository - as suggested in the
   [official documentation](http://doc.wallabag.org/en/master/user/installation.html#on-a-dedicated-web-server-recommended-way)

## Upgrade from v1

The upgrade from the [Wallabag v1](https://github.com/YunoHost-Apps/wallabag_ynh)
app requires a manual operation, that's why it's provided as a new package.
For the migration process, please refer to the
[official documentation](http://doc.wallabag.org/en/master/user/migration.html).

## Links

**Wallabag**: https://www.wallabag.org/

**YunoHost**: https://yunohost.org/
