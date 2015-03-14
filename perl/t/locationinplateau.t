use Test::More tests => 8;

use Test::Exception;

use strict;
use warnings;

use_ok( 'MarsRovers::LocationInPlateau' );
use_ok( 'MarsRovers::Plateau' );

my $plateau = MarsRovers::Plateau->new(1, 0);

my $l = MarsRovers::LocationInPlateau->new(0, 0, $plateau);
isa_ok($l, 'MarsRovers::LocationInPlateau');
ok( $l->plateau, 'location is on a plateau' );
ok( $l->x == 0 && $l->y == 0, '0, 0 point with plateau' );

lives_ok { $l->set(1, 0) } 'set in plateau';

throws_ok { $l->set(1, 1) } qr/y is not in plateau/, 'y is not in plateau';
throws_ok { $l->set(-1, 0) } qr/x is not in plateau/, 'y is not in plateau';


