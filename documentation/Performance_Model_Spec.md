# Engineering Simulator for Rocket Flight Analysis

## Overview 
The goal of this project is to create an Engineering Simulator for Rocket Flight Analysis in Matlab to model the rocket flight characteristics of the CR-2_4G Rocket.

Specifically the model should verify the maximum altitude and velocity.
Further developments are explored for future enhancement. 
A modular development pattern will be followed order to support future expansion. 
Unit testing of simulator logic will be undertaken where reasonable, and further validation will be provided by testing the overall model against 3rd party flight data where available.

The model must take as input the current structural design parameters, thrust information, and simulated ambient conditions of the launch environment.
Certain parameters will be dynamic; as the motor expends fuel, the position of the center of gravity and center of pressure will shift with decreasing mass. 
Additionally the moments of inertia will be altered. 
These dynamic parameters must be considered to maximize the accuracy of the model.

## Assumptions

- subsonic flight
- axis-symmetric rigid body rocket
- single cylindrical body 
- Von Karman nose shape
- three or four trapezoidal fins 
- passively controlled (no active thrust or stability control)
- constant fuel expenditure rate
- vertical/linear flight within 5 degrees [@box2009]
- the *Ideal Gas Law* applies throughout the flight
- humidity in the air is ignored
- steady-state irrotational flow around the body [@niskanen2013]
- fully aligned thrust [@box2009, pg.16]
- smooth transition between nose cone and body tube (no shoulder)
- rocket does not have a boattail
- rocket has a single rectangular launch lug

## Requirements
The Performance Model must provide the maximum altitude and velocity of the rocket in subsonic flight under a known thrust curve and known dimensional parameters. Assumptions considered legitimate based on prior research for similar rockets may be applied

- 2a Static stability between 2 and 3 calibers 
- 2b Dynamic stability above 0 
- 2c Max velocity at launch rail 30.5 m/s 
- 2d Vehicle max speed mach 0.9 
- 2e Vehicle reaches 10,000 ft altitude (+1000 feet / - 0 feet)
- 2f Vehicle doesn't experience resonant pitching/yawing moment

[SCRD 2016 Specifications and Requirements]

## Validation

- Sub-Models will be unit tested with 3rd party data to ensure functional validity where possible.
- Once all Sub-Models are validated individually, the overall model will be validated using 3rd-party data.
    - Primary 3rd-party simulation data source will be OpenRocket simulations
    - Where possible, actual 3rd-party rocket flight data will be used to validate the model

