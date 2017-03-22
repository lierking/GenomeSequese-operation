#! /usr/bin/perl -w
use strict;

my(@gene,%count,$gene,$max,@Max);
open GENE,"gene.txt";
@gene=<GENE>;
foreach $gene(@gene){
    $count{$gene}+=1;
}

@gene=sort by_values keys %count;

sub by_values{$count{$b} <=>$count{$a}
    or
$a cmp $b
}

$max=shift@gene;

my @k =keys %count;

foreach $_(@k){
	if ($count{$_} == $count{$max}){
		push @Max , $_ ;
	}
}

print @Max,"appear $count{$max} times.\n";
