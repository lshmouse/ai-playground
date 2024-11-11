import unittest

import example


class TestBasic(unittest.TestCase):
    def test_add(self):
        self.assertEqual(example.add(1, 2), 3)
        self.assertEqual(example.add(2, 2), 4)


if __name__ == "__main__":
    unittest.main()
