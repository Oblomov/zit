# Makefile for zit

# asciidoc is required to generate the manpage.

# Autotools-like prefix, mandir, and DESTDIR variables can be
# overriden to control where files are installed.
prefix?=/usr/local
mandir?=/share/man
target=$(DESTDIR)$(prefix)

all: man

man: zit.1

zit.1: zit.asc
	a2x -f manpage zit.asc

install: zit.1
	install -d "$(target)/bin"
	install -m 755 zit "$(target)/bin"
	install -d "$(target)$(mandir)/man1"
	install -m 644 zit.1 "$(target)$(mandir)/man1"

clean:
	rm -f zit.1
