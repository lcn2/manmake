#!/usr/bin/perl
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

die "usage: $0 *roff_source dest_dir" if $#ARGV != 1;
die "$0: missing file $ARGV[0]" if ( ! -s $ARGV[0] );
if ( ! -f $ARGV[1] ) {
  die "$0: can\'t write $ARGV[1]" if ( ! -w $ARGV[1] && ! `mkdir -p $ARGV[1]` );
}
$ARGV[0] =~ m:^(.*/)*([-a-zA-Z_0-9.]+)\..*$:;
$f = $2;
`tbl -TX $ARGV[0] | eqn | nroff -man >/tmp/$f`;
`gzip --best -f /tmp/$f`;
`mv /tmp/$f.z $ARGV[1]`;
