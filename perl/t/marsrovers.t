use Test::More tests => 4;

use strict;
use warnings;

use_ok( 'MarsRovers' );

my $mr = MarsRovers->new(5,5);
$mr->add_rover_data(1, 2, 'N', 'LMLMLMLMM');
$mr->add_rover_data(3, 3, 'E', 'MMRMMRMRRM');
my @expected = ([1, 3, 'N'], [5, 1, 'E']);

# Simulate
$mr->run;

my $rovers = $mr->get_rovers;
is( scalar @$rovers, 2, 'got 2 rovers' );

for my $i (0..$#$rovers) {
    my $rover = $rovers->[$i];
    is_deeply([ $rover->location->x, $rover->location->y, $rover->heading ], 
        $expected[$i]);
}

