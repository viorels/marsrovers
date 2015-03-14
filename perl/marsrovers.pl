#!/usr/bin/perl 
#===============================================================================
#
#         FILE:  marsrovers.pl
#
#        USAGE:  cat test_input.txt | ./marsrovers.pl
#
#  DESCRIPTION:  Mars rovers simulation for CVSDude
#
#      OPTIONS:  Feed input as seen in README file
# REQUIREMENTS:  ---
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:  Viorel Stirbu (vio), viorels@gmail.com
#      COMPANY:  
#      VERSION:  1.0
#      CREATED:  07/21/2009 04:00:58 PM
#     REVISION:  ---
#===============================================================================

use strict;
use warnings;

use lib 'lib';
use MarsRovers;
use IO::Handle;

# check if STDIN is redirected (not a tty) and wrap it in an IO::Handle
die "Redirect input from a file containing plateau and rovers data.\n" if -t STDIN;
my $stdin = new IO::Handle;
$stdin->fdopen(fileno(STDIN),"r") or die "can't open stdin";

# read plateau upper right coordinates
my ($plateau_x, $plateau_y) = split /\s/, $stdin->getline;
die "Unknown plateau upper right coordinates" unless length $plateau_x && length $plateau_y;
my $mars_rovers = MarsRovers->new($plateau_x, $plateau_y);

# read rover data until either EOF or an incomplete record is found
while (not $stdin->eof) {
    my ($x, $y, $heading) = split /\s/, $stdin->getline;
    my $instructions = $stdin->getline;
    chomp $instructions if defined $instructions;
    last unless length $x && length $y && $heading && $instructions;

    $mars_rovers->add_rover_data($x, $y, $heading, $instructions);
}
$stdin->close;

# run the simulation with provided data
$mars_rovers->run;

# fetch current state of rovers and print it to STDOUT
my $rovers = $mars_rovers->get_rovers;
print "$_\n" for @$rovers;

exit(0);

