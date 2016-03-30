# Engineering Simulation for Rocket Flight Analysis

## Overview 
The goal of this project is to create an Engineering Simulation for Rocket Flight Analysis in Matlab.
This is not exactly a flight simulator, which generally aims to train pilots and visually simulate aircraft flight.
An engineering simulation tests the dynamics and behavior of a system, often employing a combination of analytic and empirical methods, in order to validate an engineering model before its deployment.

Such a simulation is driven by the requirements of the engineering project. 
This project is constrained by the flight requirements of an international rocketry competition, and as such, it is developed to validate them.

A modular development pattern is performed where possible, in order to support expansion for other simulation purposes. 
Unit and integration testing of simulator logic is undertaken where reasonable, and further validation is provided by testing the overall model against available 3rd party flight data.

Beyond the primary goal of validating the rocket flight performance through simulation, this project is an educational tool to enhance the knowledge and learning of the team members and of the *Space Concordia* society as a whole. 
Furthermore, it will serve as a starting point for future controls and simulations applications to come, many of which are discussed in the **Future Enhancements** section.

## Definition of the Problem

An engineering simulation is needed to predict the flight performance of a high-powered rocket.
A high-powered rocket is defined as having between 160 Ns and 40,960 Ns total impulse [@BoxBishopHunt11].
A team from the *Space Concordia* association at *Concordia University* is entering a submission into the *International Rocket Engineering Competition* (IREC) run by the *Experimental Sounding Rocket Association* (ESRA).
The competition provides performance targets which must be met in order to be eligible to win.
These targets are held as design requirements for performance, and are listed in the **Requirements** section below.

## Requirements

The Performance Model must provide the maximum altitude and velocity of the rocket in subsonic flight under a known thrust curve and known dimensional parameters. 

- 2a Static stability above 2 calibers 
- 2b Dynamic stability above 0 
- 2c Min velocity at launch rail 30.5 m/s 
- 2d Vehicle max speed mach 0.9 
- 2e Vehicle reaches 10,000 ft altitude (+1000 feet / - 0 feet)
- 2f Vehicle doesn't experience resonant pitching/yawing moment

[SCRD 2016 Specifications and Requirements]

## Problem Solving Approach

### Kinematics

*Kinematics* is the study of the motion without consideration of the forces in play. 
This analysis can be simplified by considering the entire mass of a body at a convenient point, for instance the *Center of Gravity*.
We call this the point-mass system.
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
As the rocket rotates while travelling through the air at an angle of attack, it presents a larger reference area and thus increases the drag force, causing a negative acceleration in the translational point-mass model. 
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
- the *Ideal Gas Law* applies throughout the flight
- steady-state irrotational flow around the body [@niskanen2013]
- fully aligned thrust [@box2009, pg.16]
- roll is ignored
- smooth transition between nose cone and body tube (no shoulder)
- rocket does not have a boattail
- rocket has a single rectangular launch lug

