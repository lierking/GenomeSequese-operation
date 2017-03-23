# 统计两个文件中的共有及特有内容

# usr/bin/perl -w
use strict;
open AIN,"A";
open BIN,"B";
open BOTH,">both.txt";
open ONLYA,">onlyA.txt";
open ONLYB,">onlyB.txt";
my($a,$b,@a,@b,$t1,$t2);
chomp(@a=<AIN>);
chomp(@b=<BIN>);
foreach $a(@a){
   $t1=0;
   foreach $b(@b){
      if($a eq $b){
         print  BOTH "$a\n";
         $t1=1;
        }
       }
   if($t1==0){
   print  ONLYA "$a\n";
   }
}
foreach $b(@b){
 $t2=0;
   foreach $a(@a){
      if($b eq $a){
      $t2=1;
      }
    }
    if($t2==0){
    print  ONLYB "$b\n";
    }
}
