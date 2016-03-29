## Stochastic Simulations

The simulator described in this paper is deterministic. 
It assumes that all input parameters are known and produces the same simulation result each time it is run, as long as no parameters are directly changed. 
While it was acknowledged that conditions may vary and produce different launch outcomes, only the extreme expected cases were tested  - a multitude of possibilities exist in between.

A convincing and complete engineering simulation must account for the uncertainties of certain variables. 
In high-powered rocket flight, there are many such uncertainties.
For example, any error in the shaping of the fins introduces roll during flight, which has many influences on the rocket. 
Additionally, wind turbulence is extremely difficult to predict, and can have impacts all all stages of the rocket flight which may change its directory.
Temperature is a significant factor for the performance of the motor - for instance, its total impulse and burn time are sure to be affected at high temperatures.

The variation of all these parameters together creates a great deal of uncertainty, which must be accounted for in a robust engineering simulation.

Stochastic methods such as the *Monte Carlo* method randomize these parameters and provides a range of uncertainty from which it is possible to consider the probability that a given simulation outcome will occur in reality.

