Wallabag v2 for Yunohost
------------------------

**Warning! This is a work-in-process package... Please read the TODO below
to see what's not done yet. Also, note that you should install this app
for testing purpose only since there is no guarantee that the upgrade works
at the current state.**

**Shipped version:** 2.0.4

[Wallabag](https://www.wallabag.org/) is a self hostable application allowing
you to not miss any content anymore. Click, save, read it when you can. It
extracts content so that you can read it when you have time.

## TODO

 * Consider using composer to fetch dependencies and retrieve Wallabag sources
   from the git repository - as suggested in the
   [official documentation](http://doc.wallabag.org/en/master/user/installation.html#on-a-dedicated-web-server-recommended-way)
 * Add a `post_user_create` hook to create new YunoHost users in Wallabag -
   or considering to do that dynamically
 * Write the upgrade / backup / restore scripts

## Upgrade from v1

The upgrade from the [Wallabag v1](https://github.com/YunoHost-Apps/wallabag_ynh)
app requires a manual operation, that's why it's provided as a new package.
For the migration process, please refer to the
[official documentation](http://doc.wallabag.org/en/master/user/migration.html).

## Limitation

This application does not connect to the LDAP yet which is needed to retrieve
users information - such as the password. One consequence is that you will
not be able to use third-party applications which are not Web browser add-on -
i.e. the Android application. Conversely, the add-ons for Firefox and Chrome
will work as long as you're connected to the SSO.
It is nevertheless a [planned feature](https://github.com/wallabag/wallabag/issues/966)
for the v2.1 and will be provided by this package as soon as it's implemented.

## Links

**Wallabag**: https://www.wallabag.org/

**YunoHost**: https://yunohost.org/
