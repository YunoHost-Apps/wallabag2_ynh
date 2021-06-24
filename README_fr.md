# Wallabag pour YunoHost

[![Niveau d'intégration](https://dash.yunohost.org/integration/wallabag2.svg)](https://dash.yunohost.org/appci/app/wallabag2) ![](https://ci-apps.yunohost.org/ci/badges/wallabag2.status.svg) ![](https://ci-apps.yunohost.org/ci/badges/wallabag2.maintain.svg)  
[![Installer Wallabag avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=wallabag2)

*[Read this readme in english.](./README.md)*
*[Lire ce readme en français.](./README_fr.md)*

> *Ce package vous permet d'installer Wallabag rapidement et simplement sur un serveur YunoHost.
Si vous n'avez pas YunoHost, regardez [ici](https://yunohost.org/#/install) pour savoir comment l'installer et en profiter.*

## Vue d'ensemble

Une application de lecture-plus-tard auto-hébergeable

**Version incluse :** 2.4.2~ynh1

**Démo :** https://demo.yunohost.org/wallabag/

## Captures d'écran

![](./doc/screenshots/wallabag-quick-start-page.png)

## Avertissements / informations importantes

## Caractéristiques spécifiques YunoHost

En plus des fonctionnalités principales de Wallabag, ce paquet propose également :

 * Une intégration avec le système de gestion des utilisateurs et le SSO de YunoHost - e.g. un bouton de déconnexion
 * De permettre à un utilisateur d'être administrateur (réglage lors de l'installation)
 * Un import asynchrone utilisant Redis (à activer dans les *Paramètres Internes*). L'import via RabbitMQ n'est pas (encore ?) supporté.

## Limitations

* Supprimer un utilisateur YunoHost ne supprimera pas l'utilisateur Wallabag lié, il sera seulement désactivé. Vous devez le supprimer manuellement avant. Voir : https://github.com/YunoHost-Apps/wallabag2_ynh/issues/39

## Documentations et ressources

* Site officiel de l'app : https://www.wallabag.org
* Documentation officielle utilisateur : https://yunohost.org/#/app_wallabag2
* Documentation officielle de l'admin : https://doc.wallabag.org/en/
* Dépôt de code officiel de l'app : https://github.com/wallabag/wallabag
* Documentation YunoHost pour cette app : https://yunohost.org/app_wallabag2
* Signaler un bug : https://github.com/YunoHost-Apps/wallabag2_ynh/issues

## Informations pour les développeurs

Merci de faire vos pull request sur la [branche testing](https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing).

Pour essayer la branche testing, procédez comme suit.
```
sudo yunohost app install https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing --debug
ou
sudo yunohost app upgrade wallabag2 -u https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing --debug
```

**Plus d'infos sur le packaging d'applications :** https://yunohost.org/packaging_apps