# Angular Flight Stability (Pitch, Yaw) Analysis

## Overview

The rocket will tend to fly at an *Angle of Attack* into the atmosphere, wherein the velocity vector taken from the *Center of Gravity* is not parallel with the longitudinal axis.
This will cause non-linear changes to the magnitude of the aerodynamic forces, which, as a further simplification, can be said to be acting about the *Center of Pressure*.
In order for the aerodynamic forces to straighten the rocket in it's forward motion, and to stabilize the oscillatory rotation about the COG, the COP must be located behind the COG.

> "One of the first principles any rocket designer must learn is that a rocket will fly only if the center of gravity is ahead of the center of pressure far enough to allow the air currents to cause a stabilizing effect."

http://www.nar.org/NARTS/TR13.html

## Out-of-scope

- range (drift)
- roll

## Requirement

- 2a - The static stability margin falls above 2 (but less than 3) calibers at launch
- 2b - The dynamic stability is greater than 0 even in winds up to 8.33 m/s
- 2f - The vehicle does not experience resonant pitching/yawing motion in flight

## Rocket Flight Differential Equation

The following describes rocket flight as a *homogeneous, non-linear, differential equation* [@mandell1973, pg.83].

\begin{equation}
\label{eq_rocket_diff}
I_L \dfrac{d^2 \alpha_x}{dt^2} + F (\alpha_x) + G \left( \dfrac{d \alpha_x}{dt} \right) = 0
\end{equation}

Equation \ref{eq_rocket_diff} has no assured solutions, and as a result of being non-linear, must be solved by *linearization approximation* over piece-wise and limited regions [@mandell1973, pg.84].

## Equation of Motion

The rotational forces acting at the COP due to aerodynamic effects can be categorized as the *Normal Force* and the *Lift Force*.
These forces will be discussed more later. 

The moment arm about the COG is the distance of the COP from the tip of the nose cone, minus the distance of the COG from the tip of the nose cone.
Then, the sum of forces at the COP is the *Normal Force* ($F_N$) minus the *Lift Force* ($F_L$), and the sum of the Moments about the COG is expressed as follows.

\begin{equation}
\label{eq_angular_flight_eom}
\sum M_{COG} = (d_{COP} - d_{COG}) (F_N  - F_L)
\end{equation}

The *Moment* of a rigid body about its COG can be expressed as the product of the *Moment of Inertia* of the rigid body and the *Angular acceleration* of the body. 

\begin{equation}
\label{eq_moment}
M = I \lambda 
\end{equation}

Equation \ref{eq_angular_flight_eom} can be subbed into Equation \ref{eq_moment} to give the equation of angular motion of the rocket.

\begin{equation}
\label{eq_moment_eom}
I \lambda = (d_{COP} - d_{COG}) (F_N  - F_L)
\end{equation}

$\lambda$ is the angular acceleration of the rigid body, which is the second time derivative of the angular displacement. $\omega$ is the angular velocity, which is the first time derivative of the angular displacement.

$$ 
\lambda = \ddot{\theta}
$$
$$
\omega = \dot{\theta}
$$

Equation \ref{eq_moment_eom} can be divided by the *Moment of Inertia*, then integrated twice with respect to time to acquire $\omega$ and $\theta$.

$$
\omega = \int \lambda dt = \int \dfrac{1}{I} (d_{COP} - d_{COG}) (F_N  - F_L) dt
$$

The integration of Force with respect to time is *Impulse* $J$ [@source].

$$
\omega = \dfrac{1}{I} (d_{COP} - d_{COG}) (F_N  - F_L) t
$$

\begin{equation}
\label{eq_angular_velocity}
\omega = \dfrac{1}{I} (d_{COP} - d_{COG}) J_{N-L} 
\end{equation}

$$
\theta = \iint \alpha dt = \iint \dfrac{1}{I}(d_{COP} - d_{COG}) (F_N  - F_L) dt dt
$$

\begin{equation}
\label{eq_angular_position}
\omega = \dfrac{1}{I} (d_{COP} - d_{COG}) J_{N-L} t
\end{equation}

[angular_model_simplified]: images/angular_model_simplified.png "Angular Model - Simplified" 
![Angular Flight Model - Simplified \label{angular_model_simplified}][angular_model_simplified] 

## Barrowman Method

The *Barrowman Method* allows a simplified analysis of rocket flight to avoid the complications of linear approximations of Equation \ref{eq_rocket_diff}.

### Assumptions

- small angle of attack (less than 10$^\circ$)
- incompressible flow
- neglect viscous forces
- neglect compressibility effects [@box2009, pg.7]
- neglect lift force on the body tube [@box2009, pg.7]

[@box2009, pg. 9]

### Rocket Normal Force

\begin{equation}
\label{rocket_normal_force}
F_{N} = \dfrac{1}{2} \rho \vec{v}^2 A_{c} C_N
\end{equation}
[@box2009, pg. 9]

Where $A_c$ is the cross-sectional area of the body tube, and $C_N$ is the *Normal Force Coefficient*, and is a function of angle-of-attack ($\alpha$). 
The small angle approximation is applied, wherein small angles can be approximated as a linear function of the angle.

\begin{equation}
\label{normal_force_coefficient}
C_N = C_{N \alpha} \cdot \alpha
\end{equation}
[@box2009, pg. 9]

Where $C_{N \alpha}$ is the *Stability Derivative*, the slope of the *Normal Force Coefficient*.
The total *Stability Derivative* is the sum of all rocket component stability derivatives

\begin{equation}
\label{total_stability_derivative}
C_{N \alpha} = \sum C_{N \alpha (P)}   
\end{equation}

[@box2009, pg. 9]

### Rocket Normal Moment

The *Rocket Normal Force* (Equation \ref{rocket_normal_force}) applied at the *Center of Pressure* creates a moment about the *Center of Gravity*, known herein as the *Rocket Normal Moment*.

\begin{equation}
\label{rocket_normal_moment}
M_{N} = \dfrac{1}{2} \rho \vec{v}^2 A_{c} C_N \left( COP - COG \right)
\end{equation}

### Corrections

#### Compressibility Correction

*Barrowman's Method* neglects compressibility effects, however these effects cannot be neglected above Mach 0.3.

#### Rocket Body Lift Correction

*Barrowman's Method* neglects the lift generated by the rocket body. Galejs [@galejs] suggests the following adjustment to provide a compensated *Coefficient of Normal Force due to Body Lift*

\begin{equation}
\label{coefficient_normal_force_body_lift}
C_{N(L)} = K \dfrac{A_p}{A_{ref}} \alpha^2
\end{equation}

Where $A_p$ is the *planform area* of the rocket (the projected length-wise area of the rocket, neglecting the fins)


## Longitudinal Static Stability Margin

The *Longitudinal Static Stability Margin* ($S_{lm}$) is the distance between the *Center of Gravity* and the *Center of Pressure* divided by the outer diameter of the body tube when the rocket is positioned at an angle-of-attack ($\alpha$) of zero [@source].

$$ S_{lm} = \dfrac{COP - COG}{OD} $$

When traveling under a non-zero angle of attack, the component with respect to the velocity vector is taken.

\begin{equation}
\label{eq_static_stability_margin}
S_{lm} = \dfrac{COP - COG}{OD} \cdot \cos(\alpha)
\end{equation}

The result is dimensionless, however the ratio determined is measured in the number of *calibers*. 

\begin{quote}
2a - The static stability margin falls above 2 (but less than 3) calibers at launch
\end{quote}

[Static Stability Margin](https://www.apogeerockets.com/education/downloads/Newsletter133.pdf)

## Dynamic Stability

The rocket must exhibit dynamic stability, wherein oscillations are reduced by the damping moment.

### Resonant Pitch/Yaw Moment

- 2f - The vehicle does not experience resonant pitching/yawing motion in flight

The rocket should experience a resonant motion in response to aerodynamic forces such that it doesn't sustain at the natural frequencies that can cause structural or component damage. 
This value must be verified regularly with the design team to ensure compliance.

### Corrective Moment Coefficient

The *Corrective Moment Coefficient* describes the reaction of the rocket due to a disturbance about its longitudinal axis.

\begin{equation}
\label{eq_coef_moment_corrective}
C_{MC} = \dfrac{1}{2} \rho \vec{v}^2 A_{ref} C_{FN} (COP-COG)
\end{equation}

Where:

- $\rho$ is the local density of air
- $\vec{v}$ is the velocity of the rocket
- $A_{ref}$ is the reference area of the rocket flying into the free stream
- $C_{NF}$ is the *Normal Force Coefficient* 
- $(COP-COG)$ is the distance between the *Center of Pressure* and *Center of Gravity*

Note: a rocket with a high *Corrective Moment Coefficient* is going to weathercock faster at lower velocities.

[Corrective Moment Coefficient](https://www.apogeerockets.com/education/downloads/Newsletter193.pdf)

### Damping Moment Coefficient

As the rocket responds to a disturbance, the *Corrective Moment* reactions forces act in an oscillating manner - weathercocking into the wind, then turning back towards the vertical direction.
In order to reach dynamic stability, this oscillation must decay and settle to a reasonable response.
The *Damping Moment Coefficient* determines how fast the response settles towards zero.

There are two *Damping Moment Coefficients* to consider, the *Aerodynamic Damping Moment Coefficient* and the *Propulsive Damping Moment Coefficient*.

Then the *Damping Moment Coefficient* is the sum of the two moment components coefficients.

\begin{equation}
\label{eq_coef_moment_damping}
C_{DM} = C_{ADM} + C_{PDM}
\end{equation}

#### Aerodynamic Damping Moment Coefficient

Each rocket component contributes to the *Aerodynamic Damping Moment Coefficient*

\begin{equation}
\label{eq_coef_moment_damping_aero}
C_{ADM} = \dfrac{1}{2} \rho \vec{v}^2 A_{ref} \sum \left( C_{FN,x} \cdot \left[ COP_{x} - COG \right]^2  \right) 
\end{equation}

NOTE: SHOULD $\vec{v}$ BE SQUARED?

Where:

- $\rho$ is the local density of air
- $\vec{v}$ is the velocity of the rocket
- $A_{ref}$ is the reference area of the rocket flying into the free stream
- $C_{NF,x}$ is the *Normal Force Coefficient* 
- $COP_{x}$ is the distance of *Center of Pressure* of the rocket component to the nose cone tip
- $COG$ is the distance between the rocket *Center of Gravity* to the nose cone tip

#### Propulsive Damping Moment ~~Coefficient~~

Also known as *Jet Damping*, as propulsion creates forward momentum, it resists rotation of the rocket.

\begin{equation}
\label{eq_coef_moment_damping_jet}
C_{PDM} = \dot{m} \left( d_{tip,nozzle} - COG \right) ^2
\end{equation}

##### Dimensional Analysis

$$
\dot{m} \left( d_{tip,nozzle} - COG \right) ^2 :
\left[ \dfrac{kg}{s} \cdot m^2 \right]
$$
$$
M = fd : 
\left[ \dfrac{kg \cdot m^2}{s^2} \right]
$$

Note: why is the *Jet Damping Moment* missing a 1/t?

[Damping Moment Coefficient - Source](https://www.apogeerockets.com/education/downloads/Newsletter195.pdf)

## Wind Impulse

Two commonly used Wind Models are as follows

### Kaimal Wind Model

\begin{equation}
\label{eq_kaiman_wind_model}
\dfrac{S_u (f)}{\sigma ^2 _ u} = \dfrac{4 L_{1u} / U }{(1+6f L_{1u} / U )^{5/3}}
\end{equation}

### Von Karman Wind Model

\begin{equation}
\label{eq_von_karman_wind_model}
\dfrac{S_u (f)}{\sigma ^2 _ u} = \dfrac{4 L_{2u} / U }{(1+ 70.8 (fL_{2u} / U)^2 )^{5/3}}
\end{equation}

Where 

- $\dfrac{S_u (f)}{\sigma ^2 _ u}$ is the *Spectral Density Function* of turbulence velocity
- $f$ is the turbulence frequency
- $\sigma_u$ is the standard deviation fo the turbulence velocity
- $L_{1u}$ and $L_{2u}$ are length parameters
- *U* is the average wind speed

[@niskanen2013, pg. 59]

