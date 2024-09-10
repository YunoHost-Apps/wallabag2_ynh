<!--
Важно: этот README был автоматически сгенерирован <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Он НЕ ДОЛЖЕН редактироваться вручную.
-->

# Wallabag для YunoHost

[![Уровень интеграции](https://dash.yunohost.org/integration/wallabag2.svg)](https://ci-apps.yunohost.org/ci/apps/wallabag2/) ![Состояние работы](https://ci-apps.yunohost.org/ci/badges/wallabag2.status.svg) ![Состояние сопровождения](https://ci-apps.yunohost.org/ci/badges/wallabag2.maintain.svg)

[![Установите Wallabag с YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=wallabag2)

*[Прочтите этот README на других языках.](./ALL_README.md)*

> *Этот пакет позволяет Вам установить Wallabag быстро и просто на YunoHost-сервер.*  
> *Если у Вас нет YunoHost, пожалуйста, посмотрите [инструкцию](https://yunohost.org/install), чтобы узнать, как установить его.*

## Обзор

Wallabag is a self hostable Read-It-Later application allowing you to not miss any content anymore. Click, save, read it when you can.
It provides a web interface, browser (Firefox/Chrome/Opera) add-ons, mobile apps (Android/iOS/Windows Phone) and even on e-reader (PocketBook/Kobo).

Upgrade from the YunoHost [Wallabag v1](https://github.com/YunoHost-Apps/wallabag_ynh) app requires a manual operation. That's why it's provided as a new package. For the migration process, please refer to the [Wallabag official documentation](https://doc.wallabag.org/en/user/import/wallabagv1.html).


**Поставляемая версия:** 2.5.4~ynh6

**Демо-версия:** <https://demo.yunohost.org/wallabag/>

## Снимки экрана

![Снимок экрана Wallabag](./doc/screenshots/screenshot1.webp)

## Документация и ресурсы

- Официальный веб-сайт приложения: <https://www.wallabag.org>
- Официальная документация администратора: <https://doc.wallabag.org/en/>
- Репозиторий кода главной ветки приложения: <https://github.com/wallabag/wallabag>
- Магазин YunoHost: <https://apps.yunohost.org/app/wallabag2>
- Сообщите об ошибке: <https://github.com/YunoHost-Apps/wallabag2_ynh/issues>

## Информация для разработчиков

Пришлите Ваш запрос на слияние в [ветку `testing`](https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing).

Чтобы попробовать ветку `testing`, пожалуйста, сделайте что-то вроде этого:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing --debug
или
sudo yunohost app upgrade wallabag2 -u https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing --debug
```

**Больше информации о пакетировании приложений:** <https://yunohost.org/packaging_apps>
