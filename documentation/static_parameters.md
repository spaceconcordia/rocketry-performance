## Static Parameters

The following tabulated parameters are considered to remain constant during flight

The following table lists all input parameters to the system
TODO export the parametric spreadsheet

\captionof{table}{Input Parameters}

| Parameter                   | Units | Status  | Source |
| ---                         | ---   | ---     | ---    |
| area_fin_frontal            | m^2   | Static  | CATIA  |
| area_face_fin               | m^2   | Static  | CATIA  |
| width_fins_at_tube          | m     | Static  | CATIA  |
| fins_count                  | N/A   | Static  | CATIA  |
| thickness_fins_at_tube      | m     | Static  | CATIA  |
| area_surface_nose           | m^2   | Static  | CATIA  |
| height_fins                 | m     | Static  | CATIA  |
| diameter_outer              | m     | Static  | CATIA  |
| surface_roughness           | m     | Static  | CATIA  |
| length_total_rocket         | m     | Static  | CATIA  |
| pressure_ambient_ground     | Pa    | Static  | Manual |
| temperature_ambient_ground  | C     | Static  | Manual |
| distance_tip_to_COG         | m     | Dynamic | CATIA  |
| distance_tip_to_COP         | m     | Dynamic | Manual |
| diameter_outer_launch_guide | m     | Static  | CATIA  |
| diameter_inner_launch_guide | m     | Static  | CATIA  |
| moment_inertia_rocket       | m^4   | Dynamic | CATIA  |

TODO expand 

These parameters are written in the parametric spreadsheet shared with the design team.
The CAD software populates values related to the structural design, and others are entered manually. The performance model reads them at the beginning of execution to simulate the latest design iteration.
