# Validation

The engineering flight simulation was tested comprehensively.

## Unit Testing

It was ensured that individual Matlab functions provided the output expected, and that Simulink blocks employing the Matlab functions worked on a unit level - Reference Models were employed for this purpose.

Sample unit testing code is provided below:

ANGULAR_UNIT_TESTING.m
```
...

% make sure that coef_normal_force == 0 is captured and handled
actual = COPRocket([1,1,1,1,1,1,1,0]);
expected = 1;
assert( ...
    actual == expected, ...
    'COPRocket() \n actual = %d \n expected = %d ', actual, expected ...
)

actual = StabilityDerivativeFinSet([1.131536,3,0.095,0.118004,0.1,0.28,0.103]);
expected = 6.3371;
assert( ...
    actual == expected, ...
    'COPFinSet() \n actual = %d \n expected = %d ', actual, expected ...
)

actual = CoefFinBodyInterference([0.103,0.095]);
expected = 1.351536;
assert( ...
    actual == expected, ...
    'COPFinSet() \n actual = %d \n expected = %d ', actual, expected ...
)

disp('ALL ANGULAR_FLIGHT_UNIT_TESTING.m TESTS PASSED!');

```

And the output is as follows

```
ALL ANGULAR_FLIGHT_UNIT_TESTING.m TESTS PASSED!
```
\clearpage 

## Integration Testing

Where many Simulink blocks were combined fro a higher-level function, they were tested with existing data from other simulators to verify functional correctness - Reference Models were again employed for this purpose.

At this point, the code and the models were tested against values known to be correct to confirm their functionality.

Figure \ref{cop_integration_tests_label} shows an example of an integration test model, used to verify the Center of Pressure calculation with the input *Stability Derivative* and *Rocket Body Lift Correction*. 

[cop_integration_tests]: images/CenterOfPressure_Integration_TestModel.png "COP Integration Test" 
![Center of Pressure - Integration Test\label{cop_integration_tests_label}][cop_integration_tests] 

\clearpage 

Figure \ref{all_integration_tests_label} shows the high level Model Reference which contains all unit, integration, and system test models.

[all_integration_tests]: images/ALL_TESTS.png "All Integration Tests" 
![All Integration Tests \label{all_integration_tests_label}][all_integration_tests] 

## System Testing

The simulator was tested on a system level by simulating the CR_2-4G rocket flight on all available simulators and comparing all possible results. 
These results are discussed in detail in the *Simulation Execution* section.
