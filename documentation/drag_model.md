## Drag Model

Rockets in flight experience multiple sources of drag. The total drag effect is the sum of all specific drag effects.

The drag model shall take the parametric design parameters and applicable dynamics parameters (see *Data Model*) to output the Drag Force and combined drag coefficient.

### Compressible Flow Correction

Drag is evaluated differently when compressibility effects are in play. Compressibility effects must be considered above Mach 0.3 **[source?]**, which will be easily exceeded by the transonic target velocity of Mach 0.88 **[source?]**.

Particular correction factors are recommended for ranges of Mach number

| Mach Number         | Correction Factor                           |
| ---                 | ---                                         |
| $$ 0.3 < M < 0.8 $$ | $$ C^`_i = \dfrac{C_i}{\sqrt{1-M^2}} $$     |
| $$ 0.8 < M < 1.1 $$ | $$ C^`_i = \dfrac{C_i}{\sqrt{1-(0.8)^2}} $$ |

Where $C_i$ is the incompressible drag coefficient and $C^`_i$ is the compressibility corrected drag coefficient.

[@box2009]

### Areas

Reference areas are required to calculate the drag force.

Related to area, the specific parameters of interest on the rocket are the following:

- Outer Diameter of Rocket (OD)
- Total Length of Rocket (L) 
- Height of Nose Cone
- Thickness of Fins
- Number of Fins
- Width of Fins
- Surface Area of Nose


#### Wetted Body Area

The *Wetted Body Area* is the combined area of all surfaces in contact with moving air. 

[Fluids e-book (TODO find better)]:(https://ecourses.ou.edu/cgi-bin/eBook.cgi?doc=&topic=fl&chap_sec=09.1&page=theory)

#### Frontal Reference Area

The *Frontal Reference Area* is the project area of the rocket perpendicular to the direction of air flow. For perfectly vertical flight and quiescent air conditions, this is the precise projection of the tip face of the rocket.

### Drag Force and Coefficients

#### Parasitic Drag

Parasitic drag is the drag due to body features not explicitly designed and/or imperfections not easily approximated. 
Examples include launch guides, ventilation holes, surface roughness, and any damage during flight. 

$$ C_{pa}, D_{pa} (A_{ref}, M) $$ 


#### Form Drag

$$ C_{fo}, D_{fo} (A_{ref}, M) $$ 


#### Profile (Pressure) Drag

This is the drag caused by the pressure imbalance as an object moves through a free stream in the opposite direction to its motion.

[Pressure drag vs base drag?]

$$ C_{pr}, D_{pr} (A_{ref}, M) $$ 


#### Interference Drag

$$ C_{in}, D_{in} (A_{ref}, M) $$ 


#### Base Drag

Base drag is experienced behind the aft section of the rocket cause by boundary separation between the flow past the rocket and the surrounding air. This results in a low pressure region which has an effect analogous to *pulling* the rocket against its direction of flight.

$$ C_{ba}, D_{ba} ((A_{ref}, M)) $$ 


#### Skin Friction Drag

Skin Friction Drag is a result of surface roughness. It is a component effect of parasitic drag.

$$ C_{sk}, D_{sk} (A_{ref}, M) $$ 


#### Fin Pressure Drag

$$ C_{fp}, D_{fp} (A_{ref}, M) $$ 

#### Wave Drag

*Wave drag* is drag associated with shock waves (independent of viscous effects)

#### Boat-Tail Drag

*Boat-Tail Drag* occurs due to ... 
