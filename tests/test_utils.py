import unittest

from src.utils import *

class TestUtils(unittest.TestCase):
    def test_is_prime(self):
        self.assertFalse(is_prime(4))
        self.assertTrue(is_prime(2))
        self.assertTrue(is_prime(3))
        self.assertFalse(is_prime(8))
        self.assertFalse(is_prime(10))
        self.assertTrue(is_prime(7))
        self.assertEqual(is_prime(-3),
                         "Negative numbers are not allowed")

    def test_cubic(self):
        self.assertEqual(cubic(2), 8)
        self.assertEqual(cubic(-2), -8)
        self.assertNotEqual(cubic(2), 4)
        self.assertNotEqual(cubic(-3), 27)

    def test_say_hello(self):
        self.assertEqual(say_hello("XYZ"), "Hello, XYZ")
        self.assertEqual(say_hello("ABC"), "Hello, ABC")

