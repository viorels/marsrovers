class Plateau:
    """Plateau class"""

    deltas = {
        'N': (0, 1),
        'S': (0, -1),
        'W': (-1, 0),
        'E': (1, 0),
    }

    def __init__(self, max_x, max_y):
        self.max_x = max_x
        self.max_y = max_y

    def contains_location(self, l):
        return 0 <= l.x <= self.max_x and 0 <= l.y <= self.max_y

    def delta_for_heading(self, heading):
        return self.deltas[str(heading)]
