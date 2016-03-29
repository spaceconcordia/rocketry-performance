# Comparison with Experimental Data

So far, much of the analysis has relied on theory and comparison with other simulator output.
It is important to compare our models with real data to provide the best measure of their accuracy.
Without access to a wind tunnel, we determined that we could test our *ISA Model* implementation against weather balloon data, and the final flight performance with actual rocket launches where data is available. 

## ISA Model

Our ISA Model was compared to weather balloon data taken as close as possible to the launch site.
The sites chosen were Salt Lake City, Utah (SLC) and Tuscon, Arizona (TUS), and data was provided by University of Wyoming Department of Atmospheric Science [@uwyoming].

[atmosphere_plot_1]: images/plots/SLC_plot.png "" 
![Comparison of ISA Model with SLC Weather Balloon Data \label{atmosphere1_plot_label}][atmosphere_plot_1] 

[atmosphere_plot_2]: images/plots/TUS_plot.png "" 
![Comparison of ISA Model with TUS Weather Balloon Data \label{atmosphere2_plot_label}][atmosphere_plot_2] 

The figures show an extremely close alignment with real conditions, both falling below 1% error

## Flight Validation

### University of Louisville

The University of Louisville was kind enough to share experimental rocket flight data, as well as their rocket dimensions so that our simulation could be compared to real-world experimental data.

## Flight Details

March 29, 2015

| Date       | Elevation         | Ground Temperature         | Wind Speed         | Humidity | Launch Guide Length |
| ---        | ---               | ---                        | ---                | ---      | ---                 |
| 2015/03/29 | 405 ft (123,48 m) | 289.26 K (61.00 $^\circ$F) | 14 km/h (3.89 m/s) | ~39 %    | 3.05 m              |
| 2015/03/29 | 432 ft (131.71 m) | 287.71 K (58.21 $^\circ$F) | 14 km/h (3.89 m/s) | ~39 %    | 3.05 m              |
| 2015/03/29 | 410 ft (125.00 m) | 294.70 K (70.79 $^\circ$F) | 14 km/h (3.89 m/s) | ~39 %    | 3.05 m              |
| 2015/03/29 | 417 ft (127.13 m) | 289.44 K (61.32 $^\circ$F) | 14 km/h (3.89 m/s) | ~39 %    | 3.05 m              |
| 2015/03/29 | 446 ft (135.97 m) | 289.54 K (61.50 $^\circ$F) | 14 km/h (3.89 m/s) | ~39 %    | 3.05 m              |

\clearpage

## Motor Details

Cesaroni L935

| Parameter         | Value                            |
| ---               | ---                              |
| Manufacturer:     | Cesaroni Technology              |
| Entered:          | Oct 6, 2009                      |
| Last Updated:     | Jun 26, 2014                     |
| Mfr. Designation: | 3147L935-P                       |
| Common Name:      | L935                             |
| Motor Type:       | reload                           |
| Diameter:         | 54.0mm                           |
| Length:           | 64.9cm                           |
| Total Weight:     | 2542g                            |
| Prop. Weight:     | 1567g                            |
| Cert. Org.:       | Canadian Association of Rocketry |
| Cert. Date:       | Aug 27, 2009                     |
| Average Thrust:   | 933.8N                           |
| Maximum Thrust:   | 1585.6N                          |
| Total impulse:    | 3146.8Ns                         |
| Burn Time:        | 3.4s                             |
| Isp:              | 205s                             |
| Case Info:        | Pro54-6GXL                       |
| Propellant Info:  | Imax                             |
| Data Sheet:       | link                             |
| Availability:     | regularCesaroni L935             |

\clearpage

## Plots

[experimental_comparison_altitude]: images/plots/plot_louisville_altitude_analysis.png "" 
![Altitude Plot of Simulation Data vs Louisville Rocket Launches \label{experimental_comparison_altitude_label}][experimental_comparison_altitude] 

[experimental_comparison_velocity]: images/plots/plot_louisville_velocity_analysis.png "" 
![Velocity Plot of Simulation Data vs Louisville Rocket Launches \label{experimental_comparison_velocity_label}][experimental_comparison_velocity] 

\clearpage 

### Comparison with Arcturus Rocket

The rocket flown at last years competition was also modeled. As shown in Figures \ref{arc_experimental_comparison_altitude_label} and \ref{arc_experimental_comparison_velocity_label}, a high degree of accuracy with the avionics data is further confirmed.

[arc_experimental_comparison_altitude]: images/plots/plot_arcturus_altitude_analysis.png "" 
![Altitude Plot of Simulation Data vs Arcturus Rocket Launch \label{arc_experimental_comparison_altitude_label}][arc_experimental_comparison_altitude] 

[arc_experimental_comparison_velocity]: images/plots/plot_arcturus_velocity_analysis.png "" 
![Velocity Plot of Simulation Data vs Arcturus Rocket Launch \label{arc_experimental_comparison_velocity_label}][arc_experimental_comparison_velocity] 

## Summary of Comparison with Experimental Data

| Data Source                                   | Parameter Tested       | % Error |
| ---                                           | ---                    | ---     |
| Weather Balloon Data (Salt Lake City, UT)     | Pressure with Altitude | < 1%    |
| Weather Balloon Data (Tuscon, AZ)             | Pressure with Altitude | < 1%    |
| University Of Louisville (avg. of 5 Launches) | Altitude               | 1%      |
| University Of Louisville (avg. of 5 Launches) | Velocity               | 9%      |
| Arcturus Flight Launch                        | Altitude               | 3%      |
| Arcturus Flight Launch                        | Velocity               | 1%      |

\captionof{table}{Summary of Comparison with Experimental Data}
