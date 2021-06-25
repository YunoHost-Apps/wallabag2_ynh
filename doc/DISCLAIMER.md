## YunoHost specific features

In addition to Wallabag core features, the following are made available with this package:

 * Integrate with YunoHost users and SSO - i.e. logout button
 * Allow one user to be the administrator (set at the installation)
 * Asynchronous import using Redis (need to be enabled in the *Internal Settings*). RabbitMQ import not supported (yet?)

## Limitations

* Removing a Yunohost's user won't delete the related wallabag user, but only desactivate it. You need to manualy remove it from wallabag before. See: https://github.com/YunoHost-Apps/wallabag2_ynh/issues/39
