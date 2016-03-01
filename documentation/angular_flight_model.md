# Angular Flight Stability (Pitch, Yaw) Analysis

## Overview

Due to disturbances such as wind, and imperfections and imbalances in the construction, the rocket will tend to fly at an *Angle of Attack* into the free stream, wherein the velocity vector (taken from the *Center of Gravity*) is not parallel with the longitudinal axis.
This will cause non-linear changes to the magnitude of the aerodynamic forces, which, as a further simplification, can be said to be acting about the *Center of Pressure*.
In order for the aerodynamic forces to straighten the rocket in its forward motion, and to stabilize the oscillatory rotation about the COG, the COP must be located behind the COG.

> "One of the first principles any rocket designer must learn is that a rocket will fly only if the center of gravity is ahead of the center of pressure far enough to allow the air currents to cause a stabilizing effect."

http://www.nar.org/NARTS/TR13.html

### Dynamic Stability Analysis 

The rocket must exhibit dynamic stability, wherein oscillations are reduced by the damping moment.

The rocket should experience a resonant motion in response to aerodynamic forces such that it doesn't sustain at the natural frequencies that can cause structural or component damage. 
This value must be verified regularly with the design team to ensure compliance.

#### Characteristic Equations

\begin{equation}
\label{eq_characteristic_equation}
C_1 \ddot{\alpha} + C_2 \dot{\alpha} + C_3 \alpha = 0
\end{equation}

##### Vibrations 

\begin{equation}
\label{eq_characteristic_equation_vibes}
m \ddot{x} + c \dot{x} + kx = 0
\end{equation}

##### Controls

\begin{equation}
\label{eq_characteristic_equation_controls}
s^2 + 2 \zeta \omega_n s + \omega^2_n = 0
\end{equation}

- $\zeta$ is the damping coefficient, and is tied to the frequency of the system

### Harmonic Response

#### Particular Response

#### Homogeneous Response

#### Undamped Response

#### Complete Response

### Coordinate System, Equations of Motion

The moment arm about the COG is the distance of the COP from the tip of the nose cone, minus the distance of the COG from the tip of the nose cone.
Then, the sum of forces at the COP is the *Restoring Force* ($F_R$) minus the *Damping Force* ($F_D$), and the sum of the Moments about the COG is expressed as follows.

The *Moment* of a rigid body about its COG can be expressed as the product of the *Moment of Inertia* of the rigid body and the *Angular acceleration* of the body. 

\begin{equation}
\label{eq_moment}
M = I \lambda 
\end{equation}

- $\lambda$ is the *angular acceleration* of the rigid body, which is the second time derivative of the angular displacement 

$$ 
\lambda = \ddot{\alpha}
$$
$$
\omega = \dot{\alpha}
$$

- $\omega$ is the *angular velocity*, which is the first time derivative of the angular displacement
- $\alpha$ is the *angle of attack*


## Longitudinal Static Stability Margin

The *Longitudinal Static Stability Margin* ($S_{lm}$) is the distance between the *Center of Gravity* and the *Center of Pressure* divided by the outer diameter of the body tube when the rocket is positioned at an angle-of-attack ($\alpha$) of zero [@source].

$$ S_{lm} = \dfrac{COP - COG}{OD} $$

When traveling under a non-zero angle of attack, the Stability Margin is adjusted using the body lift correction factor Equation \ref{eq_coefficient_normal_force_body_lift}.

The result is dimensionless, however the ratio determined is measured in the number of *calibers*. 

\begin{quote}
2a - The static stability margin falls above 2 (but less than 3) calibers at launch
\end{quote}

[Static Stability Margin](https://www.apogeerockets.com/education/downloads/Newsletter133.pdf)

## Out-of-scope

- range (drift)
- roll

## Requirement

- 2a - The static stability margin falls above 2 (but less than 3) calibers at launch
- 2b - The dynamic stability is greater than 0 even in winds up to 8.33 m/s
- 2f - The vehicle does not experience resonant pitching/yawing motion in flight

### Assumptions

- small angle of attack (less than 10$^\circ$)
- incompressible flow
- neglect viscous forces
- neglect compressibility effects [@box2009, pg.7]
- neglect lift force on the body tube [@box2009, pg.7]
- neglect the effect of roll due to having 3 fins vs 4

## Derivation of the Harmonic Motion Equation

Suppose a high-powered rocket is launched in quiescent air vertically, and flies straight without wobbling.
Then, suppose a small and momentary disturbance (e.g. a short gust of wind) is experienced on the side of the rocket causing an angular deflection, .
If the rocket is *stable*, a restoring force causes a *corrective moment* which will act in the opposite direction of the deflection. 
This *corrective moment* can be considered a function of angular displacement [@mandell1973, pg.81].

\begin{equation}
M_{corrective} = F (\alpha)
\end{equation}

As the rocket gains velocity in the direction opposite the disturbance, a *damping moment* is generated as a result of the relative speed of the air, in the direction orthogonal to the longitudinal axis.
As this *damping moment* opposes the angular velocity caused by the *corrective moment*, its sign is opposite to the angular velocity.
The *damping moment* is also a function of angular velocity [@mandell1973, pg.81-82].

\begin{equation}
M_{damping} = G (\omega)
\end{equation}

Then, taking a sum of Moments, the rotation of the rocket can be described as follows [@mandell1973, pg.83]

$$
I \lambda = -F(\alpha) - G(\omega) 
$$
$$
I \left( \dfrac{d^2\alpha}{dt^2} \right) = -F(\alpha) - G \left(\dfrac{d\alpha}{dt} \right) 
$$
\begin{equation}
\label{eq_rocket_diff}
I \left( \dfrac{d^2\alpha}{dt^2} \right) + F(\alpha) + G \left(\dfrac{d\alpha}{dt} \right) = 0
\end{equation}

This nonlinear, homogenous, differential equation can not be solved exactly [@mandell1973, pg.84].

## Linearization Approximation

Linear Approximations of \ref{eq_rocket_diff} are made considering small values of $\alpha$ and $\omega$, known as the *small-perturbation theory* [@mandell1973, pg.86].
This linearization process provides ~~constant~~ coefficients, which we will denote $C_1$ for the *Corrective Moment Coefficient* and $C_2$ for the *Damping Moment Coefficient*.

$$
F(\alpha) \approx C_1 \cdot \alpha 
$$
$$
G \left(\dfrac{d\alpha}{dt} \right) \approx C_2 \cdot \dfrac{d\alpha}{dt} 
$$

\begin{equation}
\label{eq_rocket_diff_linearized}
I \left( \dfrac{d^2\alpha}{dt^2} \right) + C_1 (\alpha) + C_2 \left(\dfrac{d\alpha}{dt} \right) = 0
\end{equation}


### Preliminary Considerations

#### Rocket Normal Force

The *Rocket Normal Force* is the resultant force applied at the *Center of Pressure* perpendicular to the longitudinal axis of the rocket, when the rocket flies at an angle-of-attack.

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

Where $C_{N \alpha}$ is the *Stability Derivative*


### Corrective Moment Coefficient

The *Corrective Moment Coefficient* describes the reaction of the rocket against a disturbance about its longitudinal axis.

\begin{equation}
\label{eq_coef_moment_corrective}
C_{MC} = \dfrac{1}{2} \rho \vec{v}^2 A_{ref} C_{N \alpha} (COP-COG)
\end{equation}

Where:

- $\rho$ is the local density of air
- $\vec{v}$ is the velocity of the rocket
- $A_{ref}$ is the reference area of the rocket flying into the free stream
- $C_{N \alpha}$ is the *Stability Derivative* ~~*Normal Force Coefficient*~~
- $(COP-COG)$ is the distance between the *Center of Pressure* and *Center of Gravity*

Note: a rocket with a high *Corrective Moment Coefficient* is going to weathercock faster at lower velocities.

[Corrective Moment Coefficient](https://www.apogeerockets.com/education/downloads/Newsletter193.pdf)

#### Dimensional Analysis

\begin{equation}
\label{eq_c1_dim_anal}
\dfrac{kg}{m^3} \left[ \dfrac{m}{s} \right]^2 m^2 m = \dfrac{kg \cdot m }{s^2} \cdot m 
\end{equation}

### Damping Moment Coefficient

As the rocket responds to a disturbance, the *Corrective Moment* reactions forces act in an oscillating manner - weathercocking into the wind, then turning back towards the vertical direction.
In order to reach dynamic stability, this oscillation must decay and settle to a reasonable response.
The *Damping Moment Coefficient* represents how fast the response settles towards zero.

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
C_{ADM} = \dfrac{1}{2} \rho \vec{v} A_{ref} \sum \left( C_{N \alpha,x} \cdot \left[ COP_{x} - COG \right]^2  \right) 
\end{equation}

NOTE: Why isn't $\vec{v}$ SQUARED?
It might have something to with the fact that the ADM is a function of angular displacement, and DM is a function of angular velocity??

Where:

- $\rho$ is the local density of air
- $\vec{v}$ is the velocity of the rocket
- $A_{ref}$ is the reference area of the rocket flying into the free stream
- ~~$C_{NF,x}$~~ $C_{N \alpha}$ is the ~~*Normal Force Coefficient*~~ *Stability Derivative*
- $COP_{x}$ is the distance of *Center of Pressure* of the rocket component to the nose cone tip
- $COG$ is the distance between the rocket *Center of Gravity* to the nose cone tip

##### Dimensional Analysis

\begin{equation}
\label{eq_c2a_dim_anal}
\dfrac{kg}{m^3} \dfrac{m}{s} m^2 m^2 = \dfrac{kg \cdot m }{s} \cdot m 
\end{equation}

#### Propulsive Damping Moment Coefficient

Also known as *Jet Damping*, as propulsion creates forward momentum, it resists rotation of the rocket.

\begin{equation}
\label{eq_coef_moment_damping_jet}
C_{PDM} = \dot{m} \left( d_{tip,nozzle} - COG \right) ^2
\end{equation}

##### Jet Damping - Dimensional Analysis

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

#### Pitch Damping Moment

The *Pitch Damping Moment* is a moment opposing the *Rocket Restoring Moment* and dampens the oscillation. 

\begin{equation}
\label{eq_moment_damping_pitch}
0.55 \dfrac{l^4 r_t}{A_{ref} d} \dfrac{\omega^2}{v^2_0}
\end{equation}

According to [@niskanen2013], the *Pitch Damping Moment* is essentially insignificant until near apogee. 
This is because it is proportional to $\dfrac{\omega^2}{v^2_0}$ (as seen in \ref{eq_moment_damping_pitch}), which will be near zero until apogee due to very small angular velocities made smaller by squaring the $\omega$ term.

The *Pitch Damping Moment* of each rocket component must be calculated individually.
For instance, the *Pitch Damping Moment* of a fin is as follows.

\begin{equation}
\label{eq_moment_damping_pitch_fin}
C_{damp} = 0.6 \dfrac{N A_{fin} d_{COP}^3}{A_{ref} d} \dfrac{\omega^2}{v^2_0}
\end{equation}

## General Homogeneous Response

The characteristic, linearized, homogeneous yaw/pitch response is given as:

\begin{equation}
I_L \dfrac{d^2 \alpha_x}{dt^2} + C_2 \dfrac{d \alpha_x}{dt} + C_1 \alpha_x = 0
\end{equation}

[@mandell1973, pg.94]

A solution over a known range of acceptable values of the coefficients above is:

\begin{equation}
\label{eq_yaw_pitch_time_response}
\alpha_x = A e^{-Dt} \sin(\omega t + \phi)
\end{equation}

Where:

- $t$ is the time passed since the "observation of the dynamic response has begun, not the time elapsed since the rocket was launched" [@mandell1973, pg.94]
- $\omega$ is the *frequency of oscillation* (not literally the angular velocity of the rocket)

\begin{equation}
\label{eq_frequency_oscillation}
\omega = \sqrt{ \dfrac{C_1}{I_L} - \dfrac{C_2^2}{4 I_L^2} }
\end{equation}

- $\phi$ is the *phase angle* in radians
\begin{equation}
\label{eq_phase}
\phi = 
\arctan { 
\left( \dfrac{ \alpha_{xo} \omega } { D\alpha_{xo} + \Omega_{xo} } \right) 
}
\end{equation}

- $D$ is the *inverse time constant*
\begin{equation}
\label{eq_inverse_time_constant}
D = { C_2 \over 2 I_L }
\end{equation}

- $A$ is the *initial amplitude*
\begin{equation}
A = \dfrac{\alpha_{xo}}{sin \phi}
\end{equation}

- $\alpha_{xo}$ is the value of $\alpha_x$ at $t=0$

[@mandell1973, pg.94]

The initial conditions for this solution are

- $a_{xo}$ = some non-zero angle-of-attack
- $\Omega_{xo}$ = 0

This equation is represented in the model as follows

[angular_model_simplified]: images/angular_model_simplified.png "Angular Model - Simplified" 
![Angular Flight Model - Simplified \label{angular_model_simplified}][angular_model_simplified] 

$$
I_L (D^2 - \omega^2) - C_2 D + C_1 = 0
$$
$$
-2 I_L D + C_2 = 0
$$

[@mandell1973, pg.95]

We can consider the rocket to be *restored* when the angle of attack stabilizes below 5% of $A$.

[@mandell1973, pg.95-96]

The *Natural Frequency* of the rocket at the current air speed for the homogeneous solution is

\begin{equation}
\label{eq_natural_frequency_homogeneous}
\omega_n = \sqrt{ \dfrac{C_1}{I_L} }
\end{equation}

Note: it would appear that this response only reflects the physical system for non-decreasing values of $C_2$, which would cause the exponential term to increase with time and cause the amplitude to grow.
Although the damping coefficient remains relatively constant, the inverse time-constant is only a function of $\dfrac{C_2}{2 I_L}$. 
As velocity decreases in the rocket coasting phase, $C_2$ drops proportional to the square of the velocity and thus the inverse-time constant decreases enough with respecting time, that $Dt$ is decreasing and thus $e^{-Dt}$ will begin to increase.

Attach image [@source]

## Complete Response to Step Input

## Complete Response to Impulse Input

## Steady State Response to Sinusoidal Forcing

### Rocket Damping Ratio

The *Rocket Damping Ratio* is calculated as follows.

\begin{equation}
\label{eq_rocket_damping_ratio}
\zeta = \dfrac{C_2}{2 \cdot \sqrt{C_1 I_L}}
\end{equation}

Where:

- $C_1$ is the *Corrective Moment Coefficient*
- $C_2$ is the *Damping Moment Coefficient*
- $I_L$ is the *Longitudinal Moment of Inertia*

[@mandell1973, pg.99]

#### Underdamped Case

\begin{equation}
0 < \dfrac{C_2^2}{4I_L^2} < \dfrac{C_1}{I_l} \
\end{equation}

The fastest response is when $\zeta = \dfrac{\sqrt{2}}{2}$

#### Overdamped Case

\begin{equation}
\dfrac{C_2^2}{4I_L^2} > \dfrac{C_1}{I_l} \
\end{equation}

#### Critically Damped Case

\begin{equation}
\dfrac{C_1}{I_l} = \dfrac{C_2^2}{4I_L^2}
\end{equation}

[@mandell1973, pg.101]

### Rocket Natural Frequency

\begin{equation}
\label{rocket_natrual_frequency}
\omega_n = \sqrt{\dfrac{C_1}{I_L}}
\end{equation}

Where:

- $C_1$ is the *Corrective Moment Coefficient*
- $I_L$ is the *Longitudinal Moment of Inertia*

[@mandell1973, pg.97]

### Time Constants of the Response

TODO

### Complete response to step input

### Complete response to impulse input

[mandell1973, pg.123]

### Corrections

#### Compressibility Correction

*Barrowman's Method* neglects compressibility effects, however these effects cannot be neglected above Mach 0.3.

## Wind Disturbance

We are interested in the damping ratio of the rocket as it stabilizes towards *zero angle of attack* in reaction to angular disturbances.

As we consider the rocket to have ideal dimensional accuracy, the main source of flight disturbance is wind.

### Impulse Disturbance

We can test the ability of the rocket to stabilize due to an initial angular disturbance, by applying an initial angle of attack. 
This simulates a small gust of wind hitting the rocket just as it takes off.

### Constant Disturbance

We can test the ability of the rocket to stabilize due to a constant disturbance force, as well as applying an initial *angle of attack*.
This simulates a constant wind force coming from a single direction.
As the density of air goes down with increases altitude, this assumes that the wind speed picks up at higher altitudes to maintain the constant wind force.

Alternatively, we could model a constant wind speed of $8.33 m/s$, and apply the ISA Model for the density as a function of altitude to determine the changing wind force as the rocket climbs.

### Future Enhancement

To account for wind turbulence in future models, two commonly used Wind Models are explored.

#### Kaimal Wind Model

\begin{equation}
\label{eq_kaiman_wind_model}
\dfrac{S_u (f)}{\sigma ^2 _ u} = \dfrac{4 L_{1u} / U }{(1+6f L_{1u} / U )^{5/3}}
\end{equation}

#### Von Karman Wind Model

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

## More Reading

There are further resources on rocket flight stability here:
- http://www.apogeerockets.com/Tech/Rocket_Stability
