INSTALL = /usr/bin/install -c -m 644
INSTALLDIR = /usr/bin/install -d -m 755
prefix = ~/.local
datarootdir = ${prefix}/share
datadir = ${datarootdir}
dropboxicondir = $(wildcard ~/.dropbox-dist/*/images/hicolor/16x16/status)
telegramicondir = $(wildcard ~/.TelegramDesktop/tdata/ticons)
telegramicons = $(patsubst $(telegramicondir)/%, breeze/telegram/%, $(wildcard $(telegramicondir)/*.png))

install:  dropbox_hack telegram_hack
	$(INSTALLDIR) $(datadir)/plasma/desktoptheme/default/icons
	$(INSTALL) breeze/*.svgz $(datadir)/plasma/desktoptheme/default/icons

dropbox_hack:
	# Hack Dropbox hard-coded icons
	$(if $(dropboxicondir), $(INSTALL) breeze/dropboxstatus-*.png $(dropboxicondir) )

telegram_hack: $(telegramicons)
	# Hack Telegram hard-coded icons
	$(INSTALLDIR) $(telegramicondir)
	$(if $(telegramicons), $(INSTALL) breeze/telegram/*.png $(telegramicondir) )

breeze/telegram/icomute_22_0.png: breeze/telegram.png
	$(INSTALLDIR) breeze/telegram
	$(INSTALL) $< $@

breeze/telegram/ico_22_%.png: breeze/telegram-unread.png
	$(INSTALLDIR) breeze/telegram
	$(INSTALL) $< $@

breeze/telegram/icomute_22_%.png: breeze/telegram-mute-unread.png
	$(INSTALLDIR) breeze/telegram
	$(INSTALL) $< $@
