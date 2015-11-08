## Drag Model

Rockets in flight experience multiple sources of drag. The total drag effect is the sum of all specific drag effects.

The drag model shall take the parametric design parameters and applicable dynamics parameters (see *Data Model*) to output the Drag Force and combined drag coefficient.

### Mach Number

*Mach Number* (M) is the ratio of the airspeed to the speed of sound for air at a given temperature

The speed of sound (c) is calculated as follows

\begin{equation}
c = \sqrt{\gamma R T } 
\end{equation}

The *Ideal Gas Law* states that 
\begin{equation}
\label{ideal_gas_law}
P = \rho R T
\end{equation}

We can simplify our lives by assuming the *Ideal Gas Law* applies, and use it to solve for *RT* 
$$ RT = \dfrac{P}{\rho} $$

Thus we can calculate the speed of sound as follows
\begin{equation}
\label{speed_of_sound}
c = \sqrt{\gamma \dfrac{P}{\rho} } 
\end{equation}

Where $p$ is the local pressure, $\rho$ is the local density, and $\gamma$ is the *adiabatic index*, known as the *isentropic explansion factor* - it is the ratio of the specific heats of a gas at constant pressure and constant volume.

[botros]

[munson2013]

The *Mach Number* is then the ratio of the air velocity to the sound speed of the local air

\begin{equation}
M = \dfrac{ \vec{v} } { c }
\end{equation}

### Compressible Flow Correction

Special considerations apply when compressibility effects are in play. These effects occur above Mach 0.3 **[source?]**, which will be easily exceeded by the transonic target velocity of Mach 0.88 **[source?]**.

> At low speeds (incompressible flow), the aerodynamic coefficients are functions of the angle of attack ($\alpha$) and Reynolds number (Re). 

\begin{equation}
C_i (M < 0.3) = C_i (\alpha, Re) 
\end{equation}
> At higher speeds (compressible, Ma $\ge$ 0.4) they are also a function of Mach number.

\begin{equation}
C_i (M \ge 0.3) = C_i (\alpha, Re, M)
\end{equation}

Particular correction factors are recommended for ranges of Mach number


| Mach Number         | Correction Factor                           |
| ---                 | ---                                         |
| $$ M < 0.3 $$       | N/A                                         |
| $$ 0.3 < M < 0.8 $$ | $$ C^`_i = \dfrac{C_i}{\sqrt{1-M^2}} $$     |
| $$ 0.8 < M < 1.1 $$ | $$ C^`_i = \dfrac{C_i}{\sqrt{1-(0.8)^2}} $$ |

\captionof{table}{Compressible Flow Correction Factors}

Where $C_i$ is the incompressible drag coefficient and $C^`_i$ is the compressibility corrected drag coefficient.

[@box2009]

### Incompressible Flow

For Mach < 0.3, 

> In the incompressible flow regime the forces can be divided into pressure
force and viscous force

*Pressure Force* is due to fluid stagnation on areas of the rocket, as well as due to the low pressure region created beyond the rocket at is passes quickly through the air. 

*Viscous Force* is due to boundary layer effects and interactions of moving air with surfaces. These forces are highly dependent on Reynolds number.
[@box2009, pg.6]

[rocket_drag_forces]: images/rocket_drag_forces.png "Rocket Drag Forces - Axial vs. Normal" 
![Rocket Drag Forces - Axial vs. Normal Caption \label{rocket_drag_forces_label}][rocket_drag_forces] 

[@box2009, pg.6]

Velocity $\vec{v}$ is the apparent velocity of the center of pressure relative to the surrounding air. 

### Turbulent Effects

Viscous forces are much less severe in turbulent conditions than laminar conditions - TODO EXPAND

[@box2009, pg.6]


### Drag Force and Coefficients

The total drag force is a function of air velocity (relative to the rocket body, therefore ideally the velocity of the rocket in quiescent air conditions), drag coefficient, reference area, and air density.

\begin{equation} 
D_f = D_f (\vec{v}, C_d, A_{ref}, \rho) 
\end{equation}

The drag coefficient $C_d$ is the sum of all component drag coefficients

\begin{equation} 
C_d = \sum C_i = C_{pa} + C_{fo} + C_{pr} + C_{in} + C_{ba} + C_{sk} + C_{fp} + C_{wa} + C_{bt} 
\end{equation}

The *reference area* is the projected area of the body flowing through air, perpendicular to the direction of flow. [source?]
 
From Fluid Mechanics [source?]

\begin{equation}
D_f = \dfrac{1}{2} C_d A_{ref} \rho \vec{v}^2  
\end{equation}

#### Parasitic Drag

Parasitic drag is the drag due to body features not explicitly designed and/or imperfections not easily approximated. 
Examples include launch guides, ventilation holes, surface roughness, and any damage during flight. 

\begin{equation}
C_{pa}, D_{pa} (A_{ref}, M) 
\end{equation}

\begin{equation}
C_{pa} = MAX \left( 1.3 - \dfrac{0.3(L-h_n)}{OD}, 1 \right) C_{stag}
\end{equation}

Where $C_{stag}$ is the *Stagnation Drag Coefficient* [see equation from fin pressure drag section]


##### Parasitic Drag Coefficient

\begin{equation}
C_{pa} = \left( 1.3 - 0.3 \dfrac{(L-h_n)}{OD} \right)_{max} \cdot C_{stagnation} 
\end{equation}

Where *L* is the rocket length, $h_n$ is the height of the nose code, *OD* is the outer diameter of the rocket, and $C_{stagnation}$ is the stagnation coefficient.

##### Parasitic Drag Coefficient - Normalized

\begin{equation}
C_{pa_{norm}} = C_{pa} \cdot \left( \pi \cdot (r_{ext}^2 - r_{int}^2) \cdot \left[ 1 - \left( \dfrac{L-h}{OD} \right), 0 \right]_{max} \right) 
\end{equation}

#### Form Drag

\begin{equation} 
C_{fo}, D_{fo} (A_{ref}, M) 
\end{equation}

#### Profile (Pressure) Drag

This is the drag caused by the pressure imbalance as an object moves through a free stream in the opposite direction to its motion.

[Pressure drag vs base drag?]

\begin{equation} 
C_{pr}, D_{pr} (A_{ref}, M) 
\end{equation}

#### Interference Drag

\begin{equation} 
C_{in}, D_{in} (A_{ref}, M) 
\end{equation}

#### Base Drag

Base drag is experienced behind the aft section of the rocket cause by boundary separation between the flow past the rocket and the surrounding air. This results in a low pressure region which has an effect analogous to *pulling* the rocket against its direction of flight.

\begin{equation}
C_{ba}, D_{ba} ((A_{ref}, M)) 
\end{equation}

#### Skin Friction Drag

Skin Friction Drag is a result of surface roughness. It is a component effect of parasitic drag.

\begin{equation}
C_{sk}, D_{sk} (A_{ref}, M)
\end{equation}

##### Critical Reynolds Number

The *Critical Reynolds Number* ($Re_{crit}$) is the value of *Reynolds Number* where the flow changes from laminar to turbulent. This is greatly dependent on the surface roughness [munson2013]. 

[Trinh, Khanh Tuoc](http://arxiv.org/ftp/arxiv/papers/1007/1007.0810.pdf)
[See Fluids Text book](fluids textbook)

The *Actual Reynolds Number* can be expressed in the following form: 

\begin{equation}
Re = \dfrac{\vec{v} L}{\mu} 
\end{equation}

However, the kinematic viscosity can be substituted as a function of the local temperature (in Kelvin)

\begin{equation}
Re = \dfrac{\vec{v} L}{A\cdot T^3 + B\cdot T^2 + C\cdot T - D} 
\end{equation}

Where A = $-1 \times 10^{14}$, B = $1 \times 10^{-10}$, C = $3 \times 10^{-8}$, and D = $3 \times 10^-6$.

With the critical and actual Reynolds Numbers determined, the *Uncorrected Skin Friction Drag Coefficient* can now be conditionally determined

\begin{equation}
C_{sk_{uncorrected}} = 
\begin{cases}
    0.0148                                & Re < 10^4 \\
    \dfrac{1}{(1.5 ln Re - 5.6)^2}        & 10^4 < Re < Re_{crit} \\
    0.032 \left( \dfrac{R_a}{L} \right)^2 & Re > Re_{crit}
\end{cases}
\end{equation}

[botros]

Two other sources describe the cases for Skin Friction Drag Coefficient as follows:
\begin{equation}
C_{sk_{uncorrected}} = 
\begin{cases}
    \dfrac{1.328}{\sqrt{Re}} & Re \le Re_{crit} \\
    \dfrac{0.074}{Re^{1/5}}  & 10^4 < Re < Re_{crit}
\end{cases}
\end{equation}

[box2009] 

[mandell1973] 

The *Skin Drag Coefficient Corrected for Compressibility* is:

\begin{equation}
C_{f_c} = C_f (1-0.1 M^2) [if C_{f_c} > C_f]
\end{equation}

Finally, the *Normalized and Corrected Skin Friction Drag Coefficient* is:

\begin{equation}
C_{sk} = \dfrac{ C_{sk,c} \left[ \left( 1+ \dfrac{1}{2 f_B} \right) \cdot A_{wb} + \left( 1 + \dfrac{2t_f}{L_{cf}}\cdot \right) A_{wf} \right] }{A_{ref}}
\end{equation}

Where $f_b$ is the *Fineness Ratio*, the ratio of the length of the rocket divided by the outer diameter. 

[botros]

\begin{equation}
Re_{crit} = 51 \left( \dfrac{R_a}{L} \right) ^{-1.039} 
\end{equation}


#### Fin Pressure Drag

\begin{equation}
C_{fp}, D_{fp} (A_{ref}, M) 
\end{equation}

The *Fin Pressure Drag* depends on the fin profile. The current rocket will use a square (rectangular) profile, and can be determined as follows.

\begin{equation}
    C_{D,LE} = C_{D,stag} = 0.85 \dfrac{q_{stag}}{q}
\end{equation}

The *Body Base Drag Coefficient* is 

\begin{equation}
C_{base} =
\begin{cases}
    0.12 + 0.13 M^2     &   M < 1 \\
    \dfrac{0.25}{M}     &   M > 1
\end{cases}
\end{equation}

For perpendicular orientation of the fin edges to air flow 

\begin{equation}
\dfrac{q_{stag}}{q} =  
\begin{cases}
    1 + \dfrac{M^2}{4} + \dfrac{M^4}{40}                                    & M < 1 \\
    1.84 - \dfrac{0.76}{M^2} + \dfrac{0.166}{M^4} + \dfrac{0.035}{M^6}      & M > 1
\end{cases}
\end{equation}

[source]

#### Wave Drag

*Wave drag* is drag associated with shock waves (independent of viscous effects). 

> At transonic speed, shock waves form at the nose tip and at the leading edge of the fins ... Momentum is transferred from the rocket to the surrounding air via these shockwaves  

#### Boat-Tail Drag

*Boat-Tail Drag* occurs due to ... 

### Matlab Implementation

[rocket_drag_model_overview]: images/rocket_drag_model_overview.png "Rocket Drag Model Overview" 
![Rocket Drag Model Overview \label{rocket_drag_model_overview_label}][rocket_drag_model_overview] 

[rocket_drag_model]: images/rocket_drag_model.png "Rocket Drag Model" 
![Rocket Drag Model \label{rocket_drag_model_label}][rocket_drag_model] 

#### Von Karman Nose Pressure Drag

> The curves of the pressure drag coefficient as a function of the nose fineness
ratio f N can be closely fitted with a function of the form

\begin{equation}
C_{d_pressure} = \dfrac{a}{(f_N + 1)^b}
\end{equation}

Where *a* and *b* are calculated from two data points corresponding to fineness ratios 0 and 3

(C D• ) pressure =
a
(f N + 1) b
. 

Subsonic pressure drag of nose cones is calculated as follows:

\begin{equation}
\begin{cases}
    0.8 \cdot \sin^2 \phi               & M \approx 0 \\
    a \cdot M^b + 0.8 \cdot \sin^2 \phi & M \approx 0.8
\end{cases}
\end{equation}
