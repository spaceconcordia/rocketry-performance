## Project 2 - Angular Flight Stability (Pitch, Yaw) Analysis

### Overview
- non-linear model (stability analysis)
 - finding lift will be annoying

> "One of the first principles any rocket designer must learn is that a rocket will fly only if the center of gravity is ahead of the center of pressure far enough to allow the air currents to cause a stabilizing effect."

http://www.nar.org/NARTS/TR13.html

### Out-of-scope

- range (drift)
- roll

### Requirement

- 2a - The static stability margin falls above 2 (but less than 3) calibers at launch
- 2b - The dynamic stability is greater tha n0 even in winds up to 8.33 m/s
- 2f - The vehicle does not experience resonant pitching/yawing motion in flight

### Validation

- 2a  
- 2b
- 2c

### Longitudinal Static Stability Margin

The *Longitudinal Static Stability Margin* ($S_{lm}$) is the distance between the *Center of Gravity* and the *Center of Pressure* divided by the outer diameter of the body tube.

$$ S_{lm} = \dfrac{COP - COG}{OD} $$

The result is dimensionless, however the ratio determined is measured as *calibers*. 

https://www.apogeerockets.com/education/downloads/Newsletter133.pdf

### Wind Impulse

Wind can be approximated as an impulse in the model [source?]

