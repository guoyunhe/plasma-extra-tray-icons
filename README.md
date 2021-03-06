# KDE Plasma Extra Tray Icons

Extra tray icons (Dropbox, Steam, etc.) for KDE Plasma 5 built-in themes
(Breeze). Those icons can not be included in KDE because of trademark policies
or less popularity.

![Screenshot](screenshot.png)

## Icons

* dropbox
  * dropboxstatus-busy (syncing)
  * dropboxstatus-idle (up-to-date)
  * dropboxstatus-logo (not connected)
  * dropboxstatus-x (errors)
* steam
  * steam_tray_mono
* telegram
  * ico_22_n.png
  * icomute_22_n.png


TODO:

* spotify
  * spotify

If you need other icons, you can open an issue on Github or make a pull request.
Please follow [Breeze guidelines](https://community.kde.org/KDE_Visual_Design_Group/HIG/IconDesign).

## Install

### User Directory

```
make install
```

By default, icons are installed in `~/.local/share/plasma/desktoptheme/default/icons`.

Dropbox icons are installed in `~/.dropbox-dist/dropbox-xxx/images/hicolor/16x16/status`.

Telegram icons are installed in `~/.TelegramDesktop/tdata/ticons`.

### System Directory

```
sudo make prefix=/usr/local install
```

This will install icons in `/usr/local/share/plasma/desktoptheme/default/icons`.

Telegram and Dropbox icons won't work.

### Packaging

```
make -i DESTDIR="%buildroot" prefix="/usr" install
```

Package will install icons in `/usr/share/plasma/desktoptheme/default/icons`.

Telegram and Dropbox icons won't work.

## License

GNU GPL v3+ and CC-BY SA 4.0+.
