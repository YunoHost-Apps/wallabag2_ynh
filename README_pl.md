<!--
To README zostało automatycznie wygenerowane przez <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Nie powinno być ono edytowane ręcznie.
-->

# Wallabag dla YunoHost

[![Poziom integracji](https://apps.yunohost.org/badge/integration/wallabag2)](https://ci-apps.yunohost.org/ci/apps/wallabag2/)
![Status działania](https://apps.yunohost.org/badge/state/wallabag2)
![Status utrzymania](https://apps.yunohost.org/badge/maintained/wallabag2)

[![Zainstaluj Wallabag z YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=wallabag2)

*[Przeczytaj plik README w innym języku.](./ALL_README.md)*

> *Ta aplikacja pozwala na szybką i prostą instalację Wallabag na serwerze YunoHost.*  
> *Jeżeli nie masz YunoHost zapoznaj się z [poradnikiem](https://yunohost.org/install) instalacji.*

## Przegląd

Wallabag is a self hostable Read-It-Later application allowing you to not miss any content anymore. Click, save, read it when you can.
It provides a web interface, browser (Firefox/Chrome/Opera) add-ons, mobile apps (Android/iOS/Windows Phone) and even on e-reader (PocketBook/Kobo).

Upgrade from the YunoHost [Wallabag v1](https://github.com/YunoHost-Apps/wallabag_ynh) app requires a manual operation. That's why it's provided as a new package. For the migration process, please refer to the [Wallabag official documentation](https://doc.wallabag.org/en/user/import/wallabagv1.html).


**Dostarczona wersja:** 2.5.4~ynh10

**Demo:** <https://demo.yunohost.org/wallabag/>

## Zrzuty ekranu

![Zrzut ekranu z Wallabag](./doc/screenshots/screenshot1.webp)

## Dokumentacja i zasoby

- Oficjalna strona aplikacji: <https://www.wallabag.org>
- Oficjalna dokumentacja dla administratora: <https://doc.wallabag.org/en/>
- Repozytorium z kodem źródłowym: <https://github.com/wallabag/wallabag>
- Sklep YunoHost: <https://apps.yunohost.org/app/wallabag2>
- Zgłaszanie błędów: <https://github.com/YunoHost-Apps/wallabag2_ynh/issues>

## Informacje od twórców

Wyślij swój pull request do [gałęzi `testing`](https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing).

Aby wypróbować gałąź `testing` postępuj zgodnie z instrukcjami:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing --debug
lub
sudo yunohost app upgrade wallabag2 -u https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing --debug
```

**Więcej informacji o tworzeniu paczek aplikacji:** <https://yunohost.org/packaging_apps>
