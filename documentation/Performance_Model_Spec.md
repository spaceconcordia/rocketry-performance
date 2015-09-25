# Performance Model Specification

## Overview 
The goal of this project is to create a Performance Model in Matlab in order to input current structural design parameters and simulate flight characteristics in order to optimize the rocket in meeting the mission requirements.

The model must take into account all applicable flight physics and rocket design parameters to optimize the rocket performance in meeting the mission requirements

## General Assumptions
- subsonic flight
- not real-time

## Project 1 - Vertical (AOA < 5$^\circ$) Flight

### Notes
 - remove dependency on OpenRocket for weight

### Assumptions
- vertical/linear flight within 5 degrees

### Input
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

## Project 2 - Stability (Roll, Pitch, Yaw) Analysis

### Overview
- non-linear model (stability analysis)
 - finding lift will be annoying

## Validation
- Unit Testing where applicable
- Comparison with OpenRocket data
- Comparison with previous models and Arcturus flight data
- Comparison with available flight data

## Out-of-scope
- ambient conditions
- range (drift)
- roll

## Questions
- how to get Matlab to get time-based data from a spreadsheet
    - http://soliton.ae.gatech.edu/classes/ae6382/samples/matlab/excel-2/actx_excel.html

## Resources
[Thrust Curves]: (http://www.thrustcurve.org/simfilesearch.jsp?id=1591)
[Datcom]: (http://www.holycows.net/datcom/)
