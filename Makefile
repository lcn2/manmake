#!/bin/make
#
# manmake - make a catman page from a man page
#
# @(#) $Revision$
# @(#) $Id$
# @(#) $Source$
#
# Copyright (c) Landon Curt Noll, 1993.
# All rights reserved.
#
# Written by Landon Curt Noll (chongo@toad.com).  Permission for BSDI for use 
# in their BSD/386 product is hereby granted so long as this copyright and
# notice remains unaltered.
#
# Permission to use, copy, modify, and distribute this software and
# its documentation for any purpose and without fee is hereby granted,
# provided that the above copyright, this permission notice and text
# this comment, and the disclaimer below appear in all of the following:
#
#       supporting documentation
#       source copies
#       source works derived from this source
#       binaries derived from this source or from derived source
#
# LANDON CURT NOLL DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
# INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO
# EVENT SHALL LANDON CURT NOLL BE LIABLE FOR ANY SPECIAL, INDIRECT OR
# CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF

SHELL=/bin/sh
BINMODE=0555
DESTDIR=/usr/local/bin
INSTALL=install

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
