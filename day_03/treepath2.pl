#!/usr/bin/perl

use strict;
use warnings;

$ARGV[1] or die "use treepath.pl [RIGTH] [DOWN] < input\n";
my $x     = 0;
my $y     = 0;
my $right = shift @ARGV;
my $down  = shift @ARGV;
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
#print join "\n", @patt;
print "Right=$right, Down=$down, Trees=$tree\n";