import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import numpy as np

#soa =np.array( [ [1,1, 1,1, 1,1], [1,1, 1,1, 1,1] ]) 
soa =np.array([ [0,0,0, 1,1,1] ]) 

X,Y,Z,U,V,W = zip(*soa)
fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
ax.quiver(X,Y,Z,U,V,W)
ax.set_xlim([0,1])
ax.set_ylim([0,1])
ax.set_zlim([0,1])
plt.show()

