#!/usr/bin/perl

use strict;
use warnings;

$/="\n\n"; # split in blocks

my $sum = 0;
while (<>) {
    my @ind = split (/\n/, $_);
    my %ans = ();
    foreach my $ind (@ind) {
        my @ans = split (//, $ind);
        foreach my $ans (@ans) {
            $ans{$ans}++;
        }
    }
    my $tot = 0;
    foreach my $ans (keys %ans) { $tot++; }
    print "$_\n$tot\n";
    $sum+=$tot;
}
print "Sum: $sum\n";