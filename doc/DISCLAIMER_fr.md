En plus des fonctionnalit�s principales de Wallabag, ce paquet propose �galement :

 * Une int�gration avec le syst�me de gestion des utilisateurs et le SSO de YunoHost - e.g. un bouton de d�connexion
 * De permettre � un utilisateur d'�tre administrateur (r�glage lors de l'installation)
 * Un import asynchrone utilisant Redis (� activer dans les *Param�tres Internes*). L'import via RabbitMQ n'est pas (encore ?) support�.

## Limitations

* Supprimer un utilisateur YunoHost ne supprimera pas l'utilisateur Wallabag li�, il sera seulement d�sactiv�. Vous devez le supprimer manuellement avant. Voir : https://github.com/YunoHost-Apps/wallabag2_ynh/issues/39

#### Mettre � niveau depuis la v1

La mise � niveau depuis le paquet YunoHost de [Wallabag v1](https://github.com/YunoHost-Apps/wallabag_ynh) demande une op�ration manuelle, c'est pourquoi un nouveau paquet est fournit.
Pour le processus de migration, merci de vous r�f�rer � [la documentation officiel de Wallabag](https://doc.wallabag.org/fr/user/import/wallabagv1.html).
