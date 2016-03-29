# Atmospheric Model

## Introduction

The *International Standard Atmosphere* model is assumed to describe the pressure, temperature, density and viscosity conditions of the surrounding air during launch.

The International Standard Atmosphere (ISA) model was established to give scientists and engineers an easy way to find the conditions at a certain altitude in the air given the conditions at ground level. The ISA model is extremely useful in aerospace applications and, while it does not take into account the small changes which usually occur in the atmosphere or any wind, it is considered to be reasonably accurate.

## Methodology

The model is created to output atmospheric density and the absolute and kinematic viscosities of the working fluid. To calculate these values, the model requires the launch temperature, launch pressure, the current altitude of the vehicle (a dynamic value over the course of the simulation) and the altitude of the launch site . For instance, the launch conditions for the Arcturus (IREC 2015) were 40 degrees Celsius, 99 $KPa$ and 4300 feet. Of course, these inputs have the incorrect units. Temperature must be in Kelvin, pressure must be in Pascals and the altitude of the rocket must be in meters [@cavcarISA].

As well, when using the ISA model, initial ISA conditions of the model must also be defined. This includes the initial pressure (101325 Pascals), initial temperature (288.15 Kelvin or 15 degrees Celsius) and the gas constant. The ISA model uses these initial conditions to calculate the conditions at altitude assuming that the temperature varies linearly up until the Tropopause [@cavcarISA].

In terms of altitude, the model calculates the ISA deviations from an imaginary sea-level point. These deviations are the first values that are calculated in the simulation and are necessary to obtain correct values for density and viscosity at any altitude. The general equations that were used to find the deviations from standard ISA conditions are as follows:

\begin{equation}
T_{dev} = T_{in} - T_0 + 6.5 \times \dfrac{ alt_{in} }{ 1000 }
\end{equation}

Where $T_{dev}$ is the deviation temperature in Kelvin, $T_{in}$ is the input temperature at the launch site in Kelvin, $T_0$ is the ISA standard temperature at sea level in Kelvin and $alt_{in}$ is the launch site altitude in meters. For pressure:

\begin{equation}
P_{dev} = \left( \dfrac{P_{in}}{ \left( 1-0.0065 \times \dfrac{alt_{in}}{T_0+T_{dev}} \right)^{5.2561} }  \right) - P_0
\end{equation}

Where $P_{dev}$ is the deviation pressure in Pascals, $P_{in}$ is the input pressure in Pascals and $P_0$ is  the ISA standard pressure in Pascals [@cavcarISA].
After having found the initial conditions, the conditions at the altitude at which the rocket is travelling need to be found. The first step to finding the essential properties of the working fluid is to first find the temperature and pressure at the rocket’s current altitude. These calculations are executed assuming that the position in the simulation always starts at zero and that the launch site altitude is only taken into account in this script [@cavcarISA].

The temperature modeling equation is as follows

\begin{equation}
T_{act} = T_0 + T_{dev} - 6.5 \times \dfrac{alt_{in} + alt_{act}}{1000}
\end{equation}

Where $T_{act}$ is the actual temperature Kelvin at the rocket's current altitude and $alt_{act}$ is the current altitude of the rocket in meters. The pressure modelling equation is as follows:

\begin{equation}
P_{act} = \left( \left(P_0+P_{dev} \right) \cdot \left( 1-0.0065 \times \dfrac{alt_{in}+alt_{act}}{T_0+T_{dev}} \right)^{5.2561}   \right) - P_0
\end{equation}

Where $P_{act}$ is the pressure in Pascals at the rocket's current altitude [@cavcarISA].
After having executed these calculations, the next thing that needs to be calculated are the essential properties of the working fluid. This means the pressure and dynamic and kinematic viscosities of the working fluid. The calculate the density, the following equation is used:

\begin{equation}
\rho = \dfrac{P_{act}} {RT_{act}}
\end{equation}

Where $\rho$ is the atmospheric density in $Kg/m^3$, and $R$ is the specific gas constant for air at regular temperatures, which is equal to 287.058 $J/Kg-K$. 

After calculating the density, the absolute viscosity is calculated using Sutherland's law. The expression is as follows:

\begin{equation}
\mu = \mu_{S0} \left( \dfrac{T_{act}}{T_{S0}}  \right)^{3/2} \dfrac{T_{S0}+S}{T_{act}+S}
\end{equation}

Where $\mu$ is the absolute viscosity in $Kg/m-s$, $\mu_{S0}$ is the reference viscosity, equal to $1.716 \times 10^{-5} Kg/m-s$, $T_{S0}$ is the reference temperature, equal to 271.11 $K$ and $S$ is the Sutherland constant, equal to 110.56 $K$. The constants are only applicable to air at regular temperatures and pressures. They will lose accuracy at extremely low or high temperatures and at very high or low pressures [@fluentinc].
	After having calculated the absolute viscosity, the kinematic viscosity is found using the following relationship:

\begin{equation}
\eta = \dfrac{\mu}{\rho}
\end{equation}

