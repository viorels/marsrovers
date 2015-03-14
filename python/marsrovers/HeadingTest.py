#!/usr/bin/python

import unittest
from Heading import Heading


class HeadingTest(unittest.TestCase):
    heading_right = {
        'N': 'E',
        'E': 'S',
        'S': 'W',
        'W': 'N',
    }

    def testCreate(self):
        h = Heading('N')
        self.assertEqual('N', h.get())

    def testRight(self):
        before = Heading('N')
        for i in range(4):
            after = before.change_clockwise()
            expected = self.heading_right[before.get()]
            self.assertEqual(expected, after.get())
            before = after

    def testLeft(self):
        heading_left = dict(zip(self.heading_right.values(),
                                self.heading_right.keys()))
        before = Heading('N')
        for i in range(4):
            after = before.change_anticlockwise()
            expected = heading_left[before.get()]
            self.assertEqual(expected, after.get())
            before = after

if __name__ == "__main__":
    unittest.main()
