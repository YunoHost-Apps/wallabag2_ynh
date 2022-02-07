En plus des fonctionnalités principales de Wallabag, ce paquet propose également :

 * Une intégration avec le système de gestion des utilisateurs et le SSO de YunoHost - e.g. un bouton de déconnexion
 * De permettre à un utilisateur d'être administrateur (réglage lors de l'installation)
 * Un import asynchrone utilisant Redis (à activer dans les *Paramètres Internes*). L'import via RabbitMQ n'est pas (encore ?) supporté.

## Limitations

* Supprimer un utilisateur YunoHost ne supprimera pas l'utilisateur Wallabag lié, il sera seulement désactivé. Vous devez le supprimer manuellement avant. Voir : https://github.com/YunoHost-Apps/wallabag2_ynh/issues/39

#### Mettre à niveau depuis la v1

La mise à niveau depuis le paquet YunoHost de [Wallabag v1](https://github.com/YunoHost-Apps/wallabag_ynh) demande une opération manuelle, c'est pourquoi un nouveau paquet est fournit.
Pour le processus de migration, merci de vous référer à [la documentation officiel de Wallabag](https://doc.wallabag.org/fr/user/import/wallabagv1.html).
