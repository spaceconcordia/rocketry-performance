## Velocity Model - Simplified

The dynamics of the rocket flights can be simplified to a sum of forces. 

Simplifying the rocket flight as ideally one-dimensional, with the positive z direction being upwards from the launch pad, the impulse is equal to the thrust of the rocket minus the weight of the rocket and the drag forces of the rocket interacting with the surrounding air.

$$m(t)\ddot{x}(t) = T(t) - D(\dot{x}) - W(t)$$

Mass is a function of time, which is explained in the *Dynamic Parameters* section. Drag is a function of velocity, which is explained in *Drag Model* section.

Force is related by Newton's Second Law: $F = m \vec{a}$

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
