package MarsRovers;

use MarsRovers::Plateau;
use MarsRovers::Rover;

use Carp;

=head1 NAME

MarsRovers - Assignment for CVSDude interview

=head1 SYNOPSIS

  use MarsRovers;

  my $mars_rovers = MarsRovers->new($plateau_x, $plateau_y);
  $mars_rovers->add_rover_data($x, $y, $heading, $instructions);
  $mars_rovers->run;
  $rovers = $mars_rovers->get_rovers;

=head1 DESCRIPTION

Implementation of a Mars rovers simulation as requested by CVSDude.
See details of the request in README file.

=head1 FUNCTIONS

=head2 new

Create a MarsRover simulation. Required arguments are upper right corner of plateau.

=cut

sub new {
    my ($class, $max_x, $max_y) = @_;
    my $self = bless {}, $class;
    
    if (defined $max_x and defined $max_y) {
        $self->{'plateau'} = MarsRovers::Plateau->new($max_x, $max_y);
    }
    else {
        croak "plateau upper right corner not specified";
    }

    return $self;
}

=head2 add_rover_data

Add one rover to the simulation. Required arguments are x, y, heading, instructions.

=cut

sub add_rover_data {
    my ($self, $x, $y, $heading, $instructions) = @_;

    my $rover = MarsRovers::Rover->new($x, $y, $heading, $self->{'plateau'});
    push @{ $self->{'rovers'} }, {
        rover           => $rover,
        instructions    => $instructions,
    };

    return;
}

=head2 get_rovers

Returns an array ref of rovers.

=cut

sub get_rovers {
    my ($self) = @_;
    return [ map { $_->{'rover'} } @{ $self->{'rovers'} } ];
}

=head2 run

Run the simulation.

=cut

sub run {
    my ($self) = @_;

    for my $rover_data (@{ $self->{'rovers'} }) {
        my ($rover, $instructions) = @{$rover_data}{qw/rover instructions/};
        eval {
            $rover->execute($instructions);
        };
        carp "Rover $rover lost control: $@" if $@;
    }

    return;
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
