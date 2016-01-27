# Simulation Execution

## Simulation Configuration

### Historical Weather Data for Green River, Utah

| Date       | Elevation          | Ground Pressure | Ground Temperature      | Wind Speed         | Humidity |
| ---        | ---                | ---             | ---                     | ---                | ---      |
| 2015/06/15 | 4,078 ft (1,243 m) | 101300 Pa       | 298.15 K (25 $^\circ$C) | 6 km/h (1.6 m/s)   | 33 %     |
| 2014/06/15 | 4,078 ft (1,243 m) | 100700 Pa       | 296.15 K (23 $^\circ$C) | 20 km/h (5.56 m/s) | 8 %      |
| 2013/06/15 | 4,078 ft (1,243 m) | 101000 Pa       | 299.15 K (26 $^\circ$C) | 10 km/h (2.78 m/s) | 19 %     |

\captionof{table}{Historical Weather Conditions, Green River, Utah}

### General Conditions 

For all tests, the following conditions were used, based on historical data for June 25th, 2015 at 12:00PM (noon) near Green River, Utah [@forecastio].

| Elevation                        | Humidity | Launch Guide Length |
| ---                              | ---      | ---                 |
| 4,078 ft (1,243 m) [@greenriver] | 33 %     | 5.4864 (18 ft)      |

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
| 8.33 m/s   | 101325 kPa      | 288.15 K (15 $^\circ$C) | 10$^\circ$         |

\captionof{table}{Worst Case Simulation Conditions}

\clearpage

## Simulation Software

The following models were executed.

### OpenRocket

### RockSim

### RASAero

\clearpage

### Matlab

#### Matlab Models

[vertical_model_test]: images/vertical_model.png "" 
![Vertical Model in Simulink, angle of attack less than 5 degrees \label{vertical_model_test_label}][vertical_model_test] 

[full_model_test]: images/rocket_model.png "" 
![Full Model in Simulink, angle of attack less than 15 degrees \label{full_model_test_label}][full_model_test] 

\clearpage

## Summary

### Best Case

| Software | Case | Velocity leaving launch rail | Max Acc. | Max Vel. | Max. Alt. | Time to apogee |
| ---      | ---  | ---                          | ---      | ---      | ---       | ---            |

### Worst Case

| Software | Case | Velocity leaving launch rail | Max Acc. | Max Vel. | Max. Alt. | Time to apogee |
| ---      | ---  | ---                          | ---      | ---      | ---       | ---            |

## Observations

\clearpage

## Primary Plots

[error_altitude_plot]: images/plots/error_altitude_plot.png "" 
![Altitude as a Function of Time \label{error_altitude_plot_label}][error_altitude_plot] 

[error_mach_plot]: images/plots/error_mach_plot.png "" 
![Mach Number as a Function of Time \label{error_mach_plot_label}][error_mach_plot] 

[error_dragcoef_plot]: images/plots/error_dragcoef_v_mach_plot.png "" 
![Drag Coefficient as a Function of Mach Number \label{error_dragcoef_v_plot_label}][error_dragcoef_plot] 

[error_dragforce_plot]: images/plots/error_dragforce_plot.png "" 
![Drag Force as a Function of Mach Number \label{error_dragforce_v_plot_label}][error_dragforce_plot] 

[error_stability_calibers_plot]: images/plots/error_stability_calibers_plot.png "" 
![Stability (Calibers) as a Function of Time \label{error_stability_calibers_plot_label}][error_stability_calibers_plot] 

\clearpage

### Additional Plots

[dynamics_plot]: images/plots/dynamics_plot.png "" 
![Mass, Weight, and Thrust as a Function of Time \label{dynamics_plot_label}][dynamics_plot] 

[kinematics_plot]: images/plots/kinematics_plot.png "" 
![Altitude, Velocity, and Acceleration as a Function of Time \label{kinematics_plot_label}][kinematics_plot] 

[drag_v_velocity_plot]: images/plots/drag_v_velocity_plot.png "" 
![Drag Force, Drag Coefficient, and Reynolds Number as a Function of Velocity \label{drag_v_velocity_plot_label}][drag_v_velocity_plot] 

[drag_v_mach_plot]: images/plots/drag_v_mach.png "" 
![Drag Force, Drag Coefficient, and Reynolds Number as a Function of Mach Number \label{drag_v_mach_plot_label}][drag_v_mach_plot] 

[drag_plot]: images/plots/drag_plot.png "" 
![Altitude, Velocity, and Acceleration as a Function of Time \label{drag_plot_label}][drag_plot] 

[drag_coefs_plot]: images/plots/drag_coefficients.png "" 
![Specific Drag Coefficients as a Function of Time \label{drag_coefs_plot_label}][drag_coefs_plot] 

[atmosphere_plot]: images/plots/atmosphere_plot.png "" 
![Altitude, Velocity, and Acceleration as a Function of Time \label{atmosphere_plot_label}][atmosphere_plot] 


\clearpage
