import cmath
import math

from matplotlib.pylab import *
from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt

def plot_arrows(soa):
  X,Y,Z,U,V,W = zip(*soa)
  fig = plt.figure()
  ax = fig.add_subplot(111, projection='3d')
  ax.quiver(X,Y,Z,U,V,W)
  ax.set_xlim([0,1])
  ax.set_ylim([0,1])
  ax.set_zlim([0,1])

''' 
----------------------------------------------------------------------------
Method 1 - Quaternion Rotation

input:
 p_vec - a vector defining the position of a point from the origin
 q_vec - a vector defining the axis of rotation
 q_ang - an angle (radians) defining the rotation about the q_vec

return:
 v_result - vector defining the result after rotation
----------------------------------------------------------------------------
''' 
def quaternion_rotation_m1(p_vec, q_vec, q_ang):
    # define each axis rotation
    x_axis_unit  = np.array([q_vec[0], 0, 0])
    y_axis_unit  = np.array([0, q_vec[1], 0])
    z_axis_unit  = np.array([0, 0, q_vec[2]])

    # convert the rotations into a quaternion
    r1 = axisangle_to_q(x_axis_unit, q_ang / 2)
    r2 = axisangle_to_q(y_axis_unit, q_ang / 2)
    r3 = axisangle_to_q(z_axis_unit, q_ang / 2)

    # perform the rotation
    v_result = qv_product(r1, y_axis_unit)
    v_result = qv_product(r2, v_actual)
    v_result = qv_product(r3, v_actual)

    return v_result

''' 
----------------------------------------------------------------------------
Method 1 - Quaternion Rotation

input:
 p_vec - a vector defining the position of a point from the origin
 r_vec - a vector defining the axis of rotation
 q_ang - an angle (radians) defining the rotation about the q_vec

return:
 v_result - vector defining the result after rotation
----------------------------------------------------------------------------
''' 
def quaternion_rotation_m2(p_vec, r_vec, r_ang):
   norm_v = v_normalize(np.asarray(r_vec))
   norm_v = np.asmatrix(norm_v)

   R_mat = q_R_matrix(norm_v, r_ang)
   
   v_result = R_mat*p_vec.T

   return v_result

'''
----------------------------------------------------------------------------
Return a unit vector
----------------------------------------------------------------------------
'''
def v_normalize(v, tolerance=0.00001):
  mag2 = sum(n * n for n in v)
  if abs(mag2 - 1.0) > tolerance:
    mag = sqrt(mag2)
    v = tuple(n / mag for n in v)
  return v

'''
----------------------------------------------------------------------------
Vector multiplication (cross product)
----------------------------------------------------------------------------
'''
def q_product(q1,q2):
  w1, x1, y1, z1 = q1
  w2, x2, y2, z2 = q2
  w = w1*w2 - x1*x2 - y1*y2 - z1*z2
  x = w1*x2 + x1*w2 + y1*z2 - z1*y2
  y = w1*y2 + y1*w2 + z1*x2 - x1*z2
  z = w1*z2 + z1*w2 + x1*y2 - y1*x2
  return w, x, y, z

''' 
----------------------------------------------------------------------------
Concatenations of rotations correspond to mulplications
of unit quaternions

Return the vector multiplication of two quaternions
i.e. a new quaternion
----------------------------------------------------------------------------
'''
def qv_product(q1,v1):
  q2 = (0.0,) + v1
  return q_product(q_product(q1,q2), q_conjugate(q1))[1:]
 
'''
----------------------------------------------------------------------------
Return the quaternion conjugate
----------------------------------------------------------------------------
'''
def q_conjugate(q):
  w, x, y, z = q
  return (w, -x, -y, -z)

''' 
----------------------------------------------------------------------------
Convert from axis-angle rotations to quaternions
----------------------------------------------------------------------------
'''
def axisangle_to_q(v, theta):
  v = v_normalize(v)
  x, y, z = v
  theta /= 2
  w = math.cos(theta)
  x = x * math.sin(theta)
  y = y * math.sin(theta)
  z = z * math.sin(theta)
  return w, x, y, z

'''
----------------------------------------------------------------------------
Convert quaternion to axis-angle rotation
----------------------------------------------------------------------------
'''
def q_to_axisangle(q):
  w, v = q[0], q[1:]
  theta = acos(w) * 2.0
  return v_normalize(v), theta

''' 
----------------------------------------------------------------------------
Method 2
----------------------------------------------------------------------------
'''
def q_R_matrix(norm_v, angle):
  #print norm_v
  #print angle
  w = math.cos(angle/2)
  print w
  e_x = norm_v[0,0] * math.sin(angle/2)
  print e_x
  e_y = norm_v[0,1] * math.sin(angle/2)
  print e_y
  e_z = norm_v[0,2] * math.sin(angle/2)
  print e_z

  #q_R_matrix = np.zeros(3,3)
  q_R_matrix = np.matrix([ 
      [1-2*e_y**2 - 2*e_z**2, 2*e_x*e_y - 2*w*e_z, 2*e_x*e_z + 2*w*e_y], 
      [2*e_x*e_y + 2*w*e_z, 1-2*e_x**2 - 2*e_z**2, 2*e_y*e_z - 2*w*e_x],
      [2*e_x*e_z - 2*w*e_y, 2*e_y*e_z + 2*w*e_x, 1-2*e_x**2 - 2*e_y**2] 
  ])
  return q_R_matrix
