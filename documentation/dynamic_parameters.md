## Dynamic Parameters

Parameters listed as *dynamic* in the table above are provided as initial values which are then recalculated by the model throughout the simulated flight.

### Force 

*Force* is a change in momentum with time, and is related by Newton's Second Law

\begin{equation}
F = \dfrac{m \Delta \vec{v}}{\Delta t} = m\vec{a}
\end{equation}

### Impulse

*Impulse* is the product of force and integration of a differential (infinitesimal period) of time between the time periods in which it was applied. 

\begin{equation}
\label{impulse}
J = \int^{t_2}_{t_1} F dt
\end{equation}

This is also known as the *Total Impulse*, or the *total change in momentum*, and can be calculated as the average thrust over a given time period.

### Thrust

Thrust is the mechanical force that drives the flight of the rocket. 
It is a vector quantity of magnitude and direction. 
*Thrust* is a reaction force in the opposite direction of accelerating fluid (exhaust gas) caused by the combustion of fuel, and is assumed to be aligned with the longitudinal axis of the rocket.


### Mass Flow Rate

*Mass Flow Rate* is found by the product of fluid density, velocity, and cross-sectional area.

\begin{equation} 
\dot{m} = \rho \vec{v} A
\end{equation}

[NASA - Thrust ](http://www.grc.nasa.gov/WWW/k-12/airplane/thrust1.html)

#### Thrust Equation

\begin{equation} 
T = \dot{m} \Delta \vec{v} 
\end{equation}

[NASA - Thrust Equation](http://www.grc.nasa.gov/WWW/k-12/airplane/thrsteq.html)

Thrust curves are provided by the manufacturer, and are rated at a constant fuel expenditure rate known as the specific fuel consumption ($S_{fc}$)

Table \ref{sample_motor_data} shows an example of the motor data provided by ThrustCurve.org:

| Parameter         | Value                            |
| ---               | ---                              |
| Manufacturer      | Cesaroni Technology              |
| Entered           | May 20, 2009                     |
| Last Updated      | Jun 26, 2014                     |
| Mfr. Designation  | 6819M1540-P                      |
| Common Name       | M1540                            |
| Motor Type        | reload                           |
| Delays            | P                                |
| Diameter          | 75.0mm                           |
| Length            | 75.7cm                           |
| Total Weight      | 5906g                            |
| Prop. Weight      | 3624g                            |
| Cert. Org.        | Canadian Association of Rocketry |
| Cert. Designation | 6819-M1540-IM-P                  |
| Cert. Date        |                                  |
| Average Thrust    | 1537.0N                          |
| Maximum Thrust    | 2328.8N                          |
| Total impulse     | 6819.4Ns                         |
| Burn Time         | 4.4s                             |
| Case Info         | Pro75-5G                         |
| Propellant Info   | Imax                             |
| Availability      | regular                          |

\captionof{table}{\label{sample_motor_data}Sample Motor Data}

Source: http://www.thrustcurve.org/motorsearch.jsp?id=673

##### Thrust Specific Fuel Consumption

*Thrust Specific Fuel Consumption* is how much fuel is burned for a given time. 

\begin{equation}
S_{fg} = \dfrac{m}{t_{burn}}\cdot \dfrac{1}{T_{avg}}  
\end{equation}

\begin{equation}
\left[ \dfrac{g}{s}\cdot \dfrac{1}{N} = \dfrac{s}{m} \right]  
\end{equation}

Since at the time of writing the $S_{fc}$ was not provided by the manufacturer, the following calculations are used for a first approximation. 

###### Assumptions

- all propellant is spent during the motor burn time
- final $S_{fg}$ determined is constant during burn
- the motor info provided is accurate

> It should be noted that a variance in thrust of $\pm 20 \%$ is possible. This and other variance factors are taken into account in the *Statistical Analysis* section. 

From the table above, the dry propellant weight is given as 3624 grams. The Average Thrust is given as 1537.0 Newtons, and the total burn time is given as 4.4 seconds.

Thus, the *Thrust Specific Fuel Consumption* can be determined as follows:

\begin{equation}
S_{fg} = \dfrac{3.624 \, kg}{4.4 \, s} \cdot \dfrac{1}{1537.0 \, N} \approx 0.00053587 \dfrac{kg}{N \cdot s} = 5.3587 \times 10^{-4} \dfrac{kg}{N \cdot s} 
\end{equation}

This rate is considered constant.

### Weight 

As fuel is expended in generating thrust, the weight of the rocket is reduced. We can use the *Thrust Specific Fuel Consumption* to determine the corresponding reduction in weight during burn.

First remove the Average Thrust term to isolate the mass flow rate:

\begin{equation}
\dot{m} = S_{fG} \cdot T_{avg} = 5.3587 \times 10^{-4} \dfrac{kg}{N \cdot s} \cdot 1537.0 \, N  = 0.8236 \, kg/s 
\end{equation}

This equation can be expressed in terms of Weight through Newton's 2$^nd$ law: $F = m\vec{a}$

\begin{equation}
\dot{W}_m = \dot{m} \cdot \vec{g} = 0.8236 \, kg/s \cdot 9.81 \, m/s^2 \approx 8.0799 N/s 
\end{equation}

To develop a relation for the change in weight as a function of $S_{f_c}$

\begin{equation} 
W_f(t) = (m_{f_i} kg - \Delta m(t)) \cdot \vec{g} 
\end{equation}

\begin{equation}
W_f(t) = (3.624 \, kg - \Delta m(t)) \cdot 9.81 \, m/s^2 
\end{equation}

\begin{equation}
W_f(t) = W_{f_i} - \Delta W_f(t)
\end{equation}

\begin{equation}
\Delta W_f (t) = \int \dot{W} dt = \dot{W}\cdot t
\end{equation}

\begin{equation}
\Delta W_f (t) = \dfrac{\Delta m(t) \cdot \vec{g}}{t}\cdot t = \Delta m (t) \cdot g 
\end{equation}

\begin{equation}
\Delta m_f(t) = S_{fg} \cdot t
\end{equation}

Finally, the motor weight as a function of time is 
\begin{equation}
W_m (t) = W_{m_t} - \Delta W_f(t) = W_{m_t} - \dot{m}_{fc} \cdot t
\end{equation}

#### Matlab Implementation

The following figure shows the output of the dynamic weight calculation in Matlab. 
The Thrust and Weight curves produce output similar to OpenRocket as expected.

[dynamic_weight_calculation_test_figure]: images/plots/error_mass_v_time_plot.png "Dynamic Weight Calculation Test Output" 
![Dynamic Weight Calculation Test Output \label{dynamic_weight_calculation_test_figure_label}][dynamic_weight_calculation_test_figure] 

\clearpage

### Center of Pressure

The *Center of Pressure* (COP) is the location (point) where the aerodynamic forces can be said to be acting, simplifying the complex distribution of forces across the rocket and its features. 

The *Center of Pressure* changes with the normal force distribution on the rocket, which is driven by *Angle of Attack*  [@barrowman, pg.4].

$$ COP = COP(\alpha) $$

A wind tunnel is the best way to approximate this point, but an analytic method is available.

#### Barrowman's Equations

*Barrowman's Equations* are used to determine the *Center of Pressure*.

\begin{equation}
\label{rocket_center_of_pressure}
\bar{X} = 
\dfrac
{ \left( C_{N \alpha} \right)_n \bar{x}_n + \left( C_{N \alpha} \right)_{cb} \bar{x}_{cb} + \left( C_{N \alpha} \right)_{fb} \bar{x}_{fb} }
{ C_{N \alpha}  }
\end{equation}

Where:

- $C_{N \alpha}$ is the *Stability Derivative*
- subscript $_n$ refers to the nose cone
- subscript $_{cb}$ refers to the cylindrical body
- subscript $_{fb}$ refers to the fin set in the presence of the body
- $\bar{x}$ refers to the component centroid

[@barrowman, pg.12]


##### Nose Cone COP

###### LV-Haack Nose Cone COP

\begin{equation}
\label{eq_cop_lv_haack}
\bar{X}_n = 0.437 h_n
\end{equation}

[@crowell1996, pg.7]

####### Von Karman Nose Cone COP

\begin{equation}
\label{eq_cop_von_karman}
\bar{X}_n = 0.500 h_n
\end{equation}

[@crowell1996, pg.7]

##### Fin Set COP

The force acting on the fins can be calculated using the following equation (applies only for identically shaped fins, in sets of 3, 4, or 6).

\begin{equation}
\label{eq_cop_fin_set}
(C_{n \alpha} )_f = C_{in}\dfrac{4n \left( \dfrac{s}{d} \right)^2}{1 + \sqrt{1 + \left( \dfrac{2 l}{a + b} \right)^2}}
\end{equation}

Where:

- $a$ is the fin tip chord length
- $b$ is the fin root chord length
- $s$ is the fin height
- $l$ is the distance between the root center and the tip center
- $C_{in}$ is a coefficient for the interference effects of the air flow near the fin-body interface

\begin{equation}
\label{eq_coef_cop_interference}
C_{in} = 1 + \dfrac{OD/2}{OD/2 + s}
\end{equation}

[@barrowman, pg.11]

The location of the *Center of Pressure* for the fin set is as follows.

\begin{equation}
\label{eq_cop_fin_set}
\bar{X}_{fb}
= 
X_f 
+ 
\dfrac {m ( b + 2 a )} {3 ( b + a ) } 
+ \dfrac{1}{6} 
\left[ b + a - \dfrac{b a}{b + a} \right]
\end{equation}

[@box2009, pg.10]

Where:

- $X_f$ is the distance from the tip of the nose cone to the point where the leading edge of the fin meets the body tube [@box2009, pg.11]
- $a$ is the fin tip chord length
- $b$ is the fin root chord length
- $s$ is the fin height
- $m$ is the fin sweep length

Also, see this [Center of Pressure Calculator online](http://physics.gallaudet.edu/tools/rocketcop.html).

##### Cylindrical Body COP

The centroid of a cylindrical body will be half its length

\begin{equation}
\label{eq_centroid_bodytube}
\bar{x}_{ct} = \dfrac{1}{2} l_{cb}
\end{equation}

Wind tunnel tests performed in 1918 and 1919 demonstrated that the normal force generated by a cylindrical body at an angle of attack of less than 10 degrees is negligible

[@barrowman, pg.10].

##### Stability Derivative

The *Stability Derivative* $C_{N\alpha}$ is a dimensionless parameter, used to calculate the force normal to the longitudinal axis, and is dependent on the shape of the component.
It is also the slope of the *Normal Force Coefficient*.

The total *Stability Derivative* is the sum of all *i* rocket component stability derivatives

\begin{equation}
\label{total_stability_derivative}
C_{N \alpha} = \sum C_{N \alpha (i)}   
\end{equation}

[@box2009, pg. 9]

##### Nose Cone

\begin{equation}
\label{eq_sd_nosecone}
C_{N \alpha (n)} = 2
\end{equation}

##### Rocket Body

\begin{equation}
\label{eq_sd_bodytube}
C_{N \alpha (bt)} = 0
\end{equation}

##### Fins

\begin{equation}
\label{eq_sd_finset}
C_{N \alpha (fs)} = ...
\end{equation}

#### Rocket Body Lift Correction

*Barrowman's Method* neglects the lift generated by the rocket body. Galejs [@galejs] suggests the following adjustment to provide a compensated *Coefficient of Normal Force due to Body Lift*

\begin{equation}
\label{eq_coef_normal_force_body_lift}
C_{N(L)} = K \dfrac{A_p}{A_ref} \alpha^2
\end{equation}

Where:

- $K$ = 1 
- $A_p$ is the rocket planform area excluding the fins
- $A_{ref}$ is the reference area of the rocket

[@box2009, pg.11] 

Equation \ref{eq_coef_normal_force_body_lift} is divided by $\alpha$ to be added to $C_{N \alpha}$ calculated and used in Equation \ref{rocket_center_of_pressure}.

TODO All COP components must be modified by the lift coefficient

\begin{equation}
\label{eq_coef_normal_force_body_lift_alpha}
C_{N \alpha^2} = K \dfrac{A_p}{A_ref} \alpha
\end{equation}

This correction is applied at the centroid of the planform area.

[@box2009, pg.11] 

##### Transonic Considerations

*Barrowman's Equations* are based on assumptions that are only valid in subsonic flight.
In the transonic and supersonic regions, what new effects are introduced that would affect the location of the *Center of Pressure*?

### Center of Gravity

\begin{equation}
y_{cg} = \dfrac{m_1 y_1 + m_2 y_2 + ... + m_n y_n}{\sum_{j=1}^n m_j}
\end{equation}

[NASA CG]:(http://www.grc.nasa.gov/WWW/K-12/airplane/cg.html)

\begin{equation}
COG(t) = \dfrac{m_1 y_1 + (m_2 - \Delta m) y_2}{m_1 + m_2 - \Delta m(t)} 
\end{equation}

Where COG(t) is the Center of Gravity as a function of time, $m_1$ is the static mass (combination of nose cone, body tube, and fins), $m_2$ is the initial mass of the motor, and $\Delta m(t)$ is the change of mass as a function of time due to fuel expenditure.

We consider the motor as a point mass centered at the geometric center of the motor casing. 
This simplifies the calculation of the center of gravity of the rocket as fuel is expended, as only the mass of the motor is changing, and not the location of its particular center of mass.

### Moments of Inertia

The instantaneous moment of inertia is determined by relating the moment of inertias of the static structure and the dynamic structure through the parallel axis theorem evaluated at the total center of gravity (COG).

The sum of moment of inertias evaluated through the *parallel axis theorem* nets the total rocket moment of inertia.

\begin{equation}
\label{eq_parallel_axis_theorem}
I_n = I_{cm(n)} + M_P d^2 
\end{equation}

\begin{equation}
I_T(t) = \sum I_n 
\end{equation}

Where:

- $I_T(t)$ is the total moment of inertia of the rocket as a function of time
- $I_n$ is the component vector (either static or dynamic moment of inertia)

[@box2009]

#### Longitudinal Moment of Inertia

To the *Moment of Inertia* related to the pitch/yaw of the rocket is the *Longitudinal Moment of Inertia*. 

\begin{equation}
\label{longitudinal_moment_inertia}
I = \dfrac{mL^2}{12}
\end{equation}

[TODO source dynamics textbook]

In keeping with the assumption of the motor as a point mass in the volumetric center of the motor casing, the dynamic *Longitudinal Moment of Inertia* is calculated as follows.

\begin{equation}
\label{static_longitudinal_moment_inertia}
I_{s} + m_{s} r_{0 \rightarrow 1}^2
\end{equation}

Where $r_{0 \rightarrow 1}$ is the distance between the static center of gravity (the COG of the nose cone, body tube, and fins) and the instantaneous center of gravity of the rocket. $I_{s}$ is provided by CATIA.

\begin{equation}
\label{motor_longitudinal_moment_inertia}
I_{m} = \dfrac{m_{m}L_{m}}{12} + m_{m}r_{0 \rightarrow 2}^2
\end{equation}

Where $L_{motor}$ is the length of the motor casing, and $r_{0 \rightarrow 2}$ is the distance between the motor center of gravity and the rocket center of gravity. 

Then, the rocket *Longitudinal Moment of Inertia* is the sum, shown as follows

\begin{equation}
\label{rocket_longitudinal_moment_inertia}
I_{r} = I_{m} + I_{s}
\end{equation}

