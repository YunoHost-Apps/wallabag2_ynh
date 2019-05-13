# Wallabag pour YunoHost

[![Integration level](https://dash.yunohost.org/integration/wallabag2.svg)](https://dash.yunohost.org/appci/app/wallabag2)  
[![Install Wallabag with YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=wallabag2)

*[Read this readme in english.](./README.md)* 

> *Ce package vous permet d'installer Wallabag rapidement et simplement sur un serveur Yunohost.  
Si vous n'avez pas YunoHost, regardez [ici](https://yunohost.org/#/install) pour savoir comment l'installer et en profiter.*

## Vue d'ensemble

[Wallabag](https://www.wallabag.org/) est une application de lecture différée : elle  permet simplement d’archiver une page web en ne conservant que le contenu. Les éléments superflus (menus, publicités, etc.) sont supprimés.

Sont disponibles: une interface web, des add-ons pour navigateurs (Firefox / Chrome / Opera), des applications pour mobile (Android / iOS / Windows Phone) et même sur liseuse (PocketBook / Kobo).

**Version incluse:** 2.3.2

## Captures d'écran

![](https://www.linuxbabe.com/wp-content/uploads/2016/10/wallabag-quick-start-page.png)

## Démo

* [Démo YunoHost](https://demo.yunohost.org/wallabag/)
* [Démo video](https://player.vimeo.com/video/167435064)

## Configuration

## Documentation

 * Documentation officielle: https://doc.wallabag.org/fr/
 * Documentation YunoHost: https://yunohost.org/#/app_wallabag2

## Caractéristiques spécifiques YunoHost

En plus des fonctionnalités principales de Wallabag, ce paquet propose également:

 * Une intégration avec le système de gestion des utilisateurs et le SSO de Yunohost - e.g. un bouton de déconnexion
 * De permettre à un utilisateur d'être administrateur (réglage lors de l'installation)
 * Un import asynchrone utilisant Redis (à activer dans les *Paramètres Internes*). L'import via RabbitMQ n'est pas (encore ?) supporté.

#### Support multi-utilisateurs

#### Supported architectures

* x86-64b - [![Build Status](https://ci-apps.yunohost.org/ci/logs/wallabag2%20%28Official%29.svg)](https://ci-apps.yunohost.org/ci/apps/wallabag2/)
* ARMv8-A - [![Build Status](https://ci-apps-arm.yunohost.org/ci/logs/wallabag2%20%28Official%29.svg)](https://ci-apps-arm.yunohost.org/ci/apps/wallabag2/)
* Jessie x86-64b - [![Build Status](https://ci-stretch.nohost.me/ci/logs/wallabag2%20%28Official%29.svg)](https://ci-stretch.nohost.me/ci/apps/wallabag2/)

## Limitations

* Supprimer un utilisateur Yunohost ne supprimera pas l'utilisateur Wallabag lié, il sera seulement désactivé. Vous devez le supprimer manuellement avant. Voir: https://github.com/YunoHost-Apps/wallabag2_ynh/issues/39

## Informations additionnelles

**NB: Depuis que @jeromelebleu ne maintient plus ce paquet, je (@lapineige) reprends la charge de ce dépôt. Mais j'ai un temps et une expérience limitées, donc n'hésitez pas à donner un coup de main :) !**


#### Mettre à niveau depuis la v1

La mise à niveau depuis le paquet Yunohost de [Wallabag v1](https://github.com/YunoHost-Apps/wallabag_ynh) demande une opération manuelle, c'est pourquoi un nouveau paquet est fournit.
Pour le processus de migration, merci de vous référer à [la documentation officiel de Wallabag](https://doc.wallabag.org/fr/user/import/wallabagv1.html).

## Links

 * Signaler un bug: https://github.com/YunoHost-Apps/wallabag2_ynh/issues
 * Site de l'application: https://www.wallabag.org/
 * Site web YunoHost: https://yunohost.org/

---

Informations pour les développeurs
----------------

**Seulement si vous voulez utiliser une branche de test pour le codage, au lieu de fusionner directement dans la banche principale.**
Merci de faire vos pull request sur la [branche testing](https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing).

Pour essayer la branche testing, procédez comme ceci:
```
sudo yunohost app install https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing --debug
ou
sudo yunohost app upgrade wallabag2 -u https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing --debug
```
Soyez concient que la branche testing *pourrait* contenir des bugs et n'est pas recommandée si vous recherchez la stabilité de votre application.
Une mise à jour classique avec `sudo yunohost app upgrade wallabag2` (sans préciser l'URL) fera retourner votre application au niveau de la branche master.
