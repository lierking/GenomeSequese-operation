#!/usr/bin/perl
use strict;
use warnings;
 
my ( %list, %FHs, $id );
 
while (<>) {
    $list{$_} = "out_$." for split;
    last if eof;
}
 
local $/ = '>';
while (<>) {
    chomp;
    if ( ($id) = /(.+)/ and exists $list{$id} ) {
        open $FHs{ $list{$id} }, '>', $list{$id} or die $! unless defined $FHs{ $list{$id} };
        print { $FHs{ $list{$id} } } ">$_";
    }
}
