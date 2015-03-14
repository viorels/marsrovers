package MarsRovers::Heading;

use Carp;
use List::MoreUtils qw(any first_index);

=head1 NAME

MarsRovers::Heading - Simple heading class

=head1 SYNOPSIS

  my $heading = MarsRovers::Heading->new('N');

=head1 DESCRIPTION

Simple heading class that knows how to rotate itself clockwise or anti-clockwise.

=cut

use overload (
    q{""}       => \&stringify,
    fallback    => 1,
);

# headings in clockwise order
our @headings = qw/ N E S W /;

=head1 FUNCTIONS

=head2 new

Creates a new heading object. Requires an upper case initial like N, E, S or W.

=cut

sub new {
    my ($class, $heading) = @_;

    croak 'invalid heading' unless $class->valid_heading($heading);
    my $self = bless \$heading, $class;

    return $self;
}

=head2 get

Returns the heading as a char.

=cut

sub get {
    my ($self) = @_;
    return $$self;
}

=head2 set

Validate and set a new heading.

=cut

sub set {
    my ($self, $heading) = @_;

    croak 'invalid heading' unless $self->valid_heading($heading);
    $$self = $heading;

    return $self;
}

=head2 valid_heading

Checks if the char argument is a valid heading.

=cut

sub valid_heading {
     my ($class, $heading) = @_;
     return any { $_ eq $heading } @headings;
}

=head2 change

Change the heading to the next after current one in specified direction.
Direction can be 1 for clockwise and -1 for anti-clockwise.

=cut

sub change {
    my ($self, $direction) = @_;

    # find the index of the heading in the ordered headings list
    my $num_heading = first_index { $_ eq $$self } @headings;

    # increment/decrement with 1 as requested
    $num_heading    += $direction;

    # decrement/increment with 4 to keep it in range (if outside)
    if ($num_heading < 0 or $num_heading >= scalar @headings) {
        $num_heading -= $direction * scalar @headings;
    }
    
    $$self = $headings[$num_heading];

    return $self;
}

=head2 change_clockwise

Change the heading clockwise.

=cut

sub change_clockwise {
    my ($self) = @_;
    return $self->change(+1);
};

=head2 change_anticlockwise

Change the heading anticlockwise.

=cut

sub change_anticlockwise {
    my ($self) = @_;
    return $self->change(-1);
}

=head2 stringify

Called automatically when stringification is required.

=cut

sub stringify {
    my ($self) = @_;
    return $self->get;
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
