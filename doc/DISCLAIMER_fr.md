## Caractéristiques spécifiques YunoHost

En plus des fonctionnalités principales de Wallabag, ce paquet propose également :

 * Une intégration avec le système de gestion des utilisateurs et le SSO de YunoHost - e.g. un bouton de déconnexion
 * De permettre à un utilisateur d'être administrateur (réglage lors de l'installation)
 * Un import asynchrone utilisant Redis (à activer dans les *Paramètres Internes*). L'import via RabbitMQ n'est pas (encore ?) supporté.

## Limitations

* Supprimer un utilisateur YunoHost ne supprimera pas l'utilisateur Wallabag lié, il sera seulement désactivé. Vous devez le supprimer manuellement avant. Voir : https://github.com/YunoHost-Apps/wallabag2_ynh/issues/39
