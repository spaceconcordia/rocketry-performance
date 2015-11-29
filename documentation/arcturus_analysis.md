# Arcturus Analysis

## Competition Results

### Analysis on 2015/07/23
- custom avionics registered altitude of 15,000 ft
- commercial avionics registered altitude of 12,700 ft
- using most accurate simulation data available:
    - rocket could not have exceeded 11,000 ft
    - when avionics were tested in smaller rocket, they returned accurate values

### Analysis on 2015/07/28
- analysis of the StrattoLogger Data shows that the temperature inside the avionics bay did not decrease as expected, throwing off the sound speed calculations 
- reviewing the 'hyposometric' formula being used (think it should read 'hypsometric')

#### Theories
- ~~latent heat and pressure built up in avionics bay while on launch pad in hot desert environment~~
    - we now suspect that the air is being vented and that there is not a build up of pressure in the avionics bay
- we rather suspect that the rocket structure is heating up the air inside, causing the false readings
- it seems possible that there are issues with the 'hyposometric' formula
- Robert Winchcomb suggested that a power fluctuation could be the cause of the anomalous bump in the velocity data
 
#### Action Taken
- beginning to plot the data to help confirm our suspicions 
- may need to consider thermal control aspects to solve this problem

\clearpage

## Altitude Determination

## Resources
- it seems the previous team used the following resource to determine altitude
 - [Arduino Forum Post 261589](http://forum.arduino.cc/index.php?topic=261589.0)
- [Meterology Glossary - Hypsometric Equation](http://glossary.ametsoc.org/wiki/Hypsometric_equation)
 
## Deriving the correct hypsometric equation

$$ P_{actual} = (P_o + P_{dev}) * \left[(1-0.0065* \left( \dfrac{ altitude } { T_o + T_{dev} } \right) \right]^{5.2561} $$ 

$$ \dfrac{P_{actual}}{ (P_o + P_{dev})  } = \left[(1-0.0065* \left( \dfrac{ altitude } { T_o + T_{dev} } \right) \right]^{5.2561} $$ 

$$ 
\left( \dfrac{ P_{actual} }{ (P_o + P_{dev}) } \right)^{( 1/5.2561 )} 
= 
1-0.0065 \cdot \left( \dfrac{ altitude } { T_o + T_{dev} } \right) 
$$ 

$$ 
1 - \left( \dfrac{ P_{actual} }{ (P_o + P_{dev}) } \right)^{( 1/5.2561 )} 
= 
0.0065 \cdot \left( \dfrac{ altitude } { T_o + T_{dev} } \right) 
$$ 

$$ 
\dfrac{ \left( T_o + T_{dev} \right) \left( 1 - \left( \dfrac{ P_{actual} }{ (P_o + P_{dev}) } \right)^{( 1/5.2561 )} \right) } { \left( 0.0065 \right) }
= 
altitude 
$$ 

\begin{equation}
\label{eq_hyposometric_altitude}
altitude=
\dfrac{ \left( T_o + T_{dev} \right) \left( 1 - \left( \dfrac{ P_{actual} }{ (P_o + P_{dev}) } \right)^{( 1/5.2561 )} \right) } { \left( 0.0065 \right) }
\end{equation}

Equation (\ref{eq_hyposometric_altitude}) above seems equivalent to the form used in avionics code (Equation (\ref{eq_hyposometric_altitude_avionics}) below)

\begin{equation}
\label{eq_hyposometric_altitude_avionics}
altitude =
\dfrac{ \left( T_o + T_{dev} \right) \left( \left( \dfrac{ (P_o + P_{dev}) }{ P_{actual} } \right)^{( 1/5.2561 )}  - 1 \right) } { \left( 0.0065 \right) }
\end{equation} 

### Temperature Correction

\begin{equation}
\label{eq_temperature_correction}
Correction = 
H 
\times 
\left( 
\dfrac
{15 - t_0}
{273 + t_0 - 0.5 \cdot L_0 (H+H_0)}
\right)
\end{equation}

Where:

- $H$ is the minimum height above the altimeter source
- $t_0 = t_{aerodrome} + L_0 \cdot h_{aerodrome}$
    - specified temperature reporting point adjusted to sea level
- $L_0 = 0.0065 ^{\circ}C/m$ 
- $H_0$ is the altimeter setting source elevation

[@code7700]

\clearpage

## Analysis

### Custom Avionics Accelerometer Data

In Figure \ref{arcturus_accelerometer_plot_label} below, the accelerometer data is plotted. 
The Longitudinal and Vertical axis is the X-axis. 
Unfortunately the sensor was not calibrated correctly, and the force curve is clipped at 2 Gs. 
We expect that the rocket experienced up to 10 or 11 Gs.
If we were able to capture the entire force curve, we could infer the drag force experienced by the rocket to compare with our simulation results.

[arcturus_accelerometer_plot]: images/plots/arcturus_accelerometer_plot.png "" 
![X, Y, and Z acceleration a Function of Time \label{arcturus_accelerometer_plot_label}][arcturus_accelerometer_plot] 

Figure \ref{arcturus_accelerometer_apogee_plot_label} below shows the longitudinal acceleration during the approach to apogee.
We can see the peak in force along the X-axis, with a sudden step down to roughly negative 17 $m/s^2$, as the drag force coupled with the force of gravity steeply 
decelerates the rocket. 

This negative region can be used to analyze a segment of the flight curve approaching apogee.

[arcturus_accelerometer_apogee_plot]: images/plots/arcturus_accelerometer_apogee_plot.png "" 
![Longitudinal Acceleration as a Function of Time \label{arcturus_accelerometer_apogee_plot_label}][arcturus_accelerometer_apogee_plot] 

\clearpage

### Custom Avionics Barometric Sensor Data

[arcturus_pressure_plot]: images/plots/arcturus_pressure_plot.png "" 
![Pressure, Temperature, Altitude as a function of time \label{arcturus_pressure_plot_label}][arcturus_pressure_plot] 

\clearpage

Figure \ref{arcturus_strattologger_plot_label} below shows the data acquired from the Commercial Stratologger altimeter provided by *Perfect Flight*.
Velocity and acceleration data is apparently derived from the altitude as a function of time [ApogeeRockets Link](https://www.apogeerockets.com/Electronics_Payloads/Altimeters/PerfectFlite_StratoLogger_Altimeter)

### Commercial Stratologger Data
[arcturus_strattologger_plot]: images/plots/arcturus_strattologger_plot.png "" 
![Altitude, Velocity, Acceleration, and Mach Number as a function of time \label{arcturus_strattologger_plot_label}][arcturus_strattologger_plot] 

\clearpage

### OpenRocket Simulation Data

NOTE: this is actually the *Aurelius* simulation data. 
*Arcturus* data was not playing nice with Matlab at the time of this report.

[arcturus_openrocket_plot]: images/plots/arcturus_openrocket_plot.png "" 
![Altitude, Acceleration, and Mach Number as a function of time \label{arcturus_openrocket_plot_label}][arcturus_openrocket_plot] 


\clearpage
