## Dynamic Parameters

As agreed with Emily on 2015/10/02:

- the parametric model must provide the moment of inertia, mass, area, and center of gravity of all static structural components (nose cone, body tube, fins, etc.)
- the mass, center of mass (relative to the nose tip) of the motor

### Thrust

Thrust curves are provided by the commercial manufacturer, and are handled as input by the *Data Model*.

### Weight 

As fuel is expended in generating thrust, the weight of the rocket is reduced. The motor manufacturer provides a expenditure rate known as the *Specific Fuel Consumption*. This rate is considered constant. 

### Center of Mass

### Center of Gravity

$$ y_{cg} = \dfrac{m_1 y_1 + m_2 y_2 + ... + m_n y_n}{\sum_{j=1}^n m_j} $$

[NASA CG]:(http://www.grc.nasa.gov/WWW/K-12/airplane/cg.html)

$$ COG(t) = \dfrac{m_1 y_1 + (m_2 - \Delta m) y_2}{m_1 + m_2 - \Delta m(t)} $$ 

Where COG(t) is the Center of Gravity as a function of time, $m_1$ is the static mass (combination of nose cone, body tube, and fins), $m_2$ is the initial mass of the motor, and $\Delta m(t)$ is the change of mass as a function of time due to fuel expenditure.

### Moments of Inertia

The instantaneous moment of inertia is determined by relating the moment of inertias of the static structure and the dynamic structure through the parallel axis theorem evaluated at the total center of gravity (COG).

The sum of moment of inertias evaluated through the parallel axis theorem nets the total moment of inertia.

$$ I_n = I_{cm(n)} + M_P d^2 $$ 

$$ I_T(t) = \sum I_n $$ 

Where $I_T(t)$ is the total moment of inertia of the rocket as a function of time, and $I_n$ is the component vector (either static or dynamic moment of inertia)

[1]

