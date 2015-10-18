## Dynamic Parameters

As agreed with Emily on 2015/10/02:

- the parametric model must provide the moment of inertia, mass, area, and center of gravity of all static structural components (nose cone, body tube, fins, etc.)
- the mass, center of mass (relative to the nose tip) of the motor

### Thrust

Thrust curves are provided by the manufacturer, and are rated at a constant fuel expenditure rate known as the specific fuel consumption ($S_{fc}$)

In addition to a RASP file (.eng) and a RockSim file (.rse) Here is an example of the motor data provided by ThrustCurve.org:

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

[motor_data_table]: images/vertical_model_simplified.png "Vertical Model - Simplified" 
![Alt text][Motor Data Table] 
Table 1 Motor Data Table [motor_data_table](#table).

Source: http://www.thrustcurve.org/motorsearch.jsp?id=673

##### Thrust Specific Fuel Consumption

*Thrust Specific Fuel Consumption* is how much fuel is burned for a given time. 

$$ S_{fg} = \dfrac{m}{t_{burn}}\cdot \dfrac{1}{T_{avg}} $$ 
$$ \left[ \dfrac{g}{s}\cdot \dfrac{1}{N} = \dfrac{s}{m} \right] $$ 

Since at the time of writing the $S_{fc}$ was not provided by the manufacturer, the following calculations are used for a first approximation. 

###### Assumptions

- all propellant is spent during the motor burn time
- final $S_{fg}$ determined is constant during burn
- the motor info provided is accurate

> It should be noted that a variance in thrust of $\pm 20 \%$ is possible. This and other variance factors are taken into account in the *Statistical Analysis* section. 

From the table above, the dry propellant weight is given as 3624 grams. The Average Thrust is given as 1537.0 Newtons, and the total burn time is given as 4.4 seconds.

Thus, the *Thrust Specific Fuel Consumption* can be determined as follows:

$$ S_{fg} = \dfrac{3.624 \, kg}{4.4 \, s} \cdot \dfrac{1}{1537.0 \, N} \approx 0.00053587 \dfrac{kg}{N \cdot s} = 5.3587 \times 10^{-4} \dfrac{kg}{N \cdot s} $$ 

This rate is considered constant.

### Weight 

As fuel is expended in generating thrust, the weight of the rocket is reduced. We can use the *Thrust Specific Fuel Consumption* to determine the corresponding reduction in weight during burn.

First remove the Average Thrust term to isolate the mass flow rate:

$$ \dot{m} = S_{fG} \cdot T_{avg} = 5.3587 \times 10^{-4} \dfrac{kg}{N \cdot s} \cdot 1537.0 \, N  = 0.8236 \, kg/s $$ 

This equation can be expressed in terms of Weight through Newton's 2$^nd$ law: $F = m\vec{a}$

$$ \dot{W}_m = \dot{m} \cdot \vec{g} = 0.8236 \, kg/s \cdot 9.81 \, m/s^2 \approx 8.0799 N/s $$ 

To develop a relation for the change in weight as a function of $S_{f_c}$

$$ W_f(t) = (m_{f_i} kg - \Delta m(t)) \cdot \vec{g} $$ 

$$ W_f(t) = (3.624 \, kg - \Delta m(t)) \cdot 9.81 \, m/s^2 $$ 

$$ W_f(t) = W_{f_i} - \Delta W_f(t)$$ 

$$ \Delta W_f (t) = \int \dot{W} dt = \dot{W}\cdot t $$

$$ \Delta W_f (t) = \dfrac{\Delta m(t) \cdot \vec{g}}{t}\cdot t = \Delta m (t) \cdot g $$ 

$$ \Delta m_f(t) = S_{fg} \cdot t $$

Finally, the motor weight as a function of time is 
$$ W_m (t) = W_{m_t} - \Delta W_f(t) = W_{m_t} - \dot{m}_{fc} \cdot t $$

#### Matlab Implementation

[dynamic_parameter_calculation]: images/dynamic_parameter_calculation.png "Dynamic Parameter Calculation" 
![Alt text][dynamic_parameter_calculation] 
[Figure 1 Dynamic Parameter Calculation](#fig:dynamic_parameter_calculation)

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
![Alt text][dynamic_weight_calculation_test_figure] 
[Figure 1 Dynamic Parameter Calculation ](#dynamic_weight_calculation_test_figure)


### Center of Gravity

$$ y_{cg} = \dfrac{m_1 y_1 + m_2 y_2 + ... + m_n y_n}{\sum_{j=1}^n m_j} $$

[NASA CG]:(http://www.grc.nasa.gov/WWW/K-12/airplane/cg.html)

$$ COG(t) = \dfrac{m_1 y_1 + (m_2 - \Delta m) y_2}{m_1 + m_2 - \Delta m(t)} $$ 

Where COG(t) is the Center of Gravity as a function of time, $m_1$ is the static mass (combination of nose cone, body tube, and fins), $m_2$ is the initial mass of the motor, and $\Delta m(t)$ is the change of mass as a function of time due to fuel expenditure.

### Moments of Inertia

The instantaneous moment of inertia is determined by relating the moment of inertias of the static structure and the dynamic structure through the parallel axis theorem evaluated at the total center of gravity (COG).

The sum of moment of inertias evaluated through the parallel axis theorem nets the total moment of inertia.

$$ I_n = I_{cm(n)} + M_P d^2 $$ 

$$ I_T(t) = \sum I_n $$ 

Where $I_T(t)$ is the total moment of inertia of the rocket as a function of time, and $I_n$ is the component vector (either static or dynamic moment of inertia)

[1]

