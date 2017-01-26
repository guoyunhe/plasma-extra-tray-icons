INSTALL = /usr/bin/install -c -m 644
INSTALLDIR = /usr/bin/install -d -m 755

# User directory: make install
# System directory (root): make prefix=/usr/local install
# Packaging (root): make DESTDIR=%buildroot prefix=/usr install
prefix ?= $(wildcard ~/.local)
datarootdir = ${prefix}/share
datadir = ${datarootdir}

# Nothing to build
all:

# Install icons and try Dropbox and Telegram hacks
install:  install_icons dropbox_hack telegram_hack

install_icons:
	$(INSTALLDIR) $(DESTDIR)$(datadir)/plasma/desktoptheme/default/icons
	$(INSTALL) icons/*.svgz $(DESTDIR)$(datadir)/plasma/desktoptheme/default/icons

dropboxicondir = $(wildcard ~/.dropbox-dist/*/images/hicolor/16x16/status)

dropbox_hack:
	# Hack Dropbox hard-coded icons
	$(if $(dropboxicondir), $(INSTALL) icons/dropboxstatus-*.png $(dropboxicondir) )

telegramicondir = $(wildcard ~/.TelegramDesktop/tdata/ticons)
telegramicons = $(patsubst $(telegramicondir)/%, icons/telegram/%, $(wildcard $(telegramicondir)/*.png))

telegram_hack: $(telegramicons)
	# Hack Telegram hard-coded icons
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
