"""tests for main"""
import unittest
from main import Dice, InvalidDieError

class TestRoll(unittest.TestCase):
    """test cases for main.py"""
    def test_roll(self):
        """roll should do things"""
        result = Dice._roll(1, 6)
        self.assertEqual(len(result), 1)
        self.assertTrue(result[0] >= 1 and result[0] <= 6)
        # self.assertGreaterEqual(result[0], 0)
        # self.assertLessEqual(result[0], 5)

    def test_rejects_invalid_dice(self):
        """should not allow things like d-6, d0, or d > 2**16"""
        self.assertRaises(InvalidDieError, Dice._roll, 1, -6)

    def test_should_be_in_range(self):
        """should return values between 1 and the number of sides on the dice"""
        results = Dice._roll(100, 2)
        self.assertTrue(1 in results)
        self.assertTrue(2 in results)
        self.assertFalse(0 in results)
        self.assertFalse(3 in results)

class TestParseDice(unittest.TestCase):
    """testing the parse_dice method of main"""
    def test_parse_dice(self):
        """in ideal usage, should return a 2-tuple of (amount, sides)"""
        result = Dice._parse('3d20')
        self.assertEqual(type(result), tuple)
        self.assertEqual(result[0], 3)
        self.assertEqual(result[1], 20)

    def test_no_amount(self):
        """should assume that if there is no amount specified, roll 1"""
        result = Dice._parse('d4')
        self.assertEqual(result[0], 1)

    def test_no_sides(self):
        """should raise an exception if no sides arg given"""
        self.assertRaises(InvalidDieError, Dice._parse, '16d')

class TestIntegration(unittest.TestCase):
    """test the integration of our units"""
    def test_parse_and_roll(self):
        """test that the results of parsing can be interpreted by roll"""
        d = Dice.from_string('2d8')
        self.assertEqual(d.amount, 2)
        self.assertEqual(d.sides, 8)
        # assert no errors
        result = d.roll()
        self.assertEqual(len(result), 2)

if __name__ == '__main__':
    unittest.main()
