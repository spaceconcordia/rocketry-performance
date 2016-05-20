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

  def test_qr_method_1(self):
    p_vec = np.array([1,1,1])
    q_vec = np.array([1,1,1])
    q_ang = math.pi/2

    v_actual = quaternion_rotation_m1(p_vec, q_vec, q_ang)
    v_expected = (0.0, 1.0, 2.220446049250313e-16)

    self.assertEqual( v_actual, v_expected )

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

    # perform the rotation
    v_actual = qv_product(r1, y_axis_unit)
    v_actual = qv_product(r2, v_actual)
    v_actual = qv_product(r3, v_actual)

    # assert the actual against the expected
    v_expected = (0.0, 1.0, 2.220446049250313e-16)
    self.assertEqual( v_actual, v_expected )


  def test_transformation_Matrix(self):
    # point to rotate
    P = np.matrix([1, -1, 2]);

    # rotation vector co-ordinates:
    R = np.array([0, 0.5, math.sqrt(3)/2])

    # angle of rotation (radians)
    rotation_angle = 60 * math.pi/180

    # normalize rotation vector (return unit vector)
    norm_v = v_normalize(R)
    norm_v = np.asmatrix(norm_v)
    print norm_v

    # obtain rotation matrix
    R_mat = q_R_matrix(norm_v, rotation_angle)

    P_T = np.asmatrix(P.T)

    P_rotated = R_mat*P_T
        
    P_expected = np.matrix([[2.1160254], [0.5580127], [1.10048095]])

    self.assertAlmostEqual(P_rotated[0,0], P_expected[0,0] )
    self.assertAlmostEqual(P_rotated[1,0], P_expected[1,0] )
    self.assertAlmostEqual(P_rotated[2,0], P_expected[2,0] )
  
    #plot_arrows( np.array([ [P_rotated[0,0],P_rotated[1,0],P_rotated[1,0], 1,1,1] ]) )
    #plot_arrows( np.array([ [P[0,0],P[0,1],P[0,1], 1,1,1] ]) )
    #plt.show()

  def test_quaternion_rotation_m2(self):
    P = np.matrix([1,-1,2])
    R = np.array([0,0.5,math.sqrt(3)/2])
    rotation_angle = 60 * math.pi/180

    P_rotated = quaternion_rotation_m2(P,R,rotation_angle)

    print "P_rotated" 
    print P_rotated

    P_expected = np.matrix([[2.1160254], [0.5580127], [1.10048095]])

    self.assertAlmostEqual(P_rotated[0,0], P_expected[0,0] )
    self.assertAlmostEqual(P_rotated[1,0], P_expected[1,0] )
    self.assertAlmostEqual(P_rotated[2,0], P_expected[2,0] )

if __name__ == '__main__':
  unittest.main()
