# Statistical Analysis

A statistical analysis is needed to establish the confidence of our simulations based on the known or knowable sources of variability.

## Scope

All known statistics tasks so far

1. Tolerance analysis with Simulations to determine confidence limits of estimations (particularly altitude and velocity)
2. How much variation in C$_d$ and motor impulse is required to achieve the altitude and velocity recorded in the 2015 competition
3. Compare the time to apogee of simulation data (Performance Model, OpenRocket, RASAero) to the time to apogee of Avionics data (Strattologger, custom avionics)
    - if the simulation time to apogee is not close to the actual flight time to apogee, something is wrong in the simulation
4. Find reliable 3rd party sources of data to increase the statistical accuracy of the model
5. Time permitting, generate a distribution of simulation data in which variability in parameters was evaluated to produce a large set of results 

## Model Outputs

| Model                 | Parameters                                            |
| ---                   | ---                                                   |
| Vertical flight model | velocity, altitude                                    |
| Drag model            | C$_d$, Drag Force                                     |
| Angular Model         | Angular motion (position, velocity, and acceleration) |

### Relationships of Interest

#### Velocity vs. Time

#### Mach Number vs. Time

#### Acceleration vs. Time

#### Drag Coefficient vs. Velocity

## Tolerance Analysis

### Tolerance Sources

#### Low Impact

- Dimensional variation from design tolerances

---

#### Medium Impact
 
##### Parasitic Drag

Any feature on the outer surface not accounted for in the CATIA design that introduces parasitic drag

- exposed nuts and bolts
- launch guide
- etc.

---

#### High Impact

##### Variation in Thrust

- Motor impulse can easily vary $\pm$ 10% 
- 20% variance is allowed under NFPA1120

---

## First Steps 

We need a lot of experimental data and analysis to get a better picture of this.

1. We should first focus on data collection. Find as much raw data as possible

    - NACA - windtunnel data for drag force and coefficients for standard shapes
    - ThrustCurve.org
    - [United States Air Force Stability and Control Datcom]:(http://oai.dtic.mil/oai/oai?verb=getRecord&metadataPrefix=html&identifier=ADB072483)
    - Weather balloon data for real altitude data: http://weather.uwyo.edu/upperair/sounding.html

2. Then, look on Engineering Village or Compendex or other databases for prior academic research into statistical analysis of rocket or general aerodynamic simulations

3. Regroup at look at our own assumptions and try to establish a first attempt at confidence limits

## References

[Mandell et al, 1973]
