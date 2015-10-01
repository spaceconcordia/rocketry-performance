## Drag Model

Rockets in flight experience multiple sources of drag. The total drag effect is the sum of all specific drag effects.

The drag model shall take the parametric design parameters and applicable dynamics parameters to output the Drag Force and combined drag coefficient.

### Parasitic Drag

Parasitic drag is the drag due to body features not explicitly designed and/or imperfections not easily approximated. 
Examples include launch guides, ventilation holes, surface roughness, and any damage during flight. 

$$ D_{pa} = D_{pa} () $$ 


### Form Drag

$$ D_{fo} = D_{fo} () $$ 


### Profile Drag

$$ D_{pr} = D_{pr} () $$ 


### Interference Drag

$$ D_{in} = D_{in} () $$ 


### Base Drag

Base drag is experienced behind the aft section of the rocket cause by boundary separation between the flow past the rocket and the surrounding air. This results in a low pressure region which has an effect analogous to *pulling* the rocket against its direction of flight.

$$ D_{ba} = D_{ba} () $$ 


### Skin Friction Drag

Skin Friction Drag is a result of surface roughness. It is a component effect of parasitic drag.

$$ D_{ba} = D_{ba} (Re, ) $$ 

