#!/usr/bin/perl

use strict;
use warnings;

my $ok = 0;
my $tot = 0;
while (<>) {
    chomp;
    $tot++;
    my ($pos, $letter, $pass) = split(/\s+/, $_);
    my ($p1, $p2) = split (/-/, $pos);
    $letter =~ s/://;
    my $l1 = substr($pass, $p1 - 1, 1);
    my $l2 = substr($pass, $p2 - 1, 1);
    next if ($l1 eq $l2);
    $ok++ if (($l1 eq $letter) or ($l2 eq $letter));
}
print "Total: $tot\nValid: $ok\n;"