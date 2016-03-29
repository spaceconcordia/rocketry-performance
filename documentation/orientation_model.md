## Rocket Orientation

While good results have been achieved thus far, a 6DOF simulator is preferable to produce the most realistic simulation possible. 
It would be possible to account for wind turbulence and other disruptions which are not confined to a single axis. 
If all forces and moments can be clearly defined, it also allows a seamless coupling of the point-mass and rigid body rotation systems described earlier, as well as the pitch/yaw and roll systems.

Building on the material explored in the Angular Stability model, this section introduces topics relating to the orientation of the rocket during flight.

[img_rocket_flight_forces_moments_label]: images/rocket_flight_forces_moments.png "Forces and Moments Experienced by rocket in flight" 
![Forces and Moments Experienced by rocket in flight \label{img_rocket_flight_forces_moments_label}][img_rocket_flight_forces_moments_label] 

\clearpage

### Rotations 

*Spherical  Coordinates* and *Euler Angles* are commonly used to describe the orientation of an object, however both systems encounter singularities where the orientation is ambiguous. 
Special cases are required to handle these singularities, which complicate the analysis and programming.

### Quaternions 

*Quaternions* are commonly used to describe spatial rotation, avoiding singularities. 

An initial position is taken as reference to describe subsequent changes in orientation.
Vectors can be transformed from rocket coordinates to world coordinates, and the reverse.

Leonhard Euler proved that 

\begin{equation}
\label{eq_euler_mult}
e^{i\phi} = \cos \phi + i \sin \phi
\end{equation}

Thus, $e^{i\phi}$ lies on the unit circle in the complex plane, and has a unit length.

Multiplication

$$
(a+bi)(c+di) = re^{i\phi}se^{i\phi} = rse^{i(\phi + \theta)}
$$

$$
i^2 = j^2 = k^2 = ijk = -1
$$

Quaternions

$$
H = { a + bi + cj + dk : a,b,c,d \forall R }j
$$

$i$, $j$, $k$ are all square roots of $-1$

$$
ij = k = -ji 
$$
$$
jk = i = -kj 
$$
$$
ki = j = -ik
$$

If we consider three-dimensional space to be purely imaginary quaternions:

$$
R^3 = {xi + yj + zk : x,y,z \forall R}
$$

Rotations are done using unit quaternions

$$
\cos \phi + i \sin \phi 
$$
$$
\cos \phi + j \sin \phi 
$$
$$
\cos \phi + k \sin \phi
$$
Which can be rewritten as 

$$
e^{i\phi}, e^{i\phi}, e^{k\phi}
$$

For example, taking any arbitrary unit quaternion (*vector*) **u**

$$
u = u_1i + u_2j + u_3k = e^{u\phi}
$$

We can rotate another arbitrary vector **v** about the axis in the **u** direction

$$
e^{u\phi}ve^{-u\phi}
$$

http://math.ucr.edu/~huerta/introquaternions.pdf

### Parameters needed for quaternion analysis

- rocket mass
- **reference length**
- angle-of-attack
- reference area
- longitudinal moment of inertia
- radial moment of inertia
- thrust force
- drag force
- weight force
- pitching moment
- pitch damping moment
- yawing moment
- yaw damping moment
- ~~roll moment~~
- ~~roll forcing moment~~
- ~~roll damping moment~~
- normal force
- side force
- pitch rate
- raw rate
- roll rate
- wind velocity

### Rocket Moments

A *Pitch Moment* and *Pitch Damping Moment* are defined, which are different than the *Corrective Moment Coefficient* and the *Damping Moment Coefficient*.
Note: a complementary *Yaw Moment* and *Yaw Damping Moment* are implied, with exactly the same considerations for motion along the uncoupled complementary yaw-axis. 

### Pitch Moment

The *Pitch Moment* is taken from the tip of the nose cone, it must be moved to the COG to mirror *Corrective Moment Coefficient*.

\begin{equation}
\label{eq_pitching_moment}
M_{pm}(x) = - \dfrac{1}{2} \rho v^2 C_m A_{ref} * L_{ref}
\end{equation}

TODO why minus?

Where:

- $\rho$ is the local atmospheric density
- $v$ is the rocket velocity relative to the surrounding air
- $A_ref$ is the reference area (frontal or side?)
- $L_{ref}$ is ???

### Pitch Moment Coefficient

\begin{equation}
\label{eq_pitch_moment}
C_m = C_m - F_s \cdot COG \cdot L_{ref} 
\end{equation}

Where:

- $F_s$ is the side force

### Fin-set Pitch Moment Coefficient

\begin{equation}
M_{pm} = \dfrac{C_N \times COP}{L_{ref}}
\end{equation}

### Body Tube and Fin Set Interference Pitch Moment Coefficient
\begin{equation}
M_{pm} = \dfrac{C_N \times COP_x}{L_{ref}}
\end{equation}

### Barrowman Calculation 
\begin{equation}
total.getCM + forces.getCM
\end{equation}

### Final Solver Pitch Moment Coefficient

\begin{equation}
M_{pm} = M_{pm} + \left( \text{randomness}  \right)
\end{equation}

Some randomness is added to avoid an "over-perfect" solution

### Pitch Damping Moment

- significant only near apogee

