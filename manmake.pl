#!/usr/bin/perl
#
# manmake - make a catman page from a man page
#
# @(#) $Revision: 1.4 $
# @(#) $Id: manmake.pl,v 1.4 1999/09/26 00:38:21 chongo Exp $
# @(#) $Source: /usr/local/src/bin/manmake/RCS/manmake.pl,v $
#
# Copyright (c) 1993 by Landon Curt Noll.  All Rights Reserved.
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
# USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.
#
# chongo <was here> /\oo/\
#
# Share and enjoy!

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
