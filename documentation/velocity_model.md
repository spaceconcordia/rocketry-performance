## Velocity Model - Simplified

The dynamics of the rocket flights can be simplified to a sum of forces. 

Simplifying the rocket flight as ideally one-dimensional, with the positive z direction being upwards from the launch pad, the impulse is equal to the thrust of the rocket minus the weight of the rocket and the drag forces of the rocket interacting with the surrounding air.

$$ \sum F = T - W - D $$ 

Force is related by Newton's Second Law: $F = m \vec{a}$

Each component can be rearranged and expressed as follows:
$$ \vec{a_T} = \dfrac{T}{m}, \vec{a_W} = \dfrac{W}{m}, \vec{a_D} = \dfrac{D}{m} $$

The net upward acceleration is: $a_T - a_W - a_D$

The sum of forces can now be rearranged and acceleration can be solved for:

$$ \vec{a} = \dfrac{T}{m} + \dfrac{W}{m} + \dfrac{D}{m} = \dfrac{1}{m} (T - W - D) $$ 

$$ \dot{v} = \dfrac{1}{m}(T - W - D) $$ 

In state variable form:

$$ \vec{a} = \dot{v} = \ddot{x} $$

Acceleration can be integrated to find position and velocity.

$$ \vec{v} = \int \vec{a} dx $$
$$ x = \iint \vec{a} dx $$

Modeling in the frequency domain, integration is represented by the $\dfrac{1}{s}$ block 

[image]: images/vertical_model_simplified.png "Vertical Model - Simplified" 
![Alt text][image] 
Figure 1 Vertical Model - Simplified [image](#image).
