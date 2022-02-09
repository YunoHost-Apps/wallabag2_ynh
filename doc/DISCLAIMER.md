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
