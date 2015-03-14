#!/usr/bin/python

import unittest
from Rover import Rover
from Plateau import Plateau
from Location import LocationInPlateau
from Heading import Heading


class HeadingTest(unittest.TestCase):
    def getRover(self):
        p = Plateau(2, 2)
        return Rover(LocationInPlateau(0, 1, p), Heading('N'), p)

    def testCreate(self):
        r = self.getRover()
        self.assertEqual('0 1 N', str(r))

    def testLeft(self):
        r = self.getRover().left()
        self.assertEqual('0 1 W', str(r))

    def testRigth(self):
        r = self.getRover().right()
        self.assertEqual('0 1 E', str(r))

    def testMove(self):
        r = self.getRover().move()
        self.assertEqual('0 2 N', str(r))

if __name__ == "__main__":
    unittest.main()
