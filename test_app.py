# test_app.py
import unittest
from app import add_numbers, subtract_numbers

class TestApp(unittest.TestCase):
    def test_add_positive(self):
        # Test case for adding positive numbers
        self.assertEqual(add_numbers(1, 2), 3)

    def test_add_negative(self):
        # Test case for adding negative numbers
        self.assertEqual(add_numbers(-1, -2), -3)

    def test_subtract(self):
        # Test case for subtraction
        self.assertEqual(subtract_numbers(10, 5), 5)

    def test_subtract_result_negative(self):
        # Test case where subtraction results in a negative number
        self.assertEqual(subtract_numbers(5, 10), -5)

if __name__ == '__main__':
    unittest.main()
