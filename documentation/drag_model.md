# Drag Model

Rockets in flight experience multiple sources of drag. The total drag effect is the sum of all specific drag effects.

Figure \ref{rocket_drag_sources_label} depicts the types of drag forces to be expected in subsonic flight at *zero-angle of attack*.

[rocket_drag_sources]: images/drag_sources_niskanen2013.png "Rocket Drag Sources - Subsonic Flight" 
![Rocket Drag Sources - Subsonic Flight \label{rocket_drag_sources_label}][rocket_drag_sources] 

[@niskanen2013, pg.42]

The two main contributing factors to *Drag Force* are *Skin Friction* and pressure distribution effects. 
Pressure distribution effect are broken down into body pressure and parasitic drag effects, among others [@niskanen2013]. 
These and other drag forces are detailed in this section.

The drag model must take the parametric design parameters and applicable dynamics parameters (see *Data Model*) to output the Drag Force and combined drag coefficient.

## Mach Number

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

We assume that the *Ideal Gas Law* applies, and use it to solve for *RT* using pressure and density. 
$$ RT = \dfrac{P}{\rho} $$

Thus we can calculate the speed of sound as follows
\begin{equation}
\label{speed_of_sound}
c = \sqrt{\gamma \dfrac{P}{\rho} } 
\end{equation}

Where $p$ is the local pressure, $\rho$ is the local density, and $\gamma$ is the *adiabatic index*, known as the *isentropic explansion factor* - it is the ratio of the specific heats of a gas at constant pressure and constant volume.

[@munson2013]

The *Mach Number* is then the ratio of the air velocity to the sound speed of the local air

\begin{equation}
M = \dfrac{ \vec{v} } { c }
\end{equation}

### Mach Regions

*Velocity regions* are defined, in which aerodynamic effects are known to vary considerably.
The following velocity regions are established for further discussion.

| Mach Region (*M*) | Classification |
| ---               | ---            |
| 0.3 < 0.8         | Subsonic       |
| 0.8 < M < 1       | Transonic      |
| 1 < M < ~5        | Supersonic     |
| M > ~5            | Hypersonic     |

\captionof{table}{Mach Regions}

[@niskanen2013, pg.19]

As the rocket is constrained not to exceed Mach 0.9, much of the flight will be in the subsonic region, greatly simplifying much of the analysis. 
However, transonic effects cannot be ignored when at a Mach Number greater than 0.8.

\clearpage

## Incompressible Flow

For Mach < 0.3, 

> In the incompressible flow regime the forces can be divided into pressure
force and viscous force

*Pressure Force* is due to fluid stagnation on areas of the rocket, as well as due to the low pressure region created beyond the rocket at is passes quickly through the air. 

*Viscous Force* is due to boundary layer effects and interactions of moving air with surfaces. These forces are highly dependent on Reynolds number.
[@box2009, pg.6]


## Compressible Flow Correction

Special considerations apply when compressibility effects are in play. These effects occur above Mach 0.3 [@box2009], which will be easily exceeded by the transonic upper limit of Mach 0.9 mandated by the competition.

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
| $$ M > 1.1 $$       | $$ C^`_i = \dfrac{C_i}{\sqrt{M^2-1}} $$     |

\captionof{table}{Prandtl-Glauert Compressible Flow Correction Factors}

Where $C_i$ is the incompressible drag coefficient and $C^`_i$ is the compressibility corrected drag coefficient [@box2009, pg.15].

## Turbulent Effects

> A turbulent boundary layer induces a notably larger skin friction drag than a laminar boundary layer

[@niskanen2013, pg.42]

## Stagnation Pressure

*Stagnation Pressure* is the pressure on the normal surfaces to airflow. 

For a cylindrical rocket, it can be approximated as follows [@niskanen2013, pg.108] 

\begin{equation}
\label{eq_stagnation_pressure_blunt_cylinder}
\dfrac{q_{stag}}{q} =  
\begin{cases}
    1 + \dfrac{M^2}{4} + \dfrac{M^4}{40}                                    & M < 1 \\
    1.84 - \dfrac{0.76}{M^2} + \dfrac{0.166}{M^4} + \dfrac{0.035}{M^6}      & M > 1
\end{cases}
\end{equation}

Where $q_{stag}$ is 
and $q$ is 

Then, the *Pressure Drag Coefficient* can be expressed as a function of *Mach Number*

\begin{equation}
\label{eq_pressure_drag_coefficient}
C_{pr} = 0.85 \dfrac{q_{stag}}{q}
\end{equation}

## Reynolds Number

The *Reynolds Number* is a dimensionless number which describes the ratio of the kinematic effects of a fluid to viscous effects.

\begin{equation}
\label{eq_reynolds_number_theory}
Re = \dfrac{\rho \vec{v} d}{\mu}
\end{equation}

[@munson2013, pg.324]

### Critical Reynolds Number

The *Critical Reynolds Number* ($Re_{crit}$) is the value of *Reynolds Number* where the flow changes from laminar to turbulent. 
This is greatly dependent on the surface roughness [munson2013]. 

[@niskanen2013, pg.42] gives the *Critical Reynolds Number* as 
\begin{equation}
\label{eq_reynolds_number_critical}
R_{crit} = \dfrac{\vec{v} x} {\nu}
\end{equation}

Where:

- $\vec{v}$ is the free stream air velocty
- $x$ is the distance along the body from the nose cone tip where turbulent flow begins
- $\nu$ is the kinematic viscosity of air

For $Re_{crit} = 5 \times 10^5$

- $\nu = 1.5 \times 10^-5 m^2/s$
- $v_0 = 100 m/s$
- $x = 7 cm$ from the nose tip, where turbulent flow begins

[@niskanen2013, pg.42]

[Trinh, Khanh Tuoc](http://arxiv.org/ftp/arxiv/papers/1007/1007.0810.pdf)
[See Fluids Text book](fluids textbook)

Surface roughness has a considerable influence on *Critical Reynolds Number*. 
It can be determined as follows.

\begin{equation}
\label{eq_reynolds_number_critical_roughness}
R_{crit} = 51 \left( \dfrac{R_s}{L} \right)^{-1.039}
\end{equation}

[@niskanen2013, pg.44]

### Actual Reynolds Number
The *Actual Reynolds Number* can be expressed in the following form: 

\begin{equation}
Re = \dfrac{\vec{v} L}{\nu} 
\end{equation}

Where:

- $\vec{v}$ is the free stream velocity
- $L$ is the length of the rocket
- $\nu$ is the kinematic viscosity of the air in free stream

## Drag Force and Coefficients

The total drag force is a function of air velocity (relative to the rocket body) drag coefficient, reference area, and air density.

\begin{equation} 
D_f = D_f (\vec{v}, C_d, A_{ref}, \rho) 
\end{equation}

The drag coefficient $C_d$ is the sum of all component drag coefficients

\begin{equation} 
C_d = \sum C_i = C_{pa} + C_{fo} + C_{pr} + C_{in} + C_{ba} + C_{sk} + C_{fp} + C_{wa} + C_{bt} + C_{aoa}
\end{equation}
 
From Fluid Mechanics [source?]

\begin{equation}
D_f = \dfrac{1}{2} C_d A_{ref} \rho \vec{v}^2  
\end{equation}

### Viscous Drag Effects

#### Skin Friction Drag

Skin Friction Drag is due to viscous effects during flight, and is significantly influenced by surface roughness.

\begin{equation}
\label{friction_drag_force}
D_{sk} = \dfrac{1}{2} \rho \vec{v}^2 A_{wet} C_{sk}
\end{equation}

[@munson2013, pg.513]

Where 
\begin{equation}
\label{friction_drag_coefficient}
C_{sk}, (A_{wet}, M, \dfrac{\epsilon}{l} )
\end{equation}

$\dfrac{\epsilon}{l}$ is the relative roughness of the surface 

With the critical and actual Reynolds Numbers determined, the *Uncorrected Skin Friction Drag Coefficient* can now be conditionally determined

\begin{equation}
\label{eq_skin_drag_coefficient_uncorrected}
C_{sk_{uncorrected}} = 
\begin{cases}
    0.0148                                    & Re < 10^4 \\
    \dfrac{1}{(1.5 \ln Re - 5.6)^2}            & 10^4 < Re < Re_{crit} \\
    0.032 \left( \dfrac{R_a}{L} \right)^{0.2} & Re > Re_{crit}
\end{cases}
\end{equation}

[@niskanen2013]

Two other sources describe the cases for Skin Friction Drag Coefficient differently.

\begin{equation}
C_{sk_{uncorrected}} = 
\begin{cases}
    \dfrac{1.328}{\sqrt{Re}} & Re \le Re_{crit} \\
    \dfrac{0.074}{Re^{1/5}}  & 10^4 < Re < Re_{crit}
\end{cases}
\end{equation}

[@box2009] and [@mandell1973] agree on the above.

The *Skin Drag Coefficient Corrected for Compressibility* is:

Conversely, Niskanen evaluates the corrected skin drag coefficient as follows

\begin{equation}
\label{eq_skin_drag_coefficient_corrected}
C_{sk_{corrected}} = C_{sk_{uncorrected}} \times 
\begin{cases}
     ( 1- 0.1 M^2 )                          & \text{Subsonic} \\
     \left[ (1+0.15 M^2)^{0.58} \right]^{-1} & \text{Supersonic} \\
     ( 1 + 0.18 M^2 )^{-1}                   & \text{Roughness Limited}
\end{cases}
\end{equation}

Finally, the *Normalized and Corrected Skin Friction Drag Coefficient* is:

\begin{equation}
C_{sk} = \dfrac{ C_{sk,c} \left[ \left( 1+ \dfrac{1}{2 f_B} \right) \cdot A_{wb} + \left( 1 + \dfrac{2t_f}{L_{cf}}\cdot \right) A_{wf} \right] }{A_{ref}}
\end{equation}

Where $f_b$ is the *Fineness Ratio*, the ratio of the length of the rocket divided by the outer diameter. $L_{cf}$ is the aerodynamic chord length of the fins, and $t_f$ is the thickness of the fins

[@niskanen2013, pg.45]

\begin{equation}
\label{eq_reynolds_critical}
Re_{crit} = 51 \left( \dfrac{R_a}{L} \right) ^{-1.039} 
\end{equation}

### Pressure (Form/Profile) Drag

This is the drag caused by the pressure exerted on the surface of an object as it moves through a free stream [@munson2013, pg.514].

\begin{equation} 
C_{pr}, D_{pr} (A_{ref}, M) 
\end{equation}

#### Body Drag 

*Body Drag* is the drag on the rocket forebody (pressure drag?)

\begin{equation}
\label{body_drag_coefficient}
C_{fb} = \left[ 1 + \dfrac{60}{(l_{TR}/d_b)^3} + 0.0025 \dfrac{l_b}{d_b} \right] \left[ 2.7 \dfrac{l_n}{d_b} + 4 \dfrac{l_b}{d_b} 2 \left( 1 - \dfrac{d_d}{d_b} \right) \dfrac{l_c}{d_b} \right] \cdot C_{f(fb)}
\end{equation}

Where $l_{TR}$ is the total length of the rocket body, $l_c$ is the length of the boat tail, $d_b$ is
the maximum body diameter and $d_d$ is the diameter of the rocket base. C f(fb) is the coefficient
of viscous friction on the rocket forebody (defined later in (45))

#### Fin Pressure Drag

The *Fin Pressure Drag* depends on the fin profile. The current rocket will use a square (rectangular) profile, and can be determined as follows.

\begin{equation}
C_{fp}, D_{fp} (A_{ref}, M) 
\end{equation}

##### Leading Edge pressure drag

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

For perpendicular orientation of the fin edges to air flow, the stagnation pressure defined in Equation \ref{eq_stagnation_pressure_blunt_cylinder} is used. 

$$
\dfrac{q_{stag}}{q} =  
\begin{cases}
    1 + \dfrac{M^2}{4} + \dfrac{M^4}{40}                                    & M < 1 \\
    1.84 - \dfrac{0.76}{M^2} + \dfrac{0.166}{M^4} + \dfrac{0.035}{M^6}      & M > 1
\end{cases}
$$
[@niskanen2013, pg. 108]

#### Von Karman Nose Pressure Drag

Most nose cone shapes can be approximated to produce zero pressure drag at subsonic velocities, however complications arise for transonic and supersonic velocities.
The cause of this drag is slight flow separation, and as such cannot be corrected due to compressibility effects.
A semi-empirical method can be employed, and is explored by [@niskanen2013].

#### Base Drag

Base drag is caused by a low pressure region generated behind the base of the rocket as it moves quickly through the atmosphere [@niskanen2013, pg.50].
Specifically, it is due to boundary separation between the flow past the rocket and the surrounding air [@box2009, pg.12]. 
The flowing air attempts to make a sharp turn around the sudden geometry change at the base end of the rocket, however, viscous effects resist this change in direction.
As a result, pressure cannot be equalized in the space directly behind the rocket and a low-pressure (vacuum) region forms [@gregorek, pg.13].
This low-pressure region has an effect analogous to *pulling* the rocket against its direction of flight.

\begin{equation}
C_{ba}, D_{ba} ((A_{ref}, M)) 
\end{equation}

\begin{equation}
\label{eq_base_drag_coefficient}
C_{ba} = 
\begin{cases}
0.12+0.13 M^2   & M < 1 \\
\dfrac{0.25}{M} & M > 1
\end{cases}
\end{equation}

[@niskanen2013, pg.50]

In reality, this low pressure region is disturbed by the thrust envelope from the motor. 
Thus, we would expect base drag to be different during the motor burn time than during the free flight after all fuel was exhausted.
Considering the thrust envelope is at this moment beyond the scope of the project.
Instead, an accepted approximation is to subtract the area of the motor from the area of the base when calculating drag force [@niskanen2013, pg.50].

\begin{equation}
\label{eq_base_drag_force}
D_{ba} = \dfrac{1}{2} C_{ba} \rho (A_{tube,base} - A_{motor,base}) \vec{v}^2 
\end{equation}

We can normalize the base drag coefficient to take this into account.

\begin{equation}
\label{eq_base_drag_coefficient_normalized}
C_{ba,normalized} =
C_{ba} * A_{tube,base}/A_{motor,base}
\end{equation}

#### Shoulder Pressure Drag

The drag coefficient of the shoulder interfacing the body tube is assumed to be equal to that of the body tube itself, and also assumes a smooth interface.
This is likely to be sufficient for subsonic velocites [@niskanen2013, pg.48], and for the scope of this project it is neglected entirely.

##### Parasitic Drag

Parasitic drag is the drag due to body features not explicitly designed and/or imperfections not easily approximated. 
Examples include launch guides, ventilation holes, surface roughness, and any damage during flight. 

PARASITIC DRAG IS CURRENTLY NEGLECTED IN THE MODEL

\begin{equation}
C_{pa}, D_{pa} (A_{ref}, M) 
\end{equation}

Where $C_{stag}$ is the *Stagnation Drag Coefficient* [see equation from fin pressure drag section]

We consider the most significant source of *Parasitic Drag* to be the launch lug. 
If there is no significant airflow through the launch lug, we can approximate it as a cylinder next to the rocket body. 
*Niskanen* states that a launch lug with a length at least two times its width has a drag coefficient of 0.74, with its reference area being the frontal area.
Stagnation pressure proportionally influences the drag coefficient [@niskanen2013, pg.52].

The following equation relates the launch lug diameter $\phi_{lug}$ to the launch lug tube length $l_{lug}$.

\begin{equation}
C_{pa} = \left( 1.3 - 0.3 \dfrac{l_{lug}}{\phi_{lug}} , 1 \right)_{max} \cdot C_{stagnation} 
\end{equation}

Where *L* is the rocket length, $h_n$ is the height of the nose cone, *OD* is the outer diameter of the rocket, and $C_{stagnation}$ is the stagnation coefficient [@niskanen2013, pg.52].

The reference area of the launch lug is given as follows

\begin{equation}
\label{eq_area_reference_launch_lug}
\pi \cdot (r_{ext,lug}^2 - r_{int,lug}^2) \cdot 
\left[ 1 - \left( \dfrac{l_{lug}}{\phi_{lug}} \right) \right]_{+ve} 
\end{equation}

The *Parasitic Drag Coefficient* can be normalized to the reference area of the launch lug.

\begin{equation}
\label{eq_coef_drag_parasitic_normalized}
C_{pa_{norm}} = 
C_{pa} \cdot 
\left( 
\pi \cdot (r_{ext}^2 - r_{int}^2) \cdot 
\left[ 1 - \left( \dfrac{L-h}{OD} \right)  \right]_{+ve} 
\right) 
\end{equation}

[@niskanen2013, pg.52]

[img_coef_drag_parasitic]: images/drag/coef_drag_parasitic.png "" 
![Matlab Implementation of Parasitic Drag Coefficient\label{img_coef_drag_parasitic_label}][img_coef_drag_parasitic] 

#### Interference Drag

*Interference Drag* is caused due to effects of air flow at the interfaces of the fins and the body.

\begin{equation} 
C_{in}, D_{in} (A_{ref}, M) 
\end{equation}

\begin{equation}
\label{eq_interference_drag_coefficient}
C_{in} = 2 C_{sk,fins} \left( 1 + 2 \dfrac{T_f}{l_m} \right) \dfrac{4n(A_{f_p}-A_{f_e})} {\pi d^2_f}
\end{equation}

Where:

- $C_{sk,fins}$ is the coefficient of skin friction (due to viscous effects) on the fins
- $n$ is the number of fins
- $A_{f_p}$ is the fin planform area 
\begin{equation}
\label{eq_fin_planform_area}
A_{f_p} = A_{f_e} + \dfrac{1}{2} d_f l_r
\end{equation}
- $A_{f_e}$ is the exposed planform area of the fin
\begin{equation}
\label{eq_exposed_fin_planform_area}
A_{f_e} = \dfrac{1}{2} (l_r + l_t) l_s 
\end{equation}

[@box2009, pg.12-13]

Interference Drag effects are small in comparison to other drag effects [@niskanen2013], and are thus ignored at this stage of the project.

### Wave Drag

*Wave drag* is drag associated with shock waves (independent of viscous effects). 

> At transonic speed, shock waves form at the nose tip and at the leading edge of the fins ... Momentum is transferred from the rocket to the surrounding air via these shockwaves  

### Boat-Tail Drag

A *boat-tail* is a reduction in diameter of the body tube towards the base of the rocket. 
Our rocket does not have a boat-tail, thus *Boat-Tail Drag* considerations are ignored. 

\clearpage 

## Additional Drag at Angle of Attack

When the rocket flies at a non-zero angle of attack, additional drag considerations must be made.
The reference area the rocket becomes larger as the rocket is pitched into the free stream, exposing more of the rocket body to pressure and stagnation effects.

In Figure \ref{rocket_drag_aoa_label}, velocity $\vec{v}$ is the apparent velocity of the center of pressure relative to the surrounding air. 

[rocket_drag_aoa]: images/rocket_drag_forces.png "Rocket Drag Forces - Axial vs. Normal" 
![Rocket Drag Forces - Axial vs. Normal Caption \label{rocket_drag_aoa_label}][rocket_drag_aoa] 

[@box2009, pg.6]

In the following analysis, additional rocket drag coefficients are determined to be added to the *zero angle of attack* drag coefficient. 
This analysis is derived with the aid of additional coefficients determined experimentally in wind tunnel tests on rocket models
[@box2009, pg.13] [@mandell1973].

\begin{equation}
\label{eq_rocket_drag_aoa}
C_{aoa} = C_{Db(\alpha)} + C_{Df(\alpha)}
\end{equation}

### Rocket Body Drag at Angle of Attack

\begin{equation}
\label{eq_rocket_body_drag_aoa}
C_{Db(\alpha)} = 2 \delta \alpha^2 + \dfrac{3.6 \eta (1.36 L - 0.55 h_n ) }{ \pi \cdot OD } \alpha^3
\end{equation}

Where:

- $\alpha$ is the angle of attack
- $L$ is the total rocket length
- $OD$ is the outer diameter of the rocket 
- $h_n$ is the height of the nose cone
- $\delta$ and $\nu$ are experimentally determined coefficients
- $OD$ is the outer diameter of the rocket

[@box2009, pg.14]

#### Rocket Fin Drag at Angle of Attack

\begin{equation}
\label{eq_rocket_fin_drag_aoa}
C_{Df(\alpha)} = \alpha^2 \left[ 1.2 \dfrac{A_{fp}4}{\pi OD^2_f} + 3.12 (k_{fb} + k_{bf} - 1) \left( \dfrac{A_{fe} 4}{\pi OD^2_f} \right) \right]
\end{equation}

Where: 

- $k_{fb}$ is the fin-body coefficient
\begin{equation}
\label{eq_fin_body_coef_aoa}
k_{fb} = 0.8065 R^2_s + 1.1553 R_s
\end{equation}

- $k_{bf}$ is the body-fin coefficient
\begin{equation}
\label{eq_body_fin_coef_aoa}
k_{bf} = 0.1935 R^2_s + 0.8174 R_s + 1
\end{equation}

- $R_s$ is the fin section ratio
\begin{equation}
\label{eq_fin_section_ratio}
R_s = \dfrac{l_{TS}}{d_f}
\end{equation}

- $l_{TS}$ is the total span of the fins
- $OD_f$ is the diameter of the body tube at the base of the fin mount

[@box2009, pg.14]

### Alternatively

[@mandell1973] shares a function determined for *Total drag coefficient due to angle-of-attack*

\begin{equation}
\label{eq_darg_total_aoa}
C_d (\alpha) = 16.83 \alpha^2 + 8.9 \alpha^3
\end{equation}

## Matlab Implementation

Figure \ref{rocket_drag_model_label} shows the *Simulink* implementation of the calculation of the drag model

[rocket_drag_model]: images/rocket_drag_model.png "Rocket Drag Model" 
![Rocket Drag Model\label{rocket_drag_model_label}][rocket_drag_model] 

\clearpage

Figure \ref{rocket_drag_coefficients_label} shows the *Simulink* implementation of the calculation of drag coefficient

[rocket_coef_drag_model]: images/rocket_drag_coefficient.png "Rocket Drag Model" 
![Rocket Drag Coefficient Model \label{rocket_drag_coefficients_label}][rocket_coef_drag_model] 

\clearpage

### Matlab Validation

The following plots show the Drag Model compared against OpenRocket, RASAero, and Rocksim. 
The differences between the commercial simulations are likely due to differing drag analysis methods which are not available due to their closed source nature.
However, it can be seen that Matlab and OpenRocket are very close, which validates the Matlab model since it was closely following the methods performed in OpenRocket

[error_dragforce_plot]: images/plots/error_dragforce_plot.png "" 
![Drag Force as a Function of Mach Number \label{error_dragforce_v_plot_label}][error_dragforce_plot] 

\clearpage

