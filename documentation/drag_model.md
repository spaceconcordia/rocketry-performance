## Drag Model

Rockets in flight experience multiple sources of drag. The total drag effect is the sum of all specific drag effects.

The drag model shall take the parametric design parameters and applicable dynamics parameters (see *Data Model*) to output the Drag Force and combined drag coefficient.

### Compressible Flow Correction

Drag is evaluated differently when compressibility effects are in play. Compressibility effects must be considered above Mach 0.3 **[source?]**, which will be easily exceeded by the transonic target velocity of Mach 0.88 **[source?]**.

> At low speeds (incompressible flow), the aerodynamic coefficients are functions of the angle of attack ($\alpha$) and Reynolds number (Re). 

$$ C_i (M < 0.3) = C_i (\alpha, Re) $$ 

> At higher speeds (compressible, Ma $\ge$ 0.4) they are also a function of Mach number.

$$ C_i (M \ge 0.3) = C_i (\alpha, Re, M) $$ 

Particular correction factors are recommended for ranges of Mach number

| Mach Number         | Correction Factor                           |
| ---                 | ---                                         |
| $$ M < 0.3 $$       | N/A                                         |
| $$ 0.3 < M < 0.8 $$ | $$ C^`_i = \dfrac{C_i}{\sqrt{1-M^2}} $$     |
| $$ 0.8 < M < 1.1 $$ | $$ C^`_i = \dfrac{C_i}{\sqrt{1-(0.8)^2}} $$ |

Where $C_i$ is the incompressible drag coefficient and $C^`_i$ is the compressibility corrected drag coefficient.

[@box2009]

### Incompressible Flow

For Mach < 0.3, 

> In the incompressible flow regime the forces can be divided into pressure
force and viscous force

*Pressure Force* is due to fluid stagnation on areas of the rocket, as well as due to the low pressure region created beyond the rocket at is passes quickly through the air. 

*Viscous Force* is due to boundary layer effects and interactions of moving air with surfaces. These forces are highly dependent on Reynold's number.
[@box2009, pg.6]

[image]: images/rocket_drag_forces.png "Rocket Drag Forces - Axial vs. Normal" 
![Alt text][image] 
[Rocket Drag Forces - Axial vs. Normal](#image).

### Turbulent Effects

Viscous forces are much less severe in turbulent conditions than laminar conditions - TODO EXPAND

[@box2009, pg.6]

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

The *Frontal Reference Area* is the projected area of the rocket perpendicular to the direction of air flow. For perfectly vertical flight and quiescent air conditions, this is the precise projection of the tip face of the rocket.

[TODO show figure]

### Drag Force and Coefficients

The total drag force is a function of air velocity (relative to the rocket body, therefore ideally the velocity of the rocket in quiescent air conditions), drag coefficient, reference area, and air density.

$$ D_f = D_f (\vec{v}, C_d, A_{ref}, \rho) $$

The drag coefficient $C_d$ is the sum of all component drag coefficients

$$ C_d = \sum C_i = C_{pa} + C_{fo} + C_{pr} + C_{in} + C_{ba} + C_{sk} + C_{fp} + C_{wa} + C_{bt} $$ 

The *reference area* is the projected area of the body flowing through air, perpendicular to the direction of flow. [source?]
 
From Fluid Mechanics [source?]

$$ D_f = \dfrac{1}{2} C_d A_{ref} \rho \vec{v}^2 $$ 

#### Parasitic Drag

Parasitic drag is the drag due to body features not explicitly designed and/or imperfections not easily approximated. 
Examples include launch guides, ventilation holes, surface roughness, and any damage during flight. 

$$ C_{pa}, D_{pa} (A_{ref}, M) $$ 

##### Parasitic Drag Coefficient

$$ C_{pa} = \left( 1.3 - 0.3 \dfrac{(L-h_n)}{OD} \right)_{max} \cdot C_{stagnation} $$

Where *L* is the rocket length, $h_n$ is the height of the nose code, *OD* is the outer diameter of the rocket, and $C_{stagnation}$ is the stagnation coefficient.

##### Parasitic Drag Coefficient - Normalized

$$ C_{pa_{norm}} = C_{pa} \cdot \left( \pi \cdot (r_{ext}^2 - r_{int}^2) \cdot \left[ 1 - \left( \dfrac{L-h}{OD} \right), 0 \right]_{max} \right) $$

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

*Wave drag* is drag associated with shock waves (independent of viscous effects). 

> At transonic speed, shock waves form at the nose tip and at the leading edge of the fins ... Momentum is transferred from the rocket to the surrounding air via these shockwaves  

#### Boat-Tail Drag

*Boat-Tail Drag* occurs due to ... 
