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

