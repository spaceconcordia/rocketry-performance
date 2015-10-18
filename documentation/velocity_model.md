## Velocity Model - Simplified

### Physics Overview

*Force* is a change in momentum with time, and is related by Newton's Second Law

$$ F = \dfrac{m \Delta \vec{v}}{\Delta t} = m\vec{a} $$

*Mass Flow Rate* is found by the product of fluid density, velocity, and cross-sectional area.

(@) $$ \dot{m} = \rho \vec{v} A $$

### Thrust 

Thrust is the mechanical force that drives the flight of the rocket. It is a vector quantity of magnitude and direction. *Thrust* is a reaction force in the opposite direction of accelerating fluid (exhaust gas) caused by the combustion of fuel.

[NASA - Thrust ](http://www.grc.nasa.gov/WWW/k-12/airplane/thrust1.html)

#### Thrust Equation

(@) $$ T = \dot{m} \Delta \vec{v} $$

[NASA - Thrust Equation](http://www.grc.nasa.gov/WWW/k-12/airplane/thrsteq.html)

The dynamics of the rocket flights can be simplified to a sum of forces. 

Simplifying the rocket flight as ideally one-dimensional, with the positive z direction being upwards from the launch pad, the impulse is equal to the thrust of the rocket minus the weight of the rocket and the drag forces of the rocket interacting with the surrounding air.

$$m(t)\ddot{x}(t) = T(t) - D(\dot{x}) - W(t)$$

Mass is a function of time, which is explained in the *Dynamic Parameters* section. Drag is a function of velocity, which is explained in *Drag Model* section.
Acceleration can be expressed as the first derivative of velocity and also the second derivative of position, each with respect to time.

$$ \vec{a} = \dot{v} = \ddot{x} $$

Each force component can be rearranged and expressed as follows:
$$ \vec{a}_T = \dfrac{T(t)}{m(t)}, \vec{a}_W = \dfrac{W(t)}{m(t)}, \vec{a}_D = \dfrac{D(v)}{m(t)} $$

The net upward acceleration is: $\vec{a}_T  - \vec{a}_W - \vec{a}_D$

The sum of forces can be rearranged and acceleration can be solved for:

$$ \vec{a} =  \ddot{x} = \dfrac{1}{m(t)} (T(t) - D(\dot{x}) - W(t)) $$ 

Acceleration can be integrated to find position and velocity.

$$ \vec{v} = \int \vec{a} dx $$
$$ x = \iint \vec{a} dx $$

Modeling in the frequency domain, integration is represented by the $\dfrac{1}{s}$ block. A preliminary version of the model follows. 

[image]: images/vertical_model_simplified.png "Vertical Model - Simplified" 
![Alt text][image] 
Figure 1 Vertical Model - Simplified [image](#image).
