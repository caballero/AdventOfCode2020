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
        if (defined $required{$key}) {
            my $res = validateField($key, $val);
            $cnt++ if ($res eq "valid");  
        }
    }
    if ($cnt == $num_fields) {
        return "valid";
    }
    else {
        return "invalid";
    }
}

sub validateField {
    my $field = shift @_;
    my $value = shift @_;
    my $check = "invalid";
    if ($field eq "byr") {
        if ($value =~ /^\d\d\d\d$/) {
            if ($value >= 1920 and $value <= 2002) {
                $check = "valid";
            }
        }
    }
    elsif ($field eq "iyr") {
        if ($value =~ /^\d\d\d\d$/) {
            if ($value >= 2010 and $value <= 2020) {
                $check = "valid";
            }
        }
    }
    elsif ($field eq "eyr") {
        if ($value =~ /^\d\d\d\d$/) {
            if ($value >= 2020 and $value <= 2030) {
                $check = "valid";
            }
        }
    }
    elsif ($field eq "hgt") {
        if ($value =~ /^(\d+)(\w\w)$/) {
            my $val  = $1;
            my $unit = $2;
            if ($unit eq "cm") {
                if ($val >= 150 and $val <= 193) {
                    $check = "valid";
                }
            }
            elsif ($unit eq "in") {
                if ($val >= 59 and $val <= 76) {
                    $check = "valid";
                }
            }
        }
    }
    elsif ($field eq "hcl") {
        if ($value =~ /^#[0123456789abcdef]{6,6}$/) {
                $check = "valid";
        }
    }
    elsif ($field eq "ecl") {
        if ($value =~ /^amb|blu|brn|gry|grn|hzl|oth$/) {
            $check = "valid";
        }
    }
    elsif ($field eq "pid") {
        if ($value =~ /^\d{9,9}$/) {
            $check = "valid";
        }
    }
    print "$field -> $value\n" if ($check eq "invalid");
    return $check;
}