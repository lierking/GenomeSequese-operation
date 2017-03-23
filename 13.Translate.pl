# 对于给定的核苷酸序列，翻译成蛋白质

#! /usr/bin/perl -w
#Translate DNA into protein

use strict;
use warnings;

my %proteins = qw/
    UUU F UUC F UUA L UUG L UCU S UCC S UCA S UCG S UAU Y UAC Y UGU C UGC C UGG W
    CUU L CUC L CUA L CUG L CCU P CCC P CCA P CCG P CAU H CAC H CAA Q CAG Q CGU R CGC R CGA R CGG R
    AUU I AUC I AUA I AUG M ACU T ACC T ACA T ACG T AAU N AAC N AAA K AAG K AGU S AGC S AGA R AGG R
    GUU V GUC V GUA V GUG V GCU A GCC A GCA A GCG A GAU D GAC D GAA E GAG E GGU G GGC G GGA G GGG G
    /;
    
print "Import your DNA sequence(end with Enter):\n";


LINE: while (<>) {
    chomp;
    
    if (/^(>.*)/){
    	  print "\n$1\n";
    	  next LINE;
    }
    
    my %nc = qw/A 1 T 2 G 3 C 4/;
    foreach (/(.)/g){ 	
    	  unless (exists $nc{$_}){
    	  	  print "This is NOT DNA sequence!\n";
    	  	  next LINE;
    	  }
    }
    
    my $string_len =  length();
    if ($string_len%3!=0){
    	  print "This sequence is not complete!\n"
    }
    
    y/GCTA/CGAU/; # translate (point 1&2 mixed)
    
    foreach my $codon (/(...)/g) {
        if (defined $proteins{$codon}) {
            print "$proteins{$codon}";
        }
        else {
            next LINE;
        }
    }
    print "\n";
}

print "\n";
