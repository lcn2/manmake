#!/usr/bin/perl
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
