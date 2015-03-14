#!/usr/bin/python

from sys import stdin

from marsrovers.Plateau import Plateau
from marsrovers.Rover import Rover
from marsrovers.Location import LocationInPlateau
from marsrovers.Heading import Heading


def simulate():
    (plateau_x, plateau_y) = [int(e) for e in
                              stdin.readline().rstrip("\r\n").split(" ")]
    plateau = Plateau(plateau_x, plateau_y)

    done = False
    while not done:
        try:
            (xs, ys, h) = stdin.readline().rstrip("\r\n").split(" ")
            x, y = int(xs), int(ys)
            instructions = stdin.readline().rstrip("\r\n")

            if (len(instructions) > 0):
                rover = Rover(LocationInPlateau(x, y, plateau),
                              Heading(h), plateau)
                rover = rover.execute(instructions)
                print(rover)
            else:
                done = True
        except ValueError:
            done = True

if __name__ == "__main__":
    if stdin.isatty():
        print("Please pipe input data from file, " +
              "e.g. cat test_input.txt | ./marsrovers.py")
    else:
        simulate()
