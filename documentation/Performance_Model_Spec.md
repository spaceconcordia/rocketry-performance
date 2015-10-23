# Performance Model Specification

## Overview 
The goal of this project is to create a Performance Model in Matlab to simulate the rocket flight characteristics.

Specifically the model should verify the maximum altitude and velocity. Further developments are explored for future enhancement. A modular development pattern will be followed order to support expansion. Unit testing of simulator logic will be undertaken in all reasonable places, and validation will be provided by testing the overall model against 3rd party flight data where available.

The model must take as input the current structural design parameters, thrust information, and simulated ambient conditions of the launch environment. Certain parameters will be dynamic; as the motor expends fuel, the position of the center of gravity and center of pressure will shift with decreasing mass. Additionally the moments of inertia will be altered. These dynamic parameters must be considered to maximize the accuracy of the model[^fn].

[^fn]: Here is a footnote

## Requirements

- the Performance Model must provide the maximum altitude and velocity of a axis-symmetric cylindrical body rocket in subsonic flight under a known thrust curve considering known dimensional parameters and assumptions considered legitimate based on prior research for similar applications.

## Validation

- Sub-Models will be unit tested with 3rd party data to ensure functional validity where possible.
    - e.g. the drag model (and all additional submodules therein) shall be tested against simple reference geometry to provide known drag coefficient and force.
- Once all Sub-Models are validated individually, the overall model will be validated using 3rd-party data.
    - Primary 3rd-party data source will be OpenRocket simulations.
    - Where possible, actual rocket flight data will be used to validate the model.

## Vertical (AOA < 5$^\circ$) Flight Model

### Assumptions

- subsonic flight
- axis-symmetric rigid body rocket
- single cylindrical body 
- ~~conical, ogive, or parabolic~~ Von Karman nose shape
- three or four trapezoidal fins 
- passively controlled (no active thrust or stability control)
- constant fuel expenditure rate
- vertical/linear flight within 5 degrees

[@box2009] 
