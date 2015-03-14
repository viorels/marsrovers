use Test::More tests => 13;

use strict;
use warnings;

use_ok( 'MarsRovers::Plateau' );
use_ok( 'MarsRovers::Location' );

# create and validate a plateau
my $p = MarsRovers::Plateau->new(1, 0);
is($p->max_x, 1, 'max_x ok');
is($p->max_y, 0, 'max_y ok');

# test margins
ok(!$p->contains_x(-1), 'x = -1 is out');
ok($p->contains_x(0),   'x = 0 is in');
ok($p->contains_x(1),   'x = 1 is in');
ok(!$p->contains_x(2),  'x = 2 is out');

ok(!$p->contains_y(-1), 'y = -1 is out');
ok($p->contains_y(0),   'y = 0 is in');
ok(!$p->contains_y(2),  'y = 2 is out');

# test margins with location object
my $l = MarsRovers::Location->new(0, 0);
ok($p->contains_location($l), 'contains location');
$l->set(1, 1);
ok(!$p->contains_location($l), "doesn't contain location");


