# 统计文本中每个单词出现次数并排序

#! usr/bin/perl
use strict;
my(@line,$line,@character,@words,$word,$count,%count);
open INPUT,"/Users/yumh/Desktop/str1";
open OUTPUT,">result.txt";
@line=<INPUT>;
foreach $line(@line){
chomp($line);
$line=~s/\p{Punct}|“|”|‘//g;
@character=split /\s+/,$line;
push @words,@character;
}
foreach $word(@words){
$count{$word}+=1;
}
foreach $word(sort keys %count){
print OUTPUT "$word\t=>\t$count{$word}\n";
}
