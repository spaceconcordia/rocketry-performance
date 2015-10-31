# Gas Dynamics - MECH 461

## Background

### Assumptions
- perfect gas
- adiabatic nozzle
- reversible process
- ergo isentropic, except during shock

### Thermodynamics

#### Ideal Gas Law - Equation of State
Using **static** temperature and pressure
$$ P = \rho RT $$

#### Perfect Gas
> - constant Specific heat capacity

| Relation                | Formula                                           |
| ---                     | ---                                               |
| Ideal Gas Law           | $$ pV = nRT $$                                    |
| Ratio of Specific Heats | $$ \gamma = \dfrac{C_p}{C_v} $$                   |
| Specific Gas Constant   | $$ C_p - C_v = R = C_p(1- 1/\gamma) $$            |
| Useful Ratio            | $$ \dfrac{R}{C_p} = \dfrac{\gamma - 1}{\gamma} $$ |


#### Isentropic Flow

#### Isentropic Relation

$$ \dfrac{T_2}{T_1} = \left( \dfrac{P_2}{P_1} \right) ^{ \dfrac{\gamma - 1}{\gamma} } $$

$$ \therefore \dfrac{P_o}{P} = \left( 1+ \dfrac{\gamma-1}{2}\cdot M \right)^ { \dfrac{\gamma}{\gamma-1} }$$

#### Change in entropy
> - occurs only over shocks in this course

$$ \Delta s = s_2 - s_1 = C_p \ln \left( \dfrac{T_2}{T_1} \right) - R \ln \left( \dfrac{P_2}{P_1} \right) $$

#### Gibb's Equation
$$ T \cdot ds = dh - \dfrac{1}{\rho} dP $$

### Conservation Laws
### Conservation of Mass (continuity)
$$ \underbrace{\dfrac{d}{dt} \iiint\limits_\forall \rho \, d \, \forall}_{\text{mass flow rate}} + \iint\limits_S \rho \, \vec{v} \cdot \hat{n} \, dA = 0$$

#### Conservation of Momentum
$$ \dfrac{d}{dt} m\vec{v} = \dfrac{d}{dt} \iiint \rho \vec{v} \cdot d\forall + \iint \vec{v} (\rho \vec{v})\cdot \hat{n} \, dA = \sum F  $$

#### Conservation of Energy
> - 1st Law of Thermodynamics

$$ 
\underbrace{dE}_{\text{Energy}} = 
\underbrace{dQ}_{\text{Heat}}- 
\underbrace{dW}_{\text{work incl. flow work}} 
$$

### Fluids
#### Incompressible Flow

#### Continuity Equation
$$ \dfrac{\delta \rho}{\delta t} + \nabla (\rho \, \vec{u} ) = 0 $$
$$ \nabla \cdot \vec{u} = 0 $$

#### Bernoulli's Principle
$$ \dfrac{\vec{V}^2}{2} + gz + \dfrac{p}{\rho} = constant $$

#### Compressible Flow

$$ \rho \vec{V} d \vec{V} + dP = 0 $$


#### Flow Velocity Designations

|State			|Value			|
|---			|---			|
|Subsonic		|Mach < 1		|
|Supersonic		|Mach > 1		|
|Transonic		|0.8 < Mach < 1.2	|
|Hypersonic		|Mach > 5		|
|Incompressible flow 	|Mach < 0.3		|
|Compressible flow	|Mach > 0.3		|

##### Static Pressure
$$ P = \rho RT $$

##### Total (Stagnation) Pressure

$$ P_o = P_{static} + \dfrac{\vec{V}^2}{2 \rho} $$

##### Static Temperature
> Partial temperature of air that is not moving
$$ T_{static} = \dfrac{P}{RT} $$

##### Total (Stagnant) Temperature
> Total temperature of air including static temperature and energy of air in motion
$$ T_o = T_{static} + \dfrac{c^2}{2 C_p} $$

##### Static Enthalpy
$$ h = u + Pv $$

##### Total (Stagnation) Enthalpy
$$ h_o = h + \dfrac{\vec{v}^2}{2} $$
$$ d h_o = d(h + \dfrac{\vec{v}^2}{2}) = 0 $$

##### Stagnation Density
$$ \dfrac{\rho_o}{\rho} = \left( \dfrac{T_o}{T} \right) ^ { \dfrac{1}{\gamma-1} } = \left( 1 + \dfrac{\gamma-1}{2} M^2 \right) ^ { \dfrac{1}{\gamma-1} } $$

##### Pressure Ratios

$$ \dfrac{T_o}{T} = \left( 1+ \dfrac{\gamma-1}{2} \right) $$ $$ \dfrac{P_o}{P} = \left( 1+ \dfrac{\gamma-1}{2}\cdot M^2 \right)^ { \dfrac{\gamma}{\gamma-1} } $$

#### Sound Speed

- calculated using static temperature 

$$ \vec{a} = \sqrt{ \gamma R T_o } $$ 

#### Thrust

- force orthogonal from the main load

$$ F_T = P_e \, A_e - P_i \, A_i + P_{atm} (A_i - A_e) = \dot{m} \, (V_e - V_i) $$
$$ F_T = P_{e, abs} \, A_e - P_{i,abs} \, A_i = \dot{m} \, (V_e - V_i) $$

## Gas Dynamics

### Back Pressure

- quiescent


### Choked (critical) Flow (velocity)

- a condition when Mach 1 is reached in a converging nozzle with initial subsonic flow
- the mass flow rate will not increase with a further decrease in downstream:upstream pressure ratio
- velocity is restricted. However mass flow can be increased with increased upstream pressure (increased fluid density)
- after choked flow, the exit pressure equals the critical back pressure
- proved by conservation of momentum

### Relationships

| System             | Relationship                                            |
| ---                | ---                                                     |
| Isentropic 1D Flow | $$ \dfrac{dA}{A} = \dfrac{dP}{\rho \vec{v}^2}(1-M^2) $$ |

#### Absolute Pressure Ratios for Choked Flow
| $$ \text{Gas} $$ | $$ P^*/P $$  |
| ---              | ---          |
| $$ \text{Air} $$ | $$ 0.528 $$  |
| $$O_2 $$         | $$ 0.5457 $$ |

#### Converging Nozzle, Subsonic, no shock
| Parameter       | Change    |
| ---             | ---       |
| Total Pressure  | Constant  |
| Static Pressure | Decreases |
| Total Temp      | Constant  |
| Static Temp     | Decreases |
| Total Enthalpy  | Contant   |
| Static Enthalpy | Decreases |
| Mach Number     | Increases |

#### Converging Nozzle, Supersonic, no shock
| Parameter       | Change    |
| ---             | ---       |
| Total Pressure  | Constant  |
| Static Pressure | Increases |
| Total Temp      | Constant  |
| Static Temp     | Increases |
| Total Enthalpy  | Constant  |
| Static Enthalpy | Decreases |
| Mach Number     | Decreases |

#### Diverging Nozzle, Subsonic, no shock
| Parameter       | Change    |
| ---             | ---       |
| Total Pressure  | Constant  |
| Static Pressure | Increases |
| Total Temp      | Constant  |
| Static Temp     | Increases |
| Total Enthalpy  | Contant   |
| Static Enthalpy | Decreases |
| Mach Number     | Decreases |

#### Diverging Nozzle, Supersonic, no shock
| Parameter       | Change                     |
| ---             | ---                        |
| Total Pressure  | $\Leftrightarrow$ Constant |
| Static Pressure | $\Downarrow$ Decreases     |
| Total Temp      | $\Leftrightarrow$ Constant |
| Static Temp     | $\Downarrow$Decreases      |
| Total Enthalpy  | $\Leftrightarrow$ Constant |
| Static Enthalpy | $\Downarrow$Decreases      |
| Mach Number     | $\Uparrow$Increases        |

#### Diverging Nozzle, Supersonic, after shock
| Parameter       | Change                         |
| ---             | ---                            |
| Total Pressure  | Decreases                      |
| Static Pressure | Increases                      |
| Total Temp      | Constant                       |
| Static Temp     | Increases                      |
| Total Enthalpy  | Contant                        |
| Static Enthalpy | Decreases                      |
| Mach Number     | Always less than or equal to 1 |

#### Summary
| dA     | M < 1  | M > 1  |
| ---    | ---    | ---    |
| dA < 0 | dM > 0 | dM < 0 |
| dA > 0 | dM<0   | dM > 0 |


### Shock
- A shock occurs because flow hits a pressure too high to sustain supersonic flow
- **It's all about back pressure**
- shock waves can either be compression waves or expansion waves
$$ Work = 0 $$ $$ \dot{Q} = 0 $$

#### Back Pressure considerations

$$ P_{B,\text{shock at exit}} < P_{B,\text{shock at inlet}} $$
- back pressure is the static pressure (TODO verify)
- when shock occurs at exit, back pressure is the static pressure of subsonic recovery

#### Normal Shock

- **only** occurs in supersonic flows
- **only** occurs in diverging section
- can be moved along by changing the area of the diffuser and adjusting pressure
- flow will **always** recuperate at subsonic speed

#### Stationary Normal Shock

#### Moving Normal Shock

#### Oblique Shock
- an oblique shock is a shock that is inclined relative to the flow direction
- oblique shock occurs when the back pressure is lower than the exit pressure, or because of a change in flow direction
 - flow turning away from itself results in an expansion wave
- the pressure wave exits the nozzle, and suddenly depressurizes to equal the back pressure
- shock angle is created, no longer normal to the direction of flow
- **oblique shock relations are identical to normal shock relations if we use normal velocity to define conditions**


| Angle                             | Description               |
| ---                               | ---                       |
|Wave (Shock) Angle                 | $$ \theta $$              |
|Corner (flow deflection) Angle     | $$ \delta $$              |


##### Weak shock
- supersonic after shock has occurred 
- flow geometries open to the atmosphere

##### Strong shock
- subsonic after shock has occurred
- confined geometries, such as inside a nozzle intake

##### Detached oblique shock
$$ \delta > \delta_{max} $$

##### $$ \theta - \beta - M \text{ equation } $$
$$ \tan \theta = 2 \cot \beta \dfrac {M_1^2 \sin^2 \beta - 1}{ M_1^2 ( \gamma + \cos 2 \beta ) + 2 } $$

##### Oblique Shock Problem Solving Steps
1. $\text{Find corner angle: } \delta$
2. Use Oblique Shock Chart
3. $\text{Find shock angle: } \theta$ 
4. $\text{Find: } M_{n1}$
5. $\text{Find: } M_{n2}$
$M_{n2}^2 = \dfrac{ 1 + \dfrac{\gamma-1}{2}\, M^2_{n1} } { \gamma M_{n1}^2 - \dfrac{\gamma-1}{2} }$
6. Use appropriate ratio 
- $M_{n2}, M_2, \dfrac{\rho_2}{\rho_1},  \dfrac{p_2}{p_1}, \dfrac{h_2}{h_1}, \dfrac{p_02}{p_01}$
7. $\text{Find: } M_2 \text{ from Normal shock tables, or:}$
$M_2 = \dfrac { M_{n2} } { sin ( \beta + \theta ) }$ 

#### Expansion Waves

- isentropic expansion
- not a shock process

| Parameter             | Description               |
| ---                   | ---                       |
| $$ \delta \nu $$      | Expansion Angle           |
| $$ \mu $$             | Shock angle               |
| $$ \vec{v}_t $$       | Shock velocity            |

| Expression                                                        | Description                   |
| $$ \dfrac{ \Delta \vec{v} }{ \vec{v} } = \tan ( \mu ) d \nu $$    |                               |
| $$ \Delta \mu = \d \nu + \mu_1 - \mu_2 $$                         | Fan angle                     |
| $$ M_1 = \dfrac{1}{\mu_1} $$                                      | Mach related to wave angle    |


$$ \vec{v}_{2n} > \vec{v}_{1n} $$ 


### Friction Flow

#### Fanno Line Flow
- adiabatic flow with no external work

$$ h_o = h + \dfrac{ \vec{v}^2 }{2} = constant $$

1. For subsonic flow, increasing loss and entropy change push flow up to Mach 1
2. For supersonic flow, increasing loss and entropy change push flow down to Mach 1
3. Flow Mach number for given mass flow cannot exceed Mach 1, hence additional length brings reduced mass flow
4. For supersonic flow unable to "sense" changes in duct length occurring ahead of it, the flow adjusts to the additional length by means of a normal shock rather than a flow reduction, the location of which is determined by the back pressure imposed on the duct


| Parameter | Description |
| ---           | ---     |
| $$ L_{max} $$ | Maximum duct length beyond which a flow reduction occurs |
| $$ f = \dfrac{4 \tau_f}{1/2 \rho \vec{v}^2 } $$ | Friction Coefficient |

$$ \text{For } \gamma = 1.4, \, f L_{max}/D \rightarrow -> 0.8215 \text{ for increasing M} $$

### Heat Addition

#### Rayleigh Flow
- no difference between internal heat generation and external heat addition
- no difference if heat is added at one point or distributed over a length

In both supersonic and subsonic cases:

1. Adding heat causes flow to approach Mach 1
 - in subsonic case it speeds up
 - in supersonic case it slows down
2. Removing heat causes flow to go away from Mach 1
 - In subsonic case it slows down
 - In supersonic case it speeds up

##### Newton's Law of Cooling
$$ \dot{q} = \bar{h}A(T_w-T_f) $$ 


##### Fanno Flow Tables

- Entries contain the Mach Number at current point, and all other ratio parameters relative to the point down the pipe where M = 1



---



## Interestingly
- the upper speed limit for supersonic flow in a diverging channel is limited by **temperature**, as T cannot be less than 0 Kelvin (3rd Law? of Thermodynamics)
$$ V_{max} = \sqrt{2 C_p T_o} \therefore V_{max} \rightarrow \text{finite} $$
