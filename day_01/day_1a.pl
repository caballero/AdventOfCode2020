#!/usr/bin/perl

use strict;
use warnings;

my @num = ();
my $sum = 2020;
my $d1;
my $d2;

while (<>) {
    chomp;
    push @num, $_;
}

for (my $i = 0; $i <= $#num; $i++) {
    $d1 = $num[$i];
    for (my $j = $i + 1; $j <= $#num; $j++) {
        $d2 = $num[$j];
        if ( ($d1 + $d2) == $sum ) {
            print "$d1 + $d2 = $sum\n";
            print "$d1 * $d2 = " . $d1 * $d2 . "\n";
            exit;
        }
    }
}
