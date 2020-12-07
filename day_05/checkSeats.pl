#!/usr/bin/perl

use strict;
use warnings;

my @seats;
while (<>) {
    chomp;
    next if (/^Max/);
    next unless (/SeatID: (\d+)/);
    push @seats, $1;
}
my @sort = sort {$a<=>$b} @seats;
my $min = $sort[0];
my $max = $sort[-1];

for (my $i=0; $i<=$#sort; $i++) {
    unless ($sort[$i] == ($min + $i)) {
        my $seat = $min + $i;
        print "Missed: $seat\n";
        last;
    }
}