#!/usr/bin/perl

use strict;
use warnings;

my $ok = 0;
my $tot = 0;
while (<>) {
    chomp;
    $tot++;
    my($range, $letter, $pass) = split(/\s+/, $_);
    my ($min, $max) = split (/-/, $range);
    $letter =~ s/://;
    my $cnt = $pass =~ s/$letter//g;
    $ok++ if ($cnt >= $min and $cnt <= $max);
}
print "Total: $tot\nValid: $ok\n;"