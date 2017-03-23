# Perl定长切割字符串、切割的返回数组

#! /usr/bin/perl -w
use strict;

sub splitStr {
    my ( $strtmp, $length ) = @_;
    my $strLength = length $strtmp;
    my @results;
    for ( my $i = 0 ; $i < $strLength ; $i += $length ) {
    #if length reach the bound , just resturn the left ones 
        if ( $strLength < ( $i + $length ) ) {
            push @results, substr( $strtmp, $i );
        }
        else {
            push @results, substr( $strtmp, $i, $length );
        }
    }
    return \@results;
}
