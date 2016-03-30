# Discussion

## Sources of Error

There are a great many sources of error in this analysis.

First and foremost, the Barrowman Method contains a lot of simplifications which have a limited range of validity, and even in the valid ranges introduce error.
For example, that the *Stability Derivative* is constant at angles of attack less than 10% is not exactly correct. 
In his analysis, it is demonstrated that the error is small, but added to the errors for other simplifications and approximations, the result may be quite significant.

The following assumptions introduce error

- axis-symmetric rigid body rocket 
    - the rocket in fact will have some slight asymmetry, due to slight manufacturing defects
- single cylindrical body 
- constant fuel expenditure rate 
    - the fuel expenditure does not vary greatly, but it is certainly not constant, as evidenced in \ref{dynamic_weight_calculation_test_figure_label}
- the *Ideal Gas Law* applies throughout the flight 
    - it was shown that the atmospheric error was roughly 1%, however this will increase with altitude
- steady-state irrotational flow around the body [@niskanen2013] 
- fully aligned thrust [@box2009, pg.16] 
    - it is likely that the alignment of the motor and exit nozzle will not be perfect along the longitudinal axis
- smooth transition between nose cone and body tube (no shoulder) 
- wind turbulence
    - assuming a step input for wind disturbance does not consider turbulent effects
- fins are assumed perfectly aligned 
    - it is likely that the fin alignment may have some small error and that the edging will not be perfect
- roll is neglected
    - almost all of the items above will contribute to some amount of roll, which can have positive and negative effects for rocket flight

There are doubtlessly other errors that are not mentioned here, but these are significant and obvious at this point of the project. 
Addressing these issues would go a long way to making a more robust simulator.


## Conclusion

Although many sources of error were identified, the engineering simulator appears to produce relatively good results. The comparison of the simulator with experimental data shows a maximum error of %9 and minimum error of 1%, which for the demands of the competition is very good. 
Most importantly, the flight performance requirements of the rocket are confirmed. 
The project is built with validation in mind, allowing it to be in all facets compared to 3rd party data and other simulators.
More simulator validation with experimental data is planned for this Spring 2016, with smaller launches planned at nearby Quebec competitions.
There is much potential for future development, opportunities for improvement are discussed in the next section.
