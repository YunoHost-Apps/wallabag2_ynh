<!--
Ohart ongi: README hau automatikoki sortu da <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>ri esker
EZ editatu eskuz.
-->

# Wallabag YunoHost-erako

[![Integrazio maila](https://apps.yunohost.org/badge/integration/wallabag2)](https://ci-apps.yunohost.org/ci/apps/wallabag2/)
![Funtzionamendu egoera](https://apps.yunohost.org/badge/state/wallabag2)
![Mantentze egoera](https://apps.yunohost.org/badge/maintained/wallabag2)

[![Instalatu Wallabag YunoHost-ekin](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=wallabag2)

*[Irakurri README hau beste hizkuntzatan.](./ALL_README.md)*

> *Pakete honek Wallabag YunoHost zerbitzari batean azkar eta zailtasunik gabe instalatzea ahalbidetzen dizu.*  
> *YunoHost ez baduzu, kontsultatu [gida](https://yunohost.org/install) nola instalatu ikasteko.*

## Aurreikuspena

Wallabag is a self hostable Read-It-Later application allowing you to not miss any content anymore. Click, save, read it when you can.
It provides a web interface, browser (Firefox/Chrome/Opera) add-ons, mobile apps (Android/iOS/Windows Phone) and even on e-reader (PocketBook/Kobo).

Upgrade from the YunoHost [Wallabag v1](https://github.com/YunoHost-Apps/wallabag_ynh) app requires a manual operation. That's why it's provided as a new package. For the migration process, please refer to the [Wallabag official documentation](https://doc.wallabag.org/en/user/import/wallabagv1.html).


**Paketatutako bertsioa:** 2.6.10~ynh1

**Demoa:** <https://demo.yunohost.org/wallabag/>

## Pantaila-argazkiak

![Wallabag(r)en pantaila-argazkia](./doc/screenshots/screenshot1.webp)

## Dokumentazioa eta baliabideak

- Aplikazioaren webgune ofiziala: <https://www.wallabag.org>
- Administratzaileen dokumentazio ofiziala: <https://doc.wallabag.org/en/>
- Jatorrizko aplikazioaren kode-gordailua: <https://github.com/wallabag/wallabag>
- YunoHost Denda: <https://apps.yunohost.org/app/wallabag2>
- Eman errore baten berri: <https://github.com/YunoHost-Apps/wallabag2_ynh/issues>

## Garatzaileentzako informazioa

Bidali `pull request`a [`testing` abarrera](https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing).

`testing` abarra probatzeko, ondorengoa egin:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing --debug
edo
sudo yunohost app upgrade wallabag2 -u https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing --debug
```

**Informazio gehiago aplikazioaren paketatzeari buruz:** <https://yunohost.org/packaging_apps>
