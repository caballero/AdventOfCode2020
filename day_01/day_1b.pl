#!/usr/bin/perl

use strict;
use warnings;

my @num = ();
my $sum = 2020;
my $d1;
my $d2;
my $d3;

while (<>) {
    chomp;
    push @num, $_;
}

for (my $i = 0; $i <= $#num; $i++) {
    $d1 = $num[$i];
    for (my $j = $i + 1; $j <= $#num; $j++) {
        $d2 = $num[$j];
        for (my $k = $j + 1; $k <= $#num; $k++) {
            $d3 = $num[$k];    
            if ( ($d1 + $d2 + $d3) == $sum ) {
                print "$d1 + $d2 + $d3 = $sum\n";
                print "$d1 * $d2 * $d3 = " . $d1 * $d2 * $d3 . "\n";
                exit;
            }
        }
    }
}
