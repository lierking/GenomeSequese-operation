# 对于给定的核苷酸序列，翻译成蛋白质

#! /usr/bin/perl -w
#Translate DNA into protein

use strict;
use BeginPerlBioinfo;

print "Print your DNA sequences: \n"
my $dna =<>;
my $protein;
my $codon;

for (my $i =0,$i <(length($dna)-2);$i +=3){
    $codon=substr($dna,$i,3);
    $protein .= codon2aa($codon);
}

print "The protein sequence is\n\n$protein\n\n";

sub codon2aa {
    my($codon) = @_;

    $codon = uc $codon;
 
    my(%genetic_code) = (
    
    'TCA' => 'S',    
    'TCC' => 'S',    
    'TCG' => 'S',    
    'TCT' => 'S',    
    'TTC' => 'F',    
    'TTT' => 'F',   
    'TTA' => 'L',   
    'TTG' => 'L',    
    'TAC' => 'Y',   
    'TAT' => 'Y',
    'TAA' => '_',
    'TAG' => '_',
    'TGC' => 'C',
    'TGT' => 'C',
    'TGA' => '_',
    'TGG' => 'W',
    'CTA' => 'L',
    'CTC' => 'L',
    'CTG' => 'L',
    'CTT' => 'L',
    'CCA' => 'P',
    'CCC' => 'P',
    'CCG' => 'P',
    'CCT' => 'P',
    'CAC' => 'H',
    'CAT' => 'H',
    'CAA' => 'Q',
    'CAG' => 'Q',
    'CGA' => 'R',
    'CGC' => 'R',
    'CGG' => 'R',
    'CGT' => 'R',
    'ATA' => 'I',
    'ATC' => 'I',
    'ATT' => 'I',
    'ATG' => 'M',
    'ACA' => 'T',
    'ACC' => 'T',
    'ACT' => 'T',
    'ACG' => 'T',
    'AGC' => 'S',
    'AGT' => 'S',
    'AGA' => 'R',
    'AGG' => 'R',
    'GTA' => 'T',
    'GTC' => 'T',
    'GTG' => 'T',
    'GTT' => 'T',
    'GCA' => 'A',
    'GCC' => 'A',
    'GCG' => 'A',
    'GCT' => 'A',
    'GAC' => 'D',
    'GAT' => 'D',
    'GAA' => 'E',
    'GAG' => 'E',
    'GGA' => 'G',
    'GGC' => 'G',
    'GGG' => 'G',
    'GGT' => 'G',
    );
    
    if (exists $genetic_code{$codon}){
        return $genetic_code{codon};
    }else{
        print STDEER "Bad codon \"$codon\"!!\n";
        exit;
    }
}

exit;
