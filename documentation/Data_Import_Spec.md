# Data Import Specification

## Background
We need to be able to import different rocket motor thrust curves to drive the simulation, rather than defining piecewise polynomials for discrete data ranges as was done previously. The simulation time-step needs to match the time-step in the input file provided, and provide the corresponding thrust value for the current time in the simulation. 

Matlab is able to accomplish this via the combination of the following  methods:

- *Lookup Table* block
- *From File* block
    - Requires *timeseries* or *matrix* format
- Other means?

## Implementation

### Steps

1. Import the spreadsheet into Matlab
- Home --> Import 

2. Export the data as a .mat file

3. Use the *From File* block to grab the .mat file

4. Use the *Lookup Table* block to grab the data from the *From File* block

## Resources
[Matlab-import_export.pdf](http://www.aae.wisc.edu/aae637/MATLAB/documentation/import_export.pdf)
