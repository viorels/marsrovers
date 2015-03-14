from Heading import Heading
from Location import LocationInPlateau


class Rover:
    """Rover class"""

    known_instructions = {
        'L': 'left',
        'R': 'right',
        'M': 'move',
    }

    def __init__(self, x, y, heading, plateau):
        self.__init__(LocationInPlateau(x, y, plateau),
                      Heading(heading), plateau)

    def __init__(self, location, heading, plateau):
        self.location = location
        self.heading = heading
        self.plateau = plateau

    def left(self):
        return Rover(self.location,
            self.heading.change_anticlockwise(), self.plateau)

    def right(self):
        return Rover(self.location,
            self.heading.change_clockwise(), self.plateau)

    def move(self):
        delta = self.plateau.delta_for_heading(self.heading)
        new_location = self.location.move_with(delta)
        return Rover(new_location, self.heading, self.plateau)

    def execute_one(self, rover, instruction):
        # TODO hasattr/callable ?
        # TODO cache insruction ref
        method = getattr(rover, self.known_instructions[instruction])
        return method()

    def execute(self, instructions):
        return reduce(self.execute_one, instructions, self)

    def __str__(self):
        return str(self.location) + " " + str(self.heading)
