\clearpage

# Simulation Execution

## Simulation Configuration

### Historical Weather Data for Green River, Utah

The following conditions are historical data for Green River, Utah on June 25th, 2015 at 12:00PM (noon) [@forecastio].

| Date       | Elevation          | Ground Pressure | Ground Temperature      | Wind Speed         | Humidity |
| ---        | ---                | ---             | ---                     | ---                | ---      |
| 2015/06/15 | 4,078 ft (1,243 m) | 101300 Pa       | 298.15 K (25 $^\circ$C) | 6 km/h (1.6 m/s)   | 33 %     |
| 2014/06/15 | 4,078 ft (1,243 m) | 100700 Pa       | 296.15 K (23 $^\circ$C) | 20 km/h (5.56 m/s) | 8 %      |
| 2013/06/15 | 4,078 ft (1,243 m) | 101000 Pa       | 299.15 K (26 $^\circ$C) | 10 km/h (2.78 m/s) | 19 %     |

\captionof{table}{Historical Weather Conditions, Green River, Utah}

### General Conditions 

| Elevation         | Humidity | Launch Guide Length |
| ---               | ---      | ---                 |
| 4300 ft (1,311 m) | 33 %     | 5.4864 (18 ft)      |

\captionof{table}{General Simulation Conditions}

### Best Case

The best case scenario is with no wind, and a 0$^\circ$ launch angle, and the lowest air pressure.

| Wind Speed | Ground Pressure | Ground Temperature      | Launch Guide Angle |
| ---        | ---             | ---                     | ---                |
| 0 m/s      | 101000 Pa       | 298.15 K (25 $^\circ$C) | 0$^\circ$          |

\captionof{table}{Best Case Simulation Conditions}

### Worst Case

The worst case scenario, is the maximum wind condition permitted for launch by the competition, and a launch guide angle, and the highest pressure.

| Wind Speed | Ground Pressure | Ground Temperature      | Launch Guide Angle |
| ---        | ---             | ---                     | ---                |
| 8.33 m/s   | 101325 kPa      | 303.15 K (30 $^\circ$C) | 10$^\circ$         |

\captionof{table}{Worst Case Simulation Conditions}

\clearpage

## Simulation Execution

Identical rocket designs were implemented in OpenRocket, RockSim, RASAero, and our Engineering Simulator.
The 3rd party simulator results were parsed with Matlab to determine essential performance criteria and to compare with our model.

### Matlab

#### Matlab Models

[full_model_test]: images/rocket_model.png "" 
![Full Model in Simulink, angle-of- attack less than 15 degrees \label{full_model_test_label}][full_model_test] 

\clearpage

## Observations

Figure \ref{error_altitude_plot_label} shows the predicted Altitude of the rocket compared against OpenRocket, RASAero, and Rocksim.
It would appear that RASAero and Rocksim predict a higher altitude, perhaps considering their underestimation of the drag forces, shown in Figure \ref{error_dragforce_v_plot_label}.

[error_altitude_plot]: images/plots/error_altitude_plot.png "" 
![Altitude as a Function of Time \label{error_altitude_plot_label}][error_altitude_plot] 

> 2e Vehicle reaches 10,000 ft altitude (+1000 feet / - 0 feet)

\clearpage

Figure \ref{error_mach_plot_label} shows that the Mach number predicted by each software is quite close.

[error_mach_plot]: images/plots/error_mach_plot.png "" 
![Mach Number as a Function of Time \label{error_mach_plot_label}][error_mach_plot] 

> 2d Vehicle max speed mach 0.9 

\clearpage

Figure \ref{error_stability_calibers_plot_label} shows that the dynamic stability is quite similarly predicted by all tested simulators.
OpenRocket shows a continuous oscillation, which according to my current analysis of their methodology, perhaps does not correctly consider the oscillation damping encountered during flight.
In any case, if the OpenRocket model were to be 100% correct, the dynamic stability criteria would still be satisfied by a wide margin.

> 2a Static stability above 2 calibers 

> 2b Dynamic stability above 0 

[error_stability_calibers_plot]: images/plots/error_stability_calibers_plot.png "" 
![Stability (Calibers) as a Function of Time \label{error_stability_calibers_plot_label}][error_stability_calibers_plot] 

\clearpage
As seen in Figure \ref{plot_natural_frequency}, once the rocket leaves the launch pad, the angular frequency of the rigid-body oscillation does not approach the natural frequency of the rocket, confirming requirement: 

> 2f - The vehicle does not experience resonant pitching/yawing motion in flight 

In any case, we know that resonant oscillation at the natural frequency does not occur, since the rocket stabilizes. 
Figure \ref{error_stability_response} shows the stabilization of the angle-of-attack with time. 

[error_stability_response]: images/plots/error_aoa_plot.png "" 
![Angle of Attack Stabilization \label{error_stability_response}][error_stability_response] 

RockSim and RASAero are chosen for this plot since they have a more mature stability methodology.

[plot_natural_frequency]: images/plots/plot_natural_frequency.png "" 
![Natural Frequency \label{plot_natural_frequency}][plot_natural_frequency] 

\clearpage

## Simulation Summary

[simulation_summary]: images/simulation_summary.png "" 
![Simulation Summary \label{plt_simulation_summary}][simulation_summary] 

\clearpage
