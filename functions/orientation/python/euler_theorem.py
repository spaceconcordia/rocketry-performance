import numpy as np
import math

def c1_matrix(rotation_angle):
    ra = rotation_angle
    return np.matrix([
        [1,     0,                0            ],
        [0,     math.cos(ra),     math.sin(ra) ],
        [0,     -math.sin(ra),    math.cos(ra) ]
    ])
        
def c2_matrix(rotation_angle):
    ra = rotation_angle
    return np.matrix([
        [math.cos(ra),     0,                -math.sin(ra) ],
        [0,                1,                0             ],
        [math.sin(ra),     0,                math.cos(ra)  ]
    ])

def c3_matrix(rotation_angle):
    ra = rotation_angle
    return np.matrix([
        [math.cos(ra),     math.sin(ra),     0 ],
        [-math.sin(ra),    math.cos(ra),     0 ],
        [0,                0,                1 ]
    ])


