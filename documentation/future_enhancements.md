# Future Enhancements

## Hardware-in-the-loop

## Porting to Python / OpenModelica

## Plotting with Plot.ly

## Robust Wind Model

To account for wind turbulence in future models, two commonly used Wind Models are explored.

#### Kaimal Wind Model

\begin{equation}
\label{eq_kaiman_wind_model}
\dfrac{S_u (f)}{\sigma ^2 _ u} = \dfrac{4 L_{1u} / U }{(1+6f L_{1u} / U )^{5/3}}
\end{equation}

#### Von Karman Wind Model

\begin{equation}
\label{eq_von_karman_wind_model}
\dfrac{S_u (f)}{\sigma ^2 _ u} = \dfrac{4 L_{2u} / U }{(1+ 70.8 (fL_{2u} / U)^2 )^{5/3}}
\end{equation}

Where 

- $\dfrac{S_u (f)}{\sigma ^2 _ u}$ is the *Spectral Density Function* of turbulence velocity
- $f$ is the turbulence frequency
- $\sigma_u$ is the standard deviation fo the turbulence velocity
- $L_{1u}$ and $L_{2u}$ are length parameters
- *U* is the average wind speed

[@niskanen2013, pg. 59]


## ThrustCurve.org API Integration

ThrustCurve.org has an API we could use to dynamically pull motor data for integration into the simulation

[ThrustCurve.org API]:(http://www.thrustcurve.org/searchapi.shtml)
