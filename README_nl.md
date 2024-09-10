<!--
NB: Deze README is automatisch gegenereerd door <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Hij mag NIET handmatig aangepast worden.
-->

# Wallabag voor Yunohost

[![Integratieniveau](https://dash.yunohost.org/integration/wallabag2.svg)](https://ci-apps.yunohost.org/ci/apps/wallabag2/) ![Mate van functioneren](https://ci-apps.yunohost.org/ci/badges/wallabag2.status.svg) ![Onderhoudsstatus](https://ci-apps.yunohost.org/ci/badges/wallabag2.maintain.svg)

[![Wallabag met Yunohost installeren](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=wallabag2)

*[Deze README in een andere taal lezen.](./ALL_README.md)*

> *Met dit pakket kun je Wallabag snel en eenvoudig op een YunoHost-server installeren.*  
> *Als je nog geen YunoHost hebt, lees dan [de installatiehandleiding](https://yunohost.org/install), om te zien hoe je 'm installeert.*

## Overzicht

Wallabag is a self hostable Read-It-Later application allowing you to not miss any content anymore. Click, save, read it when you can.
It provides a web interface, browser (Firefox/Chrome/Opera) add-ons, mobile apps (Android/iOS/Windows Phone) and even on e-reader (PocketBook/Kobo).

Upgrade from the YunoHost [Wallabag v1](https://github.com/YunoHost-Apps/wallabag_ynh) app requires a manual operation. That's why it's provided as a new package. For the migration process, please refer to the [Wallabag official documentation](https://doc.wallabag.org/en/user/import/wallabagv1.html).


**Geleverde versie:** 2.5.4~ynh6

**Demo:** <https://demo.yunohost.org/wallabag/>

## Schermafdrukken

![Schermafdrukken van Wallabag](./doc/screenshots/screenshot1.webp)

## Documentatie en bronnen

- Officiele website van de app: <https://www.wallabag.org>
- Officiele beheerdersdocumentatie: <https://doc.wallabag.org/en/>
- Upstream app codedepot: <https://github.com/wallabag/wallabag>
- YunoHost-store: <https://apps.yunohost.org/app/wallabag2>
- Meld een bug: <https://github.com/YunoHost-Apps/wallabag2_ynh/issues>

## Ontwikkelaarsinformatie

Stuur je pull request alsjeblieft naar de [`testing`-branch](https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing).

Om de `testing`-branch uit te proberen, ga als volgt te werk:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing --debug
of
sudo yunohost app upgrade wallabag2 -u https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing --debug
```

**Verdere informatie over app-packaging:** <https://yunohost.org/packaging_apps>
