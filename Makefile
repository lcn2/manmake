#!/bin/make
#
# manmake - make a catman page from a man page
#
# Copyright (c) Landon Curt Noll, 1993.
# All rights reserved.
#
# Written by Landon Curt Noll (chongo@toad.com).  Permission for BSDI for use 
# in their BSD/386 product is hereby granted so long as this copyright and
# notice remains unaltered.

SHELL=/bin/sh
BINMODE=0555
DESTDIR=/usr/local/bin
INSTALL=bsdinst

all: manmake

manmake: manmake.pl
	-rm -f $@
	cp $@.pl $@
	chmod +x $@

install: all
	${INSTALL} -c -m ${BINMODE} manmake ${DESTDIR}/manmake

clean:

clobber: clean
	-rm -f manmake
