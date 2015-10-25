## Aerodynamic Geometry

### Surface Roughness

*Surface Roughness* is the deviation in the normal direction from a surface of its features. It contributes to *Skin Friction Drag* 

### Fineness Ratio

The *Fineness Ratio* is the ratio of the length to the outer diameter

\begin{equation} 
f_B = L / OD 
\end{equation}

### Fins

### Aerodynamic Chord Length of Fins

Since there is no airfoil on the fin design, the *Aerodynamic Chord Length of the Fins* ($L_cf$) is equal to the height of the fins. 

### Areas

Reference areas are required to calculate the drag force.

Related to area, the specific parameters of interest on the rocket are the following:

- Outer Diameter of Rocket (*OD*)
- Total Length of Rocket (*L*) 
- Height of Nose Cone ($h_n$)
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

## Nose Profile

### Von Karman (Haack)

A *Von Karman* nose profile has been selected by the design team, other profiles will not be supported in the initial version of the model.
The *Von Karman* nose profile is a *Haack Series* geometry, designed to minimize theoretical pressure drag [niskanen2013]. 
This profile excels in subsonic flow conditions, and performs well in transonic flow conditions - as such is it well suited for the current mission [nassaNoseCone].

The equation for the *Haack Series* is 
\begin{equation}
r(x) = \dfrac{R}{\sqrt{\pi}} \sqrt{ \theta - \dfrac{1}{2} sin (2 \theta) + \kappa \sin^3 \theta }
\end{equation}

Where 
\begin{equation}
\theta = \cos^{-1} \left( 1 - \dfrac{2x}{L} \right)
\end{equation}

[Nose Profile Design](http://rimworld.com/nassarocketry/fabrication/nosecones/design.html)

[Nose Profile Design](https://en.wikipedia.org/wiki/Nose_cone_design#Von_K.C3.A1rm.C3.A1n)
