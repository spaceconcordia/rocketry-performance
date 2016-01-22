# Engineering Simulation for Rocket Flight Analysis

## Overview 
The goal of this project is to create an Engineering Simulation for Rocket Flight Analysis in Matlab to model the rocket flight characteristics of the CR-2_4G Rocket.

Specifically the model should verify the maximum altitude and velocity.
Further developments are explored for future enhancement. 
A modular development pattern will be followed order to support future expansion. 
Unit testing of simulator logic will be undertaken where reasonable, and further validation will be provided by testing the overall model against 3rd party flight data where available.

The model must take as input the current structural design parameters, thrust information, and simulated ambient conditions of the launch environment.
Certain parameters will be dynamic; as the motor expends fuel, the position of the center of gravity and center of pressure will shift with decreasing mass. 
Additionally the moments of inertia will be altered. 
These dynamic parameters must be considered to maximize the accuracy of the model.

Beyond the primary goal of validating the rocket flight performance through simulation, this project is an educational tool to enhance the knowledge and learning of the team members and of the *Space Concordia* society as a whole. 
Furthermore, it will serve as a starting point for future controls and simulations applications to come, many of which are discussed in the **Future Enhancements** section.

## Definition of the Problem

An engineering simulation is needed to test the flight performance of a high-powered rocket.
A high-powered rocket is defined as having between 160 Ns and 40,960 Ns total impulse [@BoxBishopHunt11].
A team from the *Space Concordia* association at *Concordia University* is entering a submission into the *International Rocket Engineering Competition* (IREC) run by the *Experimental Sounding Rocket Association* (ESRA).
The competition provides performance targets which must be met in order to be eligible to win.
These targets are held as design requirements for performance, and are listed in the **Requirements** section below.

## Requirements
The Performance Model must provide the maximum altitude and velocity of the rocket in subsonic flight under a known thrust curve and known dimensional parameters. 

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

## Problem Solving Approach

### Kinematics

*Kinematics* is the study of the motion without consideration of the forces in play. 
This analysis can be simplified by considering the entire mass of a body at a convenient point, such as the *Center of Gravity* (point-mass).
Of particular interest are the position, velocity, and acceleration of the point [@mandell1973].

### Dynamics

*Dynamics* is the study of motion which considers the forces in play.
It is useful to consider bodies as *rigid bodies* in order to simplify the forces that act on them (e.g. ruling out the stiffness of the body) [@mandell1973].
Forces acting at a distance $d$ from the center of gravity create a rotation about the center of gravity.

### Decoupling the Model

If it can be said that the translation of the body at its center of gravity (kinematics) does not impact the rotation of the body about its center of gravity by a force applied at some other point (the *Center of Pressure*), the analysis can be greatly simplified.
Such a *mutually independent system of equations* could be solved rather easily, as the translational model could be solved independently of the rotational model, and vice-versa [@mandell1973].
Coupled systems of equations, on the other hand, would have to be solved simultaneously.

As it happens, the translational model of the rocket is not fully decoupled from the rotational model. 
As the rocket rotates while travelling through the air at an angle of attack, it presents a larger reference area and thus increases the drag force, causing a negative acceleration in the translation model. 
Likewise, an increase in the translational velocity of the rocket creates a larger lift force when the rocket is rotating at an angle of attack. 
This lift force, which is applied at the rocket's center of pressure, creates a rotation about the center of gravity.

However, it is possible to proceed with a decoupled analysis with the assistance of careful assumptions and approximations within acceptable accuracy. 
If accepted, this would imply a *weak coupling* between the translational model and the rotational model [@mandell1973].

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


