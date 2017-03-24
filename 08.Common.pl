# 编写脚本，找出这两条序列中最长的共有序列。
# 序列一：AACTGCACGTGCATCGGATGCATCGATCGTGCGAGTAGTCGATCGATCGTAGCTAGCTCAGTCGATCAGCTACCTCGC
# 序列二：CGTAGCTACGATCGCATCAGCTACCTCCGTTCGAGTCTGCGCAACGCTACGACTATCGACGTCA

#! usr/bin/perl
use strict;
my($s1,$s2,$max,$length,$star,$common,$compare,@compare,$common,@common,$maxcom,%len,$len);
$s1="AACTGCACGTGCATCGGATGCATCGATCGTGCGAGTAGTCGATCGATCGTAGCTAGCTCAGTCGATCAGCTACCTCGC";
$s2="CGTAGCTACGATCGCATCAGCTACCTCCGTTCGAGTCTGCGCAACGCTACGACTATCGACGTCA";
my $size2=length($s2);
my $len=$size2;
my $getmatch=0;
my $offset=0;
 
LABEL:for ($len=$size2; $len>0; $len--){
              for($offset=0; $offset<=$size2-$len; $offset++){
                   if($s1 =~ substr($s2,$offset,$len)){last LABEL;}
             }
          }
 
print "the length of longest common substring is $len\n";
print "one of the longest common subsring is: ".substr($s2,$offset,$len)."\n";
 
 
my %common=();
$common{substr($s2,$offset,$len)}=1; #all=1
 
for(my $newoffset=$offset+$len; $newoffset<=$size2-$len; $newoffset++){
         if($s1 =~ substr($s2,$newoffset,$len)){
             if (!exists $common{substr($s2,$newoffset,$len)} ){                  
                 print substr($s2,$newoffset,$len)."\n";
                 $common{substr($s2,$newoffset,$len)}=1;
             }
         }
     }
