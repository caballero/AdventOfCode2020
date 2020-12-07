#!/usr/bin/perl

use strict;
use warnings;

$/="\n\n"; # split in blocks

my $sum = 0;
while (<>) {
    my @ind = split (/\n/, $_);
    my %ans = ();
    my $grp = 0;
    foreach my $ind (@ind) {
        $grp++;
        my @ans = split (//, $ind);
        foreach my $ans (@ans) {
            $ans{$ans}++;
        }
    }
    my $tot = 0;
    foreach my $ans (keys %ans) {
        $tot++ if ($ans{$ans} == $grp);
    }
    print "$_$tot\n";
    $sum+=$tot;
}
print "Sum: $sum\n";