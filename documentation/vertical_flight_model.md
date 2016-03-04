# Vertical (AOA < 5$^\circ$) Flight Model

## Particular Assumptions

The rocket is to be launched on a guide that may have a $\pm$ 5$^\circ$ angle. 
Considering the small angle approximation, the sine of 5 degrees or less is approximately equal to the angle in radians, or zero.

For a 1% error:
\begin{equation} 
sin ( \theta \le 15^\circ ) \approx 0 
\end{equation}

[@optics2004]

This assumption greatly simplifies the simulation analysis. We consider that the rocket flies perfectly vertical (experiencing no significant drift) into still (quiescent) air for which density is described by the [International Standard Atmosphere (ISA) model](https://en.wikipedia.org/wiki/International_Standard_Atmosphere). 

## Simplified Model

The dynamics of the rocket flights can be simplified to a sum of forces. 

Simplifying the rocket flight as ideally one-dimensional, with the positive z-direction being upwards from the launch pad, the impulse is equal to the thrust of the rocket minus the weight of the rocket and the drag forces of the rocket interacting with the surrounding air.

\begin{equation}
\label{eq_vertical_flight_eom}
m(t)\ddot{z}(t) = T(t) - D(\dot{z}) - W(t)
\end{equation}

Mass is a function of time, which is explained in the *Dynamic Parameters* section. Drag is a function of velocity, which is explained in *Drag Model* section.
Acceleration can be expressed as the first derivative of velocity and also the second derivative of position, each with respect to time.

\begin{equation}
\vec{a} = \dot{v} = \ddot{z}
\end{equation}

Each force component can be rearranged and expressed as follows:
\begin{equation}
\vec{a}_T = \dfrac{T(t)}{m(t)}, \vec{a}_W = \dfrac{W(t)}{m(t)}, \vec{a}_D = \dfrac{D(v)}{m(t)}
\end{equation}

The net upward acceleration is: $\vec{a}_T  - \vec{a}_W - \vec{a}_D$

The sum of forces can be rearranged and acceleration can be solved for:

\begin{equation}
\label{vertical_flight_equation}
\vec{a} =  \ddot{z} = \dfrac{1}{m(t)} (T(t) - D(\dot{z}) - W(t)) 
\end{equation}

Acceleration can be integrated to find position and velocity.

\begin{equation}
\vec{v} = \int \vec{a} dz
\end{equation}

\begin{equation}
z = \iint \vec{a} dz
\end{equation}

Integration of equation (\ref{vertical_flight_equation}) in the model is represented by the $\dfrac{1}{s}$ block. The model is pictured in Figure \ref{vertical_model_simplified}.

[vertical_model_simplified]: images/vertical_model_simplified.png "Vertical Model - Simplified" 
![Vertical Flight Model - Simplified \label{vertical_model_simplified}][vertical_model_simplified] 

## Drift due to Weathercocking

*Weathercocking* is a phenomenon when the rocket tends to alter its trajectory and fly into the wind. Depending on the damping, the rocket eventually reaches a zero angle-of-attack parallel to the velocity vector of the wind, only in the opposite direction.

We can modify Equation \ref{eq_vertical_flight_eom} to account for weathercocking and provide the actual altitude reached, as well as the amount of drift experienced.

Altitude accounting for weathercocking

\begin{equation}
\label{eq_vertical_angle}
m(t)_z\ddot{z}(t) = T(t) \cos \theta - D(\dot{z}) \cos \theta - W(t)
\end{equation}

Where:
- $z$ is the upward direction (normal from the ground)
- $\theta$ is the angle between the current rocket trajectory and the z-axis

Drift accounting for weathercocking

\begin{equation}
\label{eq_vertical_angle}
m(t)_x \ddot{z}(t) = T(t) \sin \theta - D(\dot{z}) \sin \theta 
\end{equation}
