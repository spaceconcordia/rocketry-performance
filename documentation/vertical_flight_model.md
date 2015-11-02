# Vertical (AOA < 5$^\circ$) Flight Model

## Particular Assumptions

The rocket is to be launched on a guide that may have a $\pm$ 5$^\circ$ angle. Considering the small angle approximation, the sine of 5 degrees or less is approximately equal to the angle in radians, or zero.

For a 1% error:
(@) $$ sin ( \theta \le 15^\circ ) \approx 0 $$ 
[UManitoba](http://www.physics.umanitoba.ca/undergraduate/phys2260/Lectures/Intro%20Optics%20-%20PPT%20v1part%2004.pdf)

This assumption greatly simplifies the simulation analysis. We consider that the rocket flies perfectly vertical (experiencing no significant drift) into still (quiescent) air for which density is described by the [International Standard Atmosphere (ISA) model](https://en.wikipedia.org/wiki/International_Standard_Atmosphere). 

## Simplified Model

The dynamics of the rocket flights can be simplified to a sum of forces. 

Simplifying the rocket flight as ideally one-dimensional, with the positive x direction being upwards from the launch pad, the impulse is equal to the thrust of the rocket minus the weight of the rocket and the drag forces of the rocket interacting with the surrounding air.

\begin{equation}
m(t)\ddot{x}(t) = T(t) - D(\dot{x}) - W(t)
\end{equation}

Mass is a function of time, which is explained in the *Dynamic Parameters* section. Drag is a function of velocity, which is explained in *Drag Model* section.
Acceleration can be expressed as the first derivative of velocity and also the second derivative of position, each with respect to time.

\begin{equation}
\vec{a} = \dot{v} = \ddot{x}
\end{equation}

Each force component can be rearranged and expressed as follows:
\begin{equation}
\vec{a}_T = \dfrac{T(t)}{m(t)}, \vec{a}_W = \dfrac{W(t)}{m(t)}, \vec{a}_D = \dfrac{D(v)}{m(t)}
\end{equation}

The net upward acceleration is: $\vec{a}_T  - \vec{a}_W - \vec{a}_D$

The sum of forces can be rearranged and acceleration can be solved for:

\begin{equation}
\vec{a} =  \ddot{x} = \dfrac{1}{m(t)} (T(t) - D(\dot{x}) - W(t)) 
\end{equation}

Acceleration can be integrated to find position and velocity.

\begin{equation}
\vec{v} = \int \vec{a} dx
\end{equation}

\begin{equation}
x = \iint \vec{a} dx
\end{equation}

Modeling in the frequency domain, integration is represented by the $\dfrac{1}{s}$ block. The model is pictured as follows. 

[vertical_model_simplified]: images/vertical_model_simplified.png "Vertical Model - Simplified" 
![Vertical Flight Model - Simplified \label{vertical_model_simplified}][vertical_model_simplified] 
