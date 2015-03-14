package MarsRovers::Location;

use Carp;

=head1 NAME

MarsRovers::Location - Simple location class

=head1 SYNOPSIS

  my $location = MarsRovers::Location->new(0, 1);

=head1 DESCRIPTION

Simple location class without any validation. It holds x and y coordinates 
and knows how to move to new absolute and relative coordinates.

=head1 FUNCTIONS

=head2 new

Creates a new Location object. Requires x and y arguments.

=cut

sub new {
    my ($class, $x, $y) = @_;
    my $self = bless {}, $class;

    $self->set($x, $y);

    return $self;
}

=head2 get

Get coordinates in array ref like [$x, $y].

=cut

sub get {
    my ($self) = @_;
    return [$self->x, $self->y];
}

=head2 set

Move to new absolute coordinates specified by x, y.

=cut

sub set {
    my ($self, $x, $y) = @_;

    $self->x($x);
    $self->y($y);

    return $self;
}

=head2 move_with

Move to new relative (to current location) coordinates specified by dx, dy.

=cut

sub move_with {
    my ($self, $dx, $dy) = @_;

    if (defined $dx and defined $dy) {
        $self->set($self->x + $dx, $self->y + $dy);
    }
    else {
        croak "undefined delta coordinates";
    }

    return $self;
}

=head2 x

Setter/getter for x. Accepts one argument, the new value.

=cut

sub x {
    my ($self, $x) = @_;

    if (@_ == 2) {
        if (defined $x) {
            $self->{'x'} = $x;
        }
        else {
            croak "undefined x coordinate";
        }
    }

    return $self->{'x'};
}

=head2 y

Setter/getter for y. Accepts one argument, the new value.

=cut

sub y {
    my ($self, $y) = @_;

    if (@_ == 2) {
        if (defined $y) {
            $self->{'y'} = $y;
        }
        else {
            croak "undefined y coordinate";
        }
    }

    return $self->{'y'};
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
