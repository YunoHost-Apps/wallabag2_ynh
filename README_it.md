<!--
N.B.: Questo README è stato automaticamente generato da <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
NON DEVE essere modificato manualmente.
-->

# Wallabag per YunoHost

[![Livello di integrazione](https://dash.yunohost.org/integration/wallabag2.svg)](https://dash.yunohost.org/appci/app/wallabag2) ![Stato di funzionamento](https://ci-apps.yunohost.org/ci/badges/wallabag2.status.svg) ![Stato di manutenzione](https://ci-apps.yunohost.org/ci/badges/wallabag2.maintain.svg)

[![Installa Wallabag con YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=wallabag2)

*[Leggi questo README in altre lingue.](./ALL_README.md)*

> *Questo pacchetto ti permette di installare Wallabag su un server YunoHost in modo semplice e veloce.*  
> *Se non hai YunoHost, consulta [la guida](https://yunohost.org/install) per imparare a installarlo.*

## Panoramica

Wallabag is a self hostable Read-It-Later application allowing you to not miss any content anymore. Click, save, read it when you can.
It provides a web interface, browser (Firefox/Chrome/Opera) add-ons, mobile apps (Android/iOS/Windows Phone) and even on e-reader (PocketBook/Kobo).

Upgrade from the YunoHost [Wallabag v1](https://github.com/YunoHost-Apps/wallabag_ynh) app requires a manual operation. That's why it's provided as a new package. For the migration process, please refer to the [Wallabag official documentation](https://doc.wallabag.org/en/user/import/wallabagv1.html).


**Versione pubblicata:** 2.5.4~ynh3

**Prova:** <https://demo.yunohost.org/wallabag/>

## Screenshot

![Screenshot di Wallabag](./doc/screenshots/screenshot1.webp)

## Documentazione e risorse

- Sito web ufficiale dell’app: <https://www.wallabag.org>
- Documentazione ufficiale per gli amministratori: <https://doc.wallabag.org/en/>
- Repository upstream del codice dell’app: <https://github.com/wallabag/wallabag>
- Store di YunoHost: <https://apps.yunohost.org/app/wallabag2>
- Segnala un problema: <https://github.com/YunoHost-Apps/wallabag2_ynh/issues>

## Informazioni per sviluppatori

Si prega di inviare la tua pull request alla [branch di `testing`](https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing).

Per provare la branch di `testing`, si prega di procedere in questo modo:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing --debug
o
sudo yunohost app upgrade wallabag2 -u https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing --debug
```

**Maggiori informazioni riguardo il pacchetto di quest’app:** <https://yunohost.org/packaging_apps>
