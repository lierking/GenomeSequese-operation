# 编写脚本，找出这两条序列中最长的共有序列。
# 序列一：AACTGCACGTGCATCGGATGCATCGATCGTGCGAGTAGTCGATCGATCGTAGCTAGCTCAGTCGATCAGCTACCTCGC
# 序列二：CGTAGCTACGATCGCATCAGCTACCTCCGTTCGAGTCTGCGCAACGCTACGACTATCGACGTCA

#! usr/bin/perl
use strict;
my($s1,$s2,$max,$length,$star,$common,$compare,@compare,$common,@common,$maxcom,%len,$len);
$s1="AACTGCACGTGCATCGGATGCATCGATCGTGCGAGTAGTCGATCGATCGTAGCTAGCTCAGTCGATCAGCTACCTCGC";
$s2="CGTAGCTACGATCGCATCAGCTACCTCCGTTCGAGTCTGCGCAACGCTACGACTATCGACGTCA";
$max=length($s2);
for($star=0;$star<=$max;$star++)
{
   for($length=2;$length<=$max-$star;$length++)
   {
     push @compare,substr($s2,$star,$length);
        
    }
}
sort @compare;
foreach $compare(@compare){
     chomp $compare;
     if($s1=~/$compare/){
     push @common,$compare;
}
}
foreach $common(@common){
$len{$common}=length($common);
}
@common=sort {$len{$b} <=>$len{$a}} keys %len;
$maxcom=shift@common;
print "$maxcom\t$len{$maxcom}\n";
