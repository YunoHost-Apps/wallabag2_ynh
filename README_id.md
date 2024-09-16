<!--
N.B.: README ini dibuat secara otomatis oleh <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Ini TIDAK boleh diedit dengan tangan.
-->

# Wallabag untuk YunoHost

[![Tingkat integrasi](https://dash.yunohost.org/integration/wallabag2.svg)](https://ci-apps.yunohost.org/ci/apps/wallabag2/) ![Status kerja](https://ci-apps.yunohost.org/ci/badges/wallabag2.status.svg) ![Status pemeliharaan](https://ci-apps.yunohost.org/ci/badges/wallabag2.maintain.svg)

[![Pasang Wallabag dengan YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=wallabag2)

*[Baca README ini dengan bahasa yang lain.](./ALL_README.md)*

> *Paket ini memperbolehkan Anda untuk memasang Wallabag secara cepat dan mudah pada server YunoHost.*  
> *Bila Anda tidak mempunyai YunoHost, silakan berkonsultasi dengan [panduan](https://yunohost.org/install) untuk mempelajari bagaimana untuk memasangnya.*

## Ringkasan

Wallabag is a self hostable Read-It-Later application allowing you to not miss any content anymore. Click, save, read it when you can.
It provides a web interface, browser (Firefox/Chrome/Opera) add-ons, mobile apps (Android/iOS/Windows Phone) and even on e-reader (PocketBook/Kobo).

Upgrade from the YunoHost [Wallabag v1](https://github.com/YunoHost-Apps/wallabag_ynh) app requires a manual operation. That's why it's provided as a new package. For the migration process, please refer to the [Wallabag official documentation](https://doc.wallabag.org/en/user/import/wallabagv1.html).


**Versi terkirim:** 2.5.4~ynh7

**Demo:** <https://demo.yunohost.org/wallabag/>

## Tangkapan Layar

![Tangkapan Layar pada Wallabag](./doc/screenshots/screenshot1.webp)

## Dokumentasi dan sumber daya

- Website aplikasi resmi: <https://www.wallabag.org>
- Dokumentasi admin resmi: <https://doc.wallabag.org/en/>
- Depot kode aplikasi hulu: <https://github.com/wallabag/wallabag>
- Gudang YunoHost: <https://apps.yunohost.org/app/wallabag2>
- Laporkan bug: <https://github.com/YunoHost-Apps/wallabag2_ynh/issues>

## Info developer

Silakan kirim pull request ke [`testing` branch](https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing).

Untuk mencoba branch `testing`, silakan dilanjutkan seperti:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing --debug
atau
sudo yunohost app upgrade wallabag2 -u https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing --debug
```

**Info lebih lanjut mengenai pemaketan aplikasi:** <https://yunohost.org/packaging_apps>
