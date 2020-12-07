#!/usr/bin/perl

use strict;
use warnings;


my $seat_max = 0;

while (<>) {
    my $row_min = 0;
    my $row_max = 127;
    my $col_min = 0;
    my $col_max = 7;
    my $row = undef;
    my $col = undef;

    # read line
    chomp;
    my @code = split (//, $_);
    
    # define row
    for (my $r = 0; $r <= 6; $r++) {
        my $range = $row_max - $row_min;
        next if ($range == 1);
        if ($code[$r] eq "F") {
            $row_max = $row_min + int($range / 2);
        }
        else {
            $row_min = $row_min + int($range / 2) + 1;
        }
        #warn "$code[$r]: $row_min - $row_max\n";
    }
    if ($code[6] eq "F") {
        $row = $row_min;
    }
    else {
        $row = $row_max;
    }

    # define col
    for (my $c = 7; $c <= 9; $c++) {
        my $range = $col_max - $col_min;
        next if ($range == 1);
        if ($code[$c] eq "L") {
            $col_max = $col_min + int($range / 2);
        }
        else {
            $col_min = $col_min + int($range / 2) + 1;
        }
        #warn "$code[$c]: $col_min - $col_max\n";

    }
    if ($code[-1] eq "L") {
        $col = $col_min;
    }
    else {
        $col = $col_max;
    }

    # print output
    my $seat = ($row * 8) + $col;
    print "Row: $row Col: $col SeatID: $seat\n";
    $seat_max = $seat if ($seat > $seat_max);   
}
print "Max SeatID: $seat_max\n";