import unittest
import numpy
from euler_theorem import *

class TestEulerTheoremMethods(unittest.TestCase):

  def test_matrices(self):
      self.assertEqual ( 0, 0 )

      test_angle = math.pi/2
      
      c1_mat = c1_matrix (test_angle)
      c2_mat = c2_matrix (test_angle)
      c3_mat = c3_matrix (test_angle)

      self.assertEqual ( c1_mat[0,0], 1 )
      self.assertEqual ( c1_mat[1,1], math.cos(test_angle) )
      self.assertEqual ( c1_mat[1,2], math.sin(test_angle) )
      self.assertEqual ( c1_mat[2,1], -math.sin(test_angle) )
      self.assertEqual ( c1_mat[2,2], math.cos(test_angle) )

      self.assertEqual ( c2_mat[0,0], math.cos(test_angle) )
      self.assertEqual ( c2_mat[0,2], -math.sin(test_angle) )
      self.assertEqual ( c2_mat[2,0], math.sin(test_angle) )
      self.assertEqual ( c2_mat[2,2], math.cos(test_angle) )

      self.assertEqual ( c3_mat[0,0], math.cos(test_angle) )
      self.assertEqual ( c3_mat[0,1], math.sin(test_angle) )
      self.assertEqual ( c3_mat[1,0], -math.sin(test_angle) )
      self.assertEqual ( c3_mat[1,1], math.cos(test_angle) )

if __name__ == '__main__':
  unittest.main()
