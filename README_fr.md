<!--
Nota bene : ce README est automatiquement généré par <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Il NE doit PAS être modifié à la main.
-->

# Wallabag pour YunoHost

[![Niveau d’intégration](https://dash.yunohost.org/integration/wallabag2.svg)](https://ci-apps.yunohost.org/ci/apps/wallabag2/) ![Statut du fonctionnement](https://ci-apps.yunohost.org/ci/badges/wallabag2.status.svg) ![Statut de maintenance](https://ci-apps.yunohost.org/ci/badges/wallabag2.maintain.svg)

[![Installer Wallabag avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=wallabag2)

*[Lire le README dans d'autres langues.](./ALL_README.md)*

> *Ce package vous permet d’installer Wallabag rapidement et simplement sur un serveur YunoHost.*  
> *Si vous n’avez pas YunoHost, consultez [ce guide](https://yunohost.org/install) pour savoir comment l’installer et en profiter.*

## Vue d’ensemble

Wallabag est une application de lecture différée : elle  permet simplement d’archiver une page web en ne conservant que le contenu. Les éléments superflus (menus, publicités, etc.) sont supprimés.
Sont disponibles une interface web, des add-ons pour navigateurs (Firefox/Chrome/Opera), des applications pour mobile (Android/iOS/Windows Phone) et même sur liseuse (PocketBook/Kobo).

La mise à niveau depuis le paquet YunoHost de [Wallabag v1](https://github.com/YunoHost-Apps/wallabag_ynh) demande une opération manuelle, c'est pourquoi un nouveau paquet est fournit. Pour le processus de migration, merci de vous référer à [la documentation officiel de Wallabag](https://doc.wallabag.org/fr/user/import/wallabagv1.html).


**Version incluse :** 2.5.4~ynh3

**Démo :** <https://demo.yunohost.org/wallabag/>

## Captures d’écran

![Capture d’écran de Wallabag](./doc/screenshots/screenshot1.webp)

## Documentations et ressources

- Site officiel de l’app : <https://www.wallabag.org>
- Documentation officielle de l’admin : <https://doc.wallabag.org/en/>
- Dépôt de code officiel de l’app : <https://github.com/wallabag/wallabag>
- YunoHost Store : <https://apps.yunohost.org/app/wallabag2>
- Signaler un bug : <https://github.com/YunoHost-Apps/wallabag2_ynh/issues>

## Informations pour les développeurs

Merci de faire vos pull request sur la [branche `testing`](https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing).

Pour essayer la branche `testing`, procédez comme suit :

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing --debug
ou
sudo yunohost app upgrade wallabag2 -u https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing --debug
```

**Plus d’infos sur le packaging d’applications :** <https://yunohost.org/packaging_apps>
