#!/usr/bin/perl

use strict;
use warnings;

my %required = ( 'byr' => 'Birth Year',
                 'iyr' => 'Issue Year',
                 'eyr' => 'Expiration Year',
                 'hgt' => 'Height',
                 'hcl' => 'Hair Color',
                 'ecl' => 'Eye Color',
                 'pid' => 'Passport ID'
                 #'cid' => 'Country ID'
);
my $num_fields = 7;

my $total    = 0;
my $valid    = 0;
my $passport = '';
my $result   = undef;
while (<>) {
    if (/^\n/) {
        $total++;
        $passport =~ s/^\s//;
        $result = validate($passport);
        $valid ++ if ($result eq "valid");
        $passport = '';
    }
    else {
        chomp;
        $passport .= " $_"
    }
}
# last record
$total++;
$passport =~ s/^\s//;
$result = validate($passport);
$valid ++ if ($result eq "valid");

print "Total: $total\nValid: $valid\n";

sub validate {
    my $data   = shift @_;
    my @fields = split(/\s+/, $data);
    my $cnt = 0;
    foreach my $fld (@fields) {
        my ($key, $val) = split (/:/, $fld);
        $cnt++ if (defined $required{$key});
    }
    if ($cnt == $num_fields) {
        return "valid";
    }
    else {
        print "INVALID: $data\n";
        return "invalid";
    }
}