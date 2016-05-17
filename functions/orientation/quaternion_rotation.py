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
  plt.show()

'''
Return a unit vector
'''
def v_normalize(v, tolerance=0.00001):
  mag2 = sum(n * n for n in v)
  if abs(mag2 - 1.0) > tolerance:
    mag = sqrt(mag2)
    v = tuple(n / mag for n in v)
  return v

'''
Vector multiplication (cross product)
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
Concatenations of rotations correspond to mulplications
of unit quaternions

Return the vector multiplication of two quaternions
i.e. a new quaternion
'''

def qv_product(q1,v1):
  q2 = (0.0,) + v1
  return q_product(q_product(q1,q2), q_conjugate(q1))[1:]
 
'''
Return the quaternion conjugate
'''
def q_conjugate(q):
  w, x, y, z = q
  return (w, -x, -y, -z)

''' 
Convert from axis-angle rotations to quaternions
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
Convert quaternion to axis-angle rotation
'''
def q_to_axisangle(q):
  w, v = q[0], q[1:]
  theta = acos(w) * 2.0
  return v_normalize(v), theta
