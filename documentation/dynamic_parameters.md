## Dynamic Parameters

Parameters listed as *dynamic* in the table above are provided as initial values which are then recalculated by the model throughout the simulated flight.


### Thrust

Thrust is the mechanical force that drives the flight of the rocket. It is a vector quantity of magnitude and direction. *Thrust* is a reaction force in the opposite direction of accelerating fluid (exhaust gas) caused by the combustion of fuel.

*Force* is a change in momentum with time, and is related by Newton's Second Law

\begin{equation}
F = \dfrac{m \Delta \vec{v}}{\Delta t} = m\vec{a}
\end{equation}

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

Here is an example of the motor data provided by ThrustCurve.org:

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

\captionof{table}{Sample Motor Data}

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

[dynamic_parameter_calculation]: images/dynamic_parameter_calculation.png "Dynamic Parameter Calculation" 
![Dynamic Parameter Calculation \label{dynamic_parameter_calculation_label}][dynamic_parameter_calculation] 

~~~~
function [mass, weight, thrust] = dynamic_weight_calculation(thrust_curve, wet_motor_weight, wfc)
%------------------------------------------------------------------------------
% INPUT PARAMETERS
% thrust_curve     - a horizontal data set containing time and thrust
%                    data from a given motor    
% wfc              - the rate of motor weight loss due to fuel consumption 
% wet_motor_weight - the weight in Newtons of a motor *including* 
%                    propellant
%
% NOTE: this implementation skips the W_dot evaluation, just uses mfc 
% NOTE: UNTESTED
%------------------------------------------------------------------------------

% create the weight curve from an input thrust curvve matlab file 
% with the same dimensions as the input thrust curve
% weight_curve = {'time','weight'}

% grab the size of the input thrust curve
data_length = size(thrust_curve,1);

% create the corresponding weight curve, same size
weight = zeros(data_length,1);
    
%for i = 1:length(thrust_curve)
for i = 1:data_length
    weight(i,1) = wet_motor_weight - wfc*thrust_curve(i,1); 
end

thrust = thrust_curve;
mass = weight * 9.81;
~~~~

##### Unit Testing

~~~~
%------------------------------------------------------------------------------
%
% Dynamic Weight Calculation Test
%
% run the function against input thrust data
%------------------------------------------------------------------------------

g                = 9.81;
wet_motor_weight = 5.906*g;
dry_motor_weight = 3.624*g;
mfc              = 0.8236*g;

thrust_curve = thrust_data_import('monotomic_time_thrust_curve.csv');

burntime     = thrust_curve(:,1);
thrust_force = thrust_curve(:,2);

subplot(2,1,1);
plot(burntime,thrust_force);
title('Dynamic Weight Calculation Test - Motor Thrust Curve');
ylabel('Thrust - T (N)');
xlabel('Time - t (s)');

[actual_mass, actual_weight, actual_thrust] = dynamic_weight_calculation(thrust_curve, wet_motor_weight, mfc);

subplot(2,1,2);
plot(burntime,actual_weight(:,1))
title('Dynamic Weight Calculation Test - Motor Weight Curve');
ylabel('Weight - W (N)');
xlabel('Time - t (s)');

% TODO need to provide some hand-calculated data to assert against

% check that the last weight value is equal to the dry motor weight
%assert ( actual_weight_curve(122,1) == dry_motor_weight );
last_row = size(actual_weight,1);
final_weight = actual_weight(last_row, 1);

% TODO right now this assertion fails because the thrust data is not interpolated
assert ( dry_motor_weight == final_weight );
~~~~

The following figure shows the output of the test. The Thrust and Weight curves are output as expected.

[dynamic_weight_calculation_test_figure]: images/dynamic_weight_calculation_test_figure.png "Dynamic Weight Calculation Test Output" 
![Dynamic Weight Calculation Test Output \label{dynamic_weight_calculation_test_figure_label}][dynamic_weight_calculation_test_figure] 

### Center of Pressure

The *Center of Pressure* (COP) is the location where the aerodynamic forces are said to be acting. 
A wind tunnel is the best way to approximate this point, but an analytic method is available.

#### Barrowman's Equations

*Barrowman's Equations* are used to determine the center of pressure. 

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

The sum of moment of inertias evaluated through the parallel axis theorem nets the total moment of inertia.

\begin{equation}
I_n = I_{cm(n)} + M_P d^2 
\end{equation}

\begin{equation}
I_T(t) = \sum I_n 
\end{equation}

Where $I_T(t)$ is the total moment of inertia of the rocket as a function of time, and $I_n$ is the component vector (either static or dynamic moment of inertia)

[@box2009]

### Longitudinal Moment of Inertia

To the *Moment of Inertia* related to the pitch/yaw of the rocket is the *Longitudinal Moment of Inertia*. 

\begin{equation}
\label{longitudinal_moment_inertia}
I = \dfrac{mL^2}{12}
\end{equation}

[TODO source dynamics textbook]

In keeping with the assumption of the motor as a point mass in the volumetric center of the motor casing, the dynamic *Longitudinal Moment of Inertia* is calculated as follows.

\begin{equation}
\label{static_longitudinal_moment_inertia}
I_{static} + m_{static} r_{0 \rightarrow 1}^2
\end{equation}

Where $r_{0 \rightarrow 1}$ is the distance between the static center of gravity (the COG of the nose cone, body tube, and fins) and the instantaneous center of gravity of the rocket. $I_{static}$ is provided by CATIA.

\begin{equation}
\label{motor_longitudinal_moment_inertia}
I_{motor} = \dfrac{m_{motor}L_{motor}}{12} + m_{motor}r_{0 \rightarrow 2}^2
\end{equation}

Where $L_{motor}$ is the length of the motor casing, and $r_{0 \rightarrow 2}$ is the distance between the motor center of gravity and the rocket center of gravity. 

Then, the rocket *Longitudinal Moment of Inertia* is the sum, shown as follows

\begin{equation}
\label{rocket_longitudinal_moment_inertia}
I_{rocket} = I_{motor} + I_{static}
\end{equation}

