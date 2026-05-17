# DoomMenu - dynamic menu
# See LICENSE file for copyright and license details.

include config.mk

SRC = drw.c doommenu.c stest.c util.c
OBJ = $(SRC:.c=.o)

all: options doommenu stest

options:
	@echo DoomMenu build options:
	@echo "CFLAGS   = $(CFLAGS)"
	@echo "LDFLAGS  = $(LDFLAGS)"
	@echo "CC       = $(CC)"

.c.o:
	$(CC) -c $(CFLAGS) $<

config.h:
	cp config.def.h $@

$(OBJ): arg.h config.h config.mk drw.h

doommenu: doommenu.o drw.o util.o
	$(CC) -o $@ doommenu.o drw.o util.o $(LDFLAGS)

stest: stest.o
	$(CC) -o $@ stest.o $(LDFLAGS)

clean:
	rm -f doommenu stest $(OBJ) DoomMenu-$(VERSION).tar.gz

dist: clean
	mkdir -p DoomMenu-$(VERSION)
	cp LICENSE Makefile README arg.h config.h config.mk doommenu.1\
		drw.h util.h doommenu_path doommenu_run stest.1 $(SRC)\
		DoomMenu-$(VERSION)
	tar -cf DoomMenu-$(VERSION).tar DoomMenu-$(VERSION)
	gzip DoomMenu-$(VERSION).tar
	rm -rf DoomMenu-$(VERSION)

install: all
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f doommenu doommenu_path doommenu_run stest $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/doommenu
	chmod 755 $(DESTDIR)$(PREFIX)/bin/doommenu_path
	chmod 755 $(DESTDIR)$(PREFIX)/bin/doommenu_run
	chmod 755 $(DESTDIR)$(PREFIX)/bin/stest
	mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	sed "s/VERSION/$(VERSION)/g" < doommenu.1 > $(DESTDIR)$(MANPREFIX)/man1/doommenu.1
	sed "s/VERSION/$(VERSION)/g" < stest.1 > $(DESTDIR)$(MANPREFIX)/man1/stest.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/doommenu.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/stest.1

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/doommenu\
		$(DESTDIR)$(PREFIX)/bin/doommenu_path\
		$(DESTDIR)$(PREFIX)/bin/doommenu_run\
		$(DESTDIR)$(PREFIX)/bin/stest\
		$(DESTDIR)$(MANPREFIX)/man1/doommenu.1\
		$(DESTDIR)$(MANPREFIX)/man1/stest.1

.PHONY: all options clean dist install uninstall
