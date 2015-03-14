use Test::More tests => 16;
use Test::Exception;

use strict;
use warnings;

use_ok( 'MarsRovers::Heading' );

my $h = MarsRovers::Heading->new('N');
ok($h eq 'N', 'N heading');

# test valid headings
ok($h->valid_heading($_), "valid heading $_") for qw/N E S W/;
ok(!$h->valid_heading('V'), "invalid heading V");
throws_ok { $h->set('V') } qr/invalid heading/, "die setting invalid heading V";

my %right = (
    N => 'E',
    E => 'S',
    S => 'W',
    W => 'N',
);
for (1..4) {
    my $heading = $h->get;
    $h->change_clockwise;
    my $expected_heading = $right{$heading};
    is($h, $expected_heading, "clockwise $_"); 
}

my %left = reverse %right;
for (1..4) {
    my $heading = $h->get;
    $h->change_anticlockwise;
    my $expected_heading = $left{$heading};
    is($h, $expected_heading, "anticlockwise $_"); 
}

