package MarsRovers::Rover;

use Carp;
use MarsRovers::LocationInPlateau;
use MarsRovers::Heading;

=head1 NAME

MarsRovers::Rover - Rover class, aware of it's location and heading

=head1 SYNOPSIS

  my $plateau = MarsRovers::Plateau->new(5, 5);
  my $rover = MarsRovers::Rover->new(0, 0, 'N', $plateau);
  $rover->execute('LLLM');
  print "$rover\n";

=head1 DESCRIPTION

Rover class that knows how to execute change of heading and move commands.
It stringifies to it's coordinates and heading for easy printing.

=cut

use overload (
    q{""}       => \&stringify,
    fallback    => 1,
);

use Class::MethodMaker [
    scalar => [qw/ location plateau /],
    new    => [qw/ -init new /],
];

our %known_instructions = (
    L => 'left',
    R => 'right',
    M => 'move',
);

=head1 FUNCTIONS

=head2 init

Handle arguments passed to new. Requires 4 arguments: x, y, heading and plateau.

=cut

sub init {
    my ($self, $x, $y, $heading, $plateau) = @_;

    $self->plateau($plateau);
    $self->heading(MarsRovers::Heading->new($heading));

    my $location = MarsRovers::LocationInPlateau->new($x, $y, $plateau);
    $self->location($location);

    return;
}

=head2 heading

Setter/getter for heading with object promotion/demotion.

=cut

sub heading {
    my ($self, $heading) = @_;

    if (@_ == 2) {
        $heading = MarsRovers::Heading->new($heading) unless ref $heading;
        $self->{'heading'} = $heading;
    }

    return $self->{'heading'}->get;
}

=head2 left

Rotate left instruction.

=cut

sub left {
    my ($self) = @_;
    $self->{'heading'}->change_anticlockwise;
    return;
}

=head2 right

Rotate right instruction.

=cut

sub right {
    my ($self) = @_;
    $self->{'heading'}->change_clockwise;
    return;
}

=head2 move

Move instruction. Move with one square in current heading.

=cut

sub move {
    my ($self) = @_;
    
    my ($dx, $dy) = @{ $self->plateau->delta_for_heading($self->heading) };
    $self->location->move_with($dx, $dy); 

    return;
}

=head2 execute

Execute one of the accepted instructions.

=cut

sub execute {
    my ($self, $instructions) = @_;

    for my $instruction (split //, $instructions) {
        if ( my $instruction_name = $known_instructions{$instruction} ) {
            $self->$instruction_name;
        }
        else {
            croak "unknown instruction";
        }
    }

    return;
}

=head2 stringify

Called automatically when stringification is required.

=cut

sub stringify {
    my ($self) = @_;
    return join q{ }, $self->location->x, $self->location->y, $self->heading;
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
