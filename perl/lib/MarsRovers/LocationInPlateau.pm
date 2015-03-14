package MarsRovers::LocationInPlateau;
use base 'MarsRovers::Location';

use Carp;

=head1 NAME

MarsRovers::LocationInPlateau - Location class with plateau validation

=head1 SYNOPSIS

  my $plateau = MarsRovers::Plateau(5, 5);
  my $location = MarsRovers::LocationInPlateau->(0, 1, $plateau);

=head1 DESCRIPTION

Advanced location class based on MarsRovers::Location. It validates that
the coordinates are contained in the associated plateau.

=head1 FUNCTIONS

=head2 new

Creates a new LocationInPlateau object. Requires x, y and Plateau arguments.

=cut

sub new {
    my ($class, $x, $y, $plateau) = @_;

    my $self = $class->SUPER::new($x, $y);

    if ($plateau) {
        $self->plateau($plateau);
    }
    else {
        croak "no plateau specified";
    }

    return $self;
}

=head2 plateau

Setter/getter for plateau.

=cut

sub plateau {
    my ($self, $plateau) = @_;

    $self->{'plateau'} = $plateau if @_ == 2;

    return $self->{'plateau'};
}

=head2 x

Setter/getter for x. Accepts one argument, the new value.
Throws exception if the new point is outside the Plateau.

=cut

sub x {
    my ($self, $x) = @_;

    if ( @_ == 2 ) {
        if ( $self->plateau and not $self->plateau->contains_x($x) ) {
            croak "x is not in plateau";
        }
        elsif ( $x != int $x ) {
            croak "x is not integer";
        }
        $self->SUPER::x($x);
    }
    else {
        $x = $self->SUPER::x();
    }

    return $x;
}

=head2 y

Setter/getter for y. Accepts one argument, the new value.
Throws exception if the new point is outside the Plateau.

=cut

sub y {
    my ($self, $y) = @_;

    if ( @_ == 2 ) {
        if ( $self->plateau and not $self->plateau->contains_y($y) ) {
            croak "y is not in plateau";
        }
        elsif ( $y != int $y ) {
            croak "y is not integer";
        }
        $self->SUPER::y($y);
    }
    else {
        $y = $self->SUPER::y();
    }

    return $y;
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
