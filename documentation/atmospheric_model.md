## Atmospheric Model

The *International Standard Atmosphere* model is assumed to describe the pressure, temperature, density and viscosity conditions of the surrounding air during launch.

[@cavcarISA]

### Viscosity 

Previously, in-house simulations were conducted using the *velocity_model* created by Alex Botros. Of interest to this report, is the method by which the viscosity of the working fluid was calculated. It will include a review of the previous methods use and it will introduce *Sutherland's law*. As well, both methods will be compared and changes to the existing model will be proposed.

### Previous Work

In the *velocity_model* the absolute viscosity was never actually calculated. Instead, the kinematic viscosity was calculated (as shown below) as part of the function to solve for the *Reynolds Number* of the vehicle.

\begin{equation}
\label{kinematic_viscosity_f_T}
\nu = (-1 E -14) T^3 + (1 E -10) T^2 + (3 E -8) T - (3 E -6)
\end{equation}

As can be clearly seen, the kinematic viscosity was estimated based on the temperature T. It is assumed that the temperature is in Kelvin. When the function shown here is plotted, it creates the following result.


