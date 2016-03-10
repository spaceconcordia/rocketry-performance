# Rocket Orientation

Building on the material explored in the Angular Stability model, this section explains the orientation of the rocket during flight.

[img_rocket_flight_forces_moments_label]: images/rocket_flight_forces_moments.png "Forces and Moments Experienced by rocket in flight" 
![Forces and Moments Experienced by rocket in flight \label{img_rocket_flight_forces_moments_label}][dynamic_weight_calculation_test_figure] 


## Parameters needed for quaternion analysis

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


A *Pitch Moment* and *Pitch Damping Moment* are defined, which are different than the *Corrective Moment Coefficient* and the *Damping Moment Coefficient*.

Note: a complementary *Yaw Moment* and *Yaw Damping Moment* are implied, with exactly the same considerations for motion along the uncoupled complementary yaw-axis. 

## Pitch Moment

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

## Pitch Moment Coefficient

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

## Pitch Damping Moment

- significant only near apogee

