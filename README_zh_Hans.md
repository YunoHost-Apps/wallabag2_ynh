<!--
注意：此 README 由 <https://github.com/YunoHost/apps/tree/master/tools/readme_generator> 自动生成
请勿手动编辑。
-->

# YunoHost 上的 Wallabag

[![集成程度](https://dash.yunohost.org/integration/wallabag2.svg)](https://ci-apps.yunohost.org/ci/apps/wallabag2/) ![工作状态](https://ci-apps.yunohost.org/ci/badges/wallabag2.status.svg) ![维护状态](https://ci-apps.yunohost.org/ci/badges/wallabag2.maintain.svg)

[![使用 YunoHost 安装 Wallabag](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=wallabag2)

*[阅读此 README 的其它语言版本。](./ALL_README.md)*

> *通过此软件包，您可以在 YunoHost 服务器上快速、简单地安装 Wallabag。*  
> *如果您还没有 YunoHost，请参阅[指南](https://yunohost.org/install)了解如何安装它。*

## 概况

Wallabag is a self hostable Read-It-Later application allowing you to not miss any content anymore. Click, save, read it when you can.
It provides a web interface, browser (Firefox/Chrome/Opera) add-ons, mobile apps (Android/iOS/Windows Phone) and even on e-reader (PocketBook/Kobo).

Upgrade from the YunoHost [Wallabag v1](https://github.com/YunoHost-Apps/wallabag_ynh) app requires a manual operation. That's why it's provided as a new package. For the migration process, please refer to the [Wallabag official documentation](https://doc.wallabag.org/en/user/import/wallabagv1.html).


**分发版本：** 2.5.4~ynh6

**演示：** <https://demo.yunohost.org/wallabag/>

## 截图

![Wallabag 的截图](./doc/screenshots/screenshot1.webp)

## 文档与资源

- 官方应用网站： <https://www.wallabag.org>
- 官方管理文档： <https://doc.wallabag.org/en/>
- 上游应用代码库： <https://github.com/wallabag/wallabag>
- YunoHost 商店： <https://apps.yunohost.org/app/wallabag2>
- 报告 bug： <https://github.com/YunoHost-Apps/wallabag2_ynh/issues>

## 开发者信息

请向 [`testing` 分支](https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing) 发送拉取请求。

如要尝试 `testing` 分支，请这样操作：

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing --debug
或
sudo yunohost app upgrade wallabag2 -u https://github.com/YunoHost-Apps/wallabag2_ynh/tree/testing --debug
```

**有关应用打包的更多信息：** <https://yunohost.org/packaging_apps>
