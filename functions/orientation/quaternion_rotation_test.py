import unittest
import numpy
from quaternion_rotation import *

from matplotlib.pylab import *
from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt

class TestQuaternionMethods(unittest.TestCase):

  #def test_v_normalize(self):
  #def test_q_product(self):
  #def test_q_conjugate(q):

  def test_qv_product(self):
    '''
    A sequence of 90-degree rotations about the x, y, and z
    axes will return a vector on the y axis to its original position.
    '''
    # define each axis rotation
    x_axis_unit = (1, 0, 0)
    y_axis_unit = (0, 1, 0)
    z_axis_unit = (0, 0, 1)

    # convert the rotations into a quaternion
    r1 = axisangle_to_q(x_axis_unit, numpy.pi / 2)
    r2 = axisangle_to_q(y_axis_unit, numpy.pi / 2)
    r3 = axisangle_to_q(z_axis_unit, numpy.pi / 2)

    #
    v_actual = qv_product(r1, y_axis_unit)
    v_actual = qv_product(r2, v_actual)
    v_actual = qv_product(r3, v_actual)

    # assert the actual against the expected
    v_expected = (0.0, 1.0, 2.220446049250313e-16)
    print v_expected
    print v_actual
    self.assertEqual(v_actual, v_expected )

    plot_arrows( np.array([ [1,1,1, 1,1,1] ]) )

if __name__ == '__main__':
  unittest.main()
