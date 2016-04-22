# Point-Mass Flight Model

The analysis of the point-mass flight model can be simplified to a sum of forces. 

Simplifying the rocket flight as ideally one-dimensional, with the positive z-direction being upwards from the launch pad, the impulse is equal to the thrust of the rocket minus the weight of the rocket and the drag forces of the rocket interacting with the surrounding air.

\begin{equation}
\label{eq_vertical_flight_eom}
m(t)\ddot{z}(t) = T(t) - D(\dot{z}) - W(t)
\end{equation}

[@mandell1973]

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

[@mandell1973]

Acceleration can be integrated to find position and velocity.

\begin{equation}
\vec{v} = \int \vec{a} dz
\end{equation}

\begin{equation}
z = \iint \vec{a} dz
\end{equation}

[@mandell1973]

Integration of equation (\ref{vertical_flight_equation}) in the model is represented by the $\dfrac{1}{s}$ block. The model is pictured in Figure \ref{vertical_model_simplified}.

[vertical_model_simplified]: images/vertical_model_simplified.png "Vertical Model - Simplified" 
![Vertical Flight Model - Simplified \label{vertical_model_simplified}][vertical_model_simplified] 

## Weathercocking

*Weathercocking* is a phenomenon when the rocket tends to alter its trajectory and fly into the wind. 
If the rocket is stable, and has a sufficiently high damping ratio, the rocket eventually reaches a near-zero angle-of-attack parallel to the velocity vector of the wind, only in the opposite direction.

If we apply a wind velocity in the drag calculation, we can then modify Equation \ref{eq_vertical_flight_eom} to account for weathercocking and provide the actual altitude reached, as well as the amount of drift experienced.

## Altitude accounting for flight angle

\begin{equation}
\label{eq_vertical_angle}
m(t)\ddot{z}(t) = T(t) \cos \theta - D(\dot{z}) \cos \theta - W(t)
\end{equation}

[@mandell1973]

Where:

- $z$ is the upward direction (normal from the ground)
- $\theta$ is the angle between the current rocket trajectory and the z-axis

## Drift accounting for flight angle

\begin{equation}
\label{eq_vertical_angle}
m(t) \ddot{z}(t) = T(t) \sin \theta - D(\dot{z}) \sin \theta 
\end{equation}

[@mandell1973]
