# Performance Model Specification

## Overview 
The goal of this project is to create a Performance Model in Matlab in order to input current structural design parameters and simulate flight characteristics in order to optimize the rocket in meeting the mission requirements.

Specifically the model should verify the maximum altitude and velocity. Further developments are explored for future enhancement. The model will be developed in a modular fashion in order to support future expansion. 

## General Assumptions
- subsonic flight
- not real-time
- axis-symmetric rigid body rocket
- single cylindrical body [Box et. al]
- conical, ogive, or parabolic nose shape [Box et. al]
- three or four trapezoidal fins [Box et. al]
- passively controlled (no active thrust or stability control)
 
## Vertical (AOA < 5$^\circ$) Flight Model

### Notes
 - remove dependency on OpenRocket for weight

### Assumptions
- vertical/linear flight within 5 degrees

### Input

#### Dynamic Parameters
    - thrust (see thrust curve)
    - mass (changes with fuel expenditure)
    - center of mass (changes with fuel expenditure)
    - moments of inertia (changes with fuel expenditure)
    - thrust damping 

#### Aerodynamic Parameters

##### Force Components

##### Barrowman Coefficients

##### Rocket Body Lift Correction

- Design parameters
- Environmental assumptions

### Execution
- Flight Dynamics
    - acceleration
    - dynamic pressure

### Output
- Kinematics 
    - velocity
    - maximum altitude

### Performance Metrics
- stability (all moments of flight)
- launcher angle

## Questions
- feasible to place rocket in a wind tunnel to experimentally determine drag coefficient?
- ask Emily to provide moment of inertia for each rocket section individually


## Resources
[Thrust Curves]:(http://www.thrustcurve.org/simfilesearch.jsp?id=1591)
[Datcom]:(http://www.holycows.net/datcom/)
[United States Air Force Stability and Control Datcom Method]:(http://oai.dtic.mil/oai/oai?verb=getRecord&metadataPrefix=html&identifier=ADB072483)
