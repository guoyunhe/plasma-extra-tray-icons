INSTALL = /usr/bin/install -c -m 644
INSTALLDIR = /usr/bin/install -d -m 755
prefix = ~/.local
datarootdir = ${prefix}/share
datadir = ${datarootdir}
dropboxicondir = $(wildcard ~/.dropbox-dist/*/images/hicolor/16x16/status)
telegramicondir = $(wildcard ~/.TelegramDesktop/tdata/ticons)
telegramicons = $(patsubst $(telegramicondir)/%, icons/telegram/%, $(wildcard $(telegramicondir)/*.png))

install:  dropbox_hack telegram_hack
	$(INSTALLDIR) $(datadir)/plasma/desktoptheme/default/icons
	$(INSTALL) icons/*.svgz $(datadir)/plasma/desktoptheme/default/icons

dropbox_hack:
	# Hack Dropbox hard-coded icons
	$(if $(dropboxicondir), $(INSTALL) icons/dropboxstatus-*.png $(dropboxicondir) )

telegram_hack: $(telegramicons)
	# Hack Telegram hard-coded icons
	$(INSTALLDIR) $(telegramicondir)
	$(if $(telegramicons), $(INSTALL) icons/telegram/*.png $(telegramicondir) )

icons/telegram/icomute_22_0.png: icons/telegram.png
	$(INSTALLDIR) icons/telegram
	$(INSTALL) $< $@

icons/telegram/ico_22_%.png: icons/telegram-unread.png
	$(INSTALLDIR) icons/telegram
	$(INSTALL) $< $@

icons/telegram/icomute_22_%.png: icons/telegram-mute-unread.png
	$(INSTALLDIR) icons/telegram
	$(INSTALL) $< $@
