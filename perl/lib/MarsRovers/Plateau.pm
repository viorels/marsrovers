package MarsRovers::Plateau;

use Class::MethodMaker [
    scalar => [qw/ max_x max_y /],
    new    => [qw/ -init new /],
];

=head1 NAME

MarsRovers::Plateau - Plateau class

=head1 SYNOPSIS

  my $plateau = MarsRovers::Plateau->new(5, 5);

=head1 DESCRIPTION

Plateau class that is aware of it's boundaries. It also knows in which direction is each heading.

=cut

# variation in coordinates for a move in each heading
our %deltas = (
    'N' => [ 0,  1],
    'S' => [ 0, -1],
    'W' => [-1,  0],
    'E' => [ 1,  0],
);

=head1 FUNCTIONS

=head2 init

Handle arguments passed to new. Requires 2 arguments, coordiantes of upper right corner.
Lower left corner is assumed to be 0, 0.

=cut

sub init {
    my ($self, $max_x, $max_y) = @_;

    $self->max_x($max_x);
    $self->max_y($max_y);

    return;
}

=head2 contains_location

Returns true if specified Location object is in plateau.

=cut

sub contains_location {
    my ($self, $location) = @_;
    return $self->contains_x($location->x) && $self->contains_y($location->y);
}

=head2 contains_x

Returns true if argument x is in plateau.

=cut

sub contains_x {
    my ($self, $x) = @_;
    return defined $x && 0 <= $x && $x <= $self->max_x;
}

=head2 contains_y

Returns true if argument y is in plateau.

=cut

sub contains_y {
    my ($self, $y) = @_;
    return defined $y && 0 <= $y && $y <= $self->max_y;
}

=head2 delta_for_heading

Returns [$dx, $dy], deltas for moving in the heading passed as argument.

=cut

sub delta_for_heading {
    my ($self, $heading) = @_;
    return $deltas{$heading};
}

=head1 AUTHOR

Viorel Stirbu
http://perl.stirbu.name

=head1 COPYRIGHT

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.

=cut

1
