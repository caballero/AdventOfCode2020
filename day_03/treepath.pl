#!/usr/bin/perl

use strict;
use warnings;

my $x     = 0;
my $y     = 0;
my $right = 3;
my $down  = 1;
my $tree  = 0;
my @patt  = ();

while (<>) {
    chomp;
    push @patt, $_;
}
my $len = length $patt[0];
for (my $i=0; $i<=$#patt; $i += $down) {
    my $pos = substr($patt[$i], $x, 1);
    if ($pos eq "#") {
        $tree++;
        substr($patt[$i], $x, 1) = "X";
    }
    else {
        substr($patt[$i], $x, 1) = "O";
    }
    $x += $right;
    if ($x >= $len) {
        $x -= $len;
    }
}
print join "\n", @patt;
print " \nTrees: $tree\n";