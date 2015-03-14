use Test::More tests => 6;
use Test::Exception;

use strict;
use warnings;

use_ok( 'MarsRovers::Location' );

my $l = MarsRovers::Location->new(0, 0);
ok($l->x == 0 && $l->y == 0, '0, 0 point');

$l->set(1, 1);
ok($l->x == 1 && $l->y == 1, 'set to 1, 1');

$l->move_with(1, 1);
ok($l->x == 2 && $l->y == 2, 'moved with 1, 1');

$l->move_with(0, 0);
ok($l->x == 2 && $l->y == 2, 'no move');

throws_ok { $l->move_with(undef, undef) } qr/undefined delta/, 'fail on undefiend delta';

