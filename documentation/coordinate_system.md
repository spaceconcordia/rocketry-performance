## Coordinate System

### Position

#### Rocket Coordinates

#### World Coordinates

### Orientation

*Spherical  Coordinates* and *Euler Angles* are commonly used to describe the orientation of an object, however both systems encounter singularities where the orientation is ambiguous. 
Special cases are required to handle these singularities, which complicate the analysis and programming.

#### Quaternions 

*Quaternions* are commonly used to describe spatial rotation, avoiding singularities. 

An initial position is taken as reference to describe subsequent changes in orientation.
Vectors can be transformed from rocket coordinates to world coordinates, and the reverse.


