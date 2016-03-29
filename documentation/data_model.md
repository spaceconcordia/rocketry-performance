## Data Model

The *Data Model* provides static and dynamics parameters as needed by other models in the simulation. 

### Static Parameters

Many parameters are constant throughout the simulation, notably the structural dimensions. 
All structural dimensions are generated in the CATIA Design and output to a spreadsheet, which the simulation will load and place in the Matlab workspace.

This instance can be accessed by multiple models to clearly and effectively provide parameter access. 


### Dynamic Parameters

As discussed in the *Dynamic Parameters* section, many parameters are changing due to flight conditions. An additional *Map Container* instance is created to handle and deliver these changes to the models that need them.

