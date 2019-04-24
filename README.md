 Wallabag v2 for Yunohost - [English Version]
------------------------

This is a Wallabag v2 package for YunoHost.

![wallabag start screen](https://www.linuxbabe.com/wp-content/uploads/2016/10/wallabag-quick-start-page.png)


---

**NB: Since @jeromelebleu is no longer maintaining this package, I (@lapineige) take over this repository. But I have limited time and experience, so feel free to help !**

**Shipped version:** 2.3.2

[Wallabag](https://www.wallabag.org/) is a self hostable Read-It-Later application allowing
you to not miss any content anymore. Click, save, read it when you can.
It extracts content so that you can read it when you have time.

It provides a web interface, browser (Firefox / Chrome / Opera) add-ons, mobile apps (Android / iOS / Windows Phone) and even on e-reader (PocketBook / Kobo).

[![Install Wallabag v2 with 
YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=wallabag2)

## Features

In addition to Wallabag core features, the following are made available with
this package:

 * Integrate with YunoHost users and SSO - i.e. logout button
 * Allow one user to be the administrator (set at the installation)
 * Asynchronous import using Redis (need to be enabled in the *Internal Settings*). RabbitMQ import not supported (yet ?)
 * Supports fail2ban - protects you from password brute force attacks.

## Known issue(s)
- Removing a Yunohost's user won't delete the related wallabag user, but only desactivate it. You need to manualy remove it from wallabag before. See: https://github.com/YunoHost-Apps/wallabag2_ynh/issues/39

## Upgrade from v1

The upgrade from the YunoHost [Wallabag v1](https://github.com/YunoHost-Apps/wallabag_ynh)
app requires a manual operation, that's why it's provided as a new package.
For the migration process, please refer to the
[Wallabag official documentation](https://doc.wallabag.org/en/user/import/wallabagv1.html).

## Links

 * Report a bug: https://github.com/YunoHost-Apps/wallabag2_ynh/issues
 * Wallabag website: https://www.wallabag.org/
 * Wallabag documentation: https://doc.wallabag.org/ (fr/en/it/de)
 * YunoHost website: https://yunohost.org/
 * [Video demo](https://player.vimeo.com/video/167435064)
 
--- 
---
Wallabag pour Yunohost - [Version Française]
---

Paquet Wallabag v2 pour Yunohost.

---

**NB: Depuis que @jeromelebleu ne maintiens plus ce paquet, je (@lapineige) reprends la charge de ce dépôt. Mais j'ai un temps et une expérience limitées, donc n'hésitez pas à donner un coup de main :) !**

**Version actuelle:** 2.3.2

[Wallabag](https://www.wallabag.org/) est une application de lecture différée : elle  permet simplement d’archiver une page web en ne conservant que le contenu. Les éléments superflus (menus, publicités, etc.) sont supprimés.

Sont disponibles: une interface web, des add-ons pour navigateurs (Firefox / Chrome / Opera), des applications pour mobile (Android / iOS / Windows Phone) et même sur liseuse (PocketBook / Kobo).

[![Install Wallabag v2 with 
YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=wallabag2)

## Fonctionnalités

En plus des fonctionnalités principales de Wallabag, ce paquet propose également:

 * Une intégration avec le système de gestion des utilisateurs et le SSO de Yunohost - e.g. un bouton de déconnexion
 * De permettre à un utilisateur d'être administrateur (réglage lors de l'installation)
 * Un import asynchrone utilisant Redis (à activer dans les *Paramètres Internes*). L'import via RabbitMQ n'est pas (encore ?) supporté.


## Problème(s) connu(s)
- Supprimer un utilisateur Yunohost ne supprimera pas l'utilisateur Wallabag lié, il sera seulement désactivé. Vous devez le supprimer manuellement avant. Voir: https://github.com/YunoHost-Apps/wallabag2_ynh/issues/39

## Mettre à niveau depuis la v1

La mise à niveau depuis le paquet Yunohost de [Wallabag v1](https://github.com/YunoHost-Apps/wallabag_ynh) demande une opération manuelle, c'est pourquoi un nouveau paquet est fournit.
Pour le processus de migration, merci de vous référer à [la documentation officiel de Wallabag](https://doc.wallabag.org/fr/user/import/wallabagv1.html).

## Liens

 * Rapport de bug: https://github.com/YunoHost-Apps/wallabag2_ynh/issues
 * Site web de Wallabag: https://www.wallabag.org/
 * Documentation de Wallabag: https://doc.wallabag.org/ (fr/en/it/de)
 * Site web de YunoHost: https://yunohost.org/
 * [Demo vidéo](https://player.vimeo.com/video/167435064)

