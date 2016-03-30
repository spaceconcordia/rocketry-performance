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

Thus, $e^{i\phi}$ lies on the unit circle in the complex plane, and has a unit length [@introquaternions].

Multiplication

$$
(a+bi)(c+di) = re^{i\phi}se^{i\phi} = rse^{i(\phi + \theta)}
$$

$$
i^2 = j^2 = k^2 = ijk = -1
$$

Quaternions are typically denoted as the addition of a scalar and vector [@niskanen2013]:

$$
q = w + x\hat{i} + y\hat{j} + z\hat{k} = w + v
$$

$i$, $j$, $k$ are all square roots of $-1$ [@introquaternions]

$$
ij = k = -ji 
$$
$$
jk = i = -kj 
$$
$$
ki = j = -ik
$$

If we consider three-dimensional space to be purely imaginary quaternions [@introquaternions]:

$$
R^3 = {xi + yj + zk : x,y,z \forall R}
$$

Rotations are done using unit quaternions [@introquaternions]

$$
\cos \phi + i \sin \phi 
$$
$$
\cos \phi + j \sin \phi 
$$
$$
\cos \phi + k \sin \phi
$$

Which can be rewritten as [@introquaternions]

$$
e^{i\phi}, e^{i\phi}, e^{k\phi}
$$

For example, taking any arbitrary unit quaternion (*vector*) **u** [@introquaternions]

$$
u = u_1i + u_2j + u_3k = e^{u\phi}
$$

We can rotate another arbitrary vector **v** about the axis in the **u** direction [@introquaternions]

$$
e^{u\phi}ve^{-u\phi}
$$

We can also rotate in the inverse direction as follows 

$$
e^{-u\phi}ve^{u\phi}
$$

Such multiplication of unit quaternions is useful for particular 3D rotations about an axis.
Specifically, the unit quaternion $e^{i\phi}$ corresponds to a rotations about the origin on the complex plane of angle $\phi$ [@niskanen2013].

We can rewrite the previous rotations with the unit quaternion $q$

$$
qvq^{-1}
$$

$$
q^{-1}vq
$$

The computation of quaternions can be simplified, knowing that

$$
q^{-1} = \left( w + x \hat{i} + y \hat{j} + z \hat{k} \right)^{-1} = w - x \hat{i} - y \hat{j} - z \hat{k}
$$

With the following transformation, $q$ can be be converted to a rotation matrix $R$

\begin{equation}
R = 
\left[
\begin{matrix}
1-2v_y^2            & 2 v_x v_y - 2 w v_z       & 2 v_x v_z + 2 w v_y \\
2 v_x v_y + 2 w_v z & 1 - 2 v_x^2 - 2 v^2_z & 2 v_y v_z - 2 w v_x \\
2 v_x v_z - 2 w v_y & 2 v_y V_z + 2 w v_x   & 1 - 2 v_x^2 - 2 v^2_y \\
\end{matrix}
\right]
\end{equation}

[@BoxBishopHunt11]

Where:

\begin{equation}
w = \cos \left( \dfrac{\phi}{2} \right)
\end{equation}

\begin{equation}
v_x = \sin \left( \dfrac{\phi}{2} \right)a_x
\end{equation}

\begin{equation}
v_y = \sin \left( \dfrac{\phi}{2} \right)a_y
\end{equation}

\begin{equation}
v_z = \sin \left( \dfrac{\phi}{2} \right)a_z
\end{equation}

[@BoxBishopHunt11]

This can be used to determine the unit vectors for the pitch ($X$), yaw ($Y$), and roll ($Z$) axes in the current orientation before rotation

\begin{equation}
X = R X^T_0
\end{equation}

\begin{equation}
Y = R Y^T_0
\end{equation}

\begin{equation}
Z = R Z^T_0
\end{equation}

[@BoxBishopHunt11]

Where:

\begin{equation}
X = 
\left[
1,0,0
\right]
\end{equation}

\begin{equation}
Y = 
\left[
0,1,0
\right]
\end{equation}

\begin{equation}
Z = 
\left[
0,0,1
\right]
\end{equation}

[@BoxBishopHunt11]

An inertia tensor is defined as follows:

\begin{equation}
I =
\left[
\begin{matrix}
I_{xx}    & 0      & 0 \\
0      & I_{yy} & 0 \\
0      & 0      & I_{zz} \\
\end{matrix}
\right]
\end{equation}

[@BoxBishopHunt11]

TODO:

1. calculate earth-relative linear velocity vector
2. angular velocity vector
3. calculate quaternion derivative

Et Voila!

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

[@niskanen2013]

### Pitch Damping Moment

- significant only near apogee

[@niskanen2013]
