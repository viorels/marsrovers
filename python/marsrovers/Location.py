class Location:
    """Location class"""

    def __init__(self, x, y):
        self.x = x
        self.y = y

    def move_with_xy(self, dx, dy):
        return Location(self.x + dx, self.y + dy)

    def move_with(self, delta):
        return self.move_with_xy(delta[0], delta[1])

    def __str__(self):
        return str(self.x) + " " + str(self.y)


class LocationInPlateau(Location):
    """Location with plateau restriction"""

    def __init__(self, x, y, plateau):
        if not plateau.contains_location(Location(x, y)):
            raise ValueError('location not in plateau')
        Location.__init__(self, x, y)
        self.plateau = plateau
