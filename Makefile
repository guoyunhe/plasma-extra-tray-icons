INSTALL = /usr/bin/install -c -m 644
INSTALLDIR = /usr/bin/install -d -m 755
prefix = ~/.local
datarootdir = ${prefix}/share
datadir = ${datarootdir}
dropboxicondir = $(wildcard ~/.dropbox-dist/*/images/hicolor/16x16/status)

install:
	$(INSTALLDIR) $(datadir)/plasma/desktoptheme/default/icons
	$(INSTALL) breeze/*.svgz $(datadir)/plasma/desktoptheme/default/icons
	$(INSTALL) breeze/dropboxstatus-*.png $(dropboxicondir)
