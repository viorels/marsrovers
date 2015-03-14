class Heading:
    """Heading class"""

    headings = ('N', 'E', 'S', 'W')

    def __init__(self, heading):
        if not self.valid_heading(heading):
            raise IndexError("invalid heading")
        self.heading = heading

    def get(self):
        return self.heading

    def valid_heading(self, heading):
        return heading in self.headings

    def change(self, direction):
        num_heading = self.headings.index(self.heading)

        num_heading += direction
        if num_heading < 0 or num_heading >= len(self.headings):
            num_heading -= direction * len(self.headings)

        return Heading(self.headings[num_heading])

    def change_clockwise(self):
        return self.change(+1)

    def change_anticlockwise(self):
        return self.change(-1)

    def __str__(self):
        return self.get()
