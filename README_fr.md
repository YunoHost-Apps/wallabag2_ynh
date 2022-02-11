# Wallabag pour YunoHost

[![Niveau d'intégration](https://dash.yunohost.org/integration/wallabag2.svg)](https://dash.yunohost.org/appci/app/wallabag2) ![](https://ci-apps.yunohost.org/ci/badges/wallabag2.status.svg) ![](https://ci-apps.yunohost.org/ci/badges/wallabag2.maintain.svg)  
[![Installer Wallabag avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=wallabag2)

*[Read this readme in english.](./README.md)*
*[Lire ce readme en français.](./README_fr.md)*

> *Ce package vous permet d'installer Wallabag rapidement et simplement sur un serveur YunoHost.
Si vous n'avez pas YunoHost, regardez [ici](https://yunohost.org/#/install) pour savoir comment l'installer et en profiter.*

## Vue d'ensemble

[Wallabag](https://www.wallabag.org/) est une application de lecture différée : elle  permet simplement d’archiver une page web en ne conservant que le contenu. Les éléments superflus (menus, publicités, etc.) sont supprimés.

Sont disponibles une interface web, des add-ons pour navigateurs (Firefox / Chrome / Opera), des applications pour mobile (Android / iOS / Windows Phone) et même sur liseuse (PocketBook / Kobo).


**Version incluse :** 2.4.2~ynh1

**Démo :** https://demo.yunohost.org/wallabag/

## Captures d'écran

![](./doc/screenshots/screenshot1.webp)

## Avertissements / informations importantes

### Caractéristiques spécifiques YunoHost

En plus des fonctionnalités principales de Wallabag, ce paquet propose également :

 * Une intégration avec le système de gestion des utilisateurs et le SSO de YunoHost - e.g. un bouton de déconnexion
 * De permettre à un utilisateur d'être administrateur (réglage lors de l'installation)
 * Un import asynchrone utilisant Redis (À  activer dans les *Paramètres Internes*). L'import via RabbitMQ n'est pas (encore ?) supporté.

### Limitations

* Supprimer un utilisateur YunoHost ne supprimera pas l'utilisateur Wallabag lié, il sera seulement désactivé. Vous devez le supprimer manuellement avant. Voir : https://github.com/YunoHost-Apps/wallabag2_ynh/issues/39

* La mise Ã  niveau depuis le paquet YunoHost de [Wallabag v1](https://github.com/YunoHost-Apps/wallabag_ynh) demande une opération manuelle, c'est pourquoi un nouveau paquet est fournit. Pour le processus de migration, merci de vous rÃ©fÃ©rer Ã  [la documentation officiel de Wallabag](https://doc.wallabag.org/fr/user/import/wallabagv1.html).


### Branche de test (*Testing*)
*Soyez concient que la branche testing* pourrait *contenir des bugs et n'est pas recommandée si vous recherchez la stabilité de votre application.*

Les personnes souhaitant (bêta) tester de nouvelles mises à jour (ex: une nouvelle version), listÃ©e dans la [section des Pull Requests](https://github.com/YunoHost-Apps/wallabag2_ynh/pulls), sont les bienvenues. Plus de tests nous permettrons de sortir des mises à jour plus vite. Pour tester la branche *testing*, utilisez `sudo yunohost app upgrade wallabag2 -u https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing`.

Attention : Une mise à jour classique avec l'interface d'administration ou avec `sudo yunohost app upgrade wallabag2` (sans préciser l'URL) fera retourner votre application au niveau de la branche master. *Ceci pourrait casser votre wallabag* si vous revenez à une version précédente (et si la nouvelle n'est pas rétrocompatible).


## Documentations et ressources

* Site officiel de l'app : https://www.wallabag.org
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