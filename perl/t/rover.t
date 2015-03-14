use Test::More tests => 25;

use strict;
use warnings;

use_ok( 'MarsRovers::Rover' );
use_ok( 'MarsRovers::Plateau' );

my $p = MarsRovers::Plateau->new(1, 2);
my $r = MarsRovers::Rover->new(1, 1, 'N', $p);

ok($r->location->x == 1 && $r->location->y == 1, '1, 1 location');
ok($r->heading eq 'N');

$r->heading('S');
is($r->heading, 'S', 'changed heading to S');

my %right = (
    N => 'E',
    E => 'S',
    S => 'W',
    W => 'N',
);
for (1..4) {
    my $heading = $r->heading;
    $r->right;
    my $new_heading = $right{$heading};
    is($r->heading, $new_heading, "right $_"); 
}

my %left = reverse %right;
for (1..4) {
    my $heading = $r->heading;
    $r->left;
    my $new_heading = $left{$heading};
    is($r->heading, $new_heading, "left $_"); 
}

# Set 1, 1, N for next test
ok($r->location->x == 1 && $r->location->y == 1, '1, 1 location');
$r->heading('N');

# Test "that the square directly North from (x, y) is (x, y+1)"
my ($x, $y) = ($r->location->x, $r->location->y);
$r->move;
ok($r->location->x == $x && $r->location->y == $y+1, '0, 1 location');

# Circle left (counter-clockwise) starting at 1,2
for my $expected_location ([0,2], [0,1], [1, 1], [1, 2]) {
    $r->left;
    $r->move;
    is_deeply($r->location->get, $expected_location, "circle left to @$expected_location");
}

# Face east after this test
$r->execute('LRRRML');
is_deeply($r->location->get, [1, 1], 'test all commands');
is($r->heading, 'E', 'face east');

# Circle clockwise, with commands now
for my $expected_location ([1, 0], [0,0], [0, 1], [1, 1]) {
    $r->execute($_) for ('R', 'M');
    is_deeply($r->location->get, $expected_location, "circle right to @$expected_location");
}

