# Performance Model Specification

## Overview 
The goal of this project is to create a Performance Model in Matlab to simulate the rocket flight characteristics.

Specifically the model should verify the maximum altitude and velocity. Further developments are explored for future enhancement. A modular development pattern will be followed order to support expansion. Unit testing of simulator logic will be undertaken in all reasonable places, and validation will be provided by testing the overall model against 3rd party flight data where available.

The model must take as input the current structural design parameters, thrust information, and simulated ambient conditions of the launch environment. Certain parameters will be dynamic; as the motor expends fuel, the position of the center of gravity and center of pressure will shift with decreasing mass. Additionally the moments of inertia will be altered. These dynamic parameters must be considered to maximize the accuracy of the model.

## General Assumptions

- subsonic flight
- not real-time
- axis-symmetric rigid body rocket
- single cylindrical body [Box et. al]
- conical, ogive, or parabolic nose shape [Box et. al]
- three or four trapezoidal fins [Box et. al]
- passively controlled (no active thrust or stability control)
- constant fuel expenditure rate

## Vertical (AOA < 5$^\circ$) Flight Model

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
