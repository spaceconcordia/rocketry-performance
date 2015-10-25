## Data Model

### Data Store

[Data Stores](http://www.mathworks.com/help/simulink/data-stores.html)

[Data Store](http://www.mathworks.com/help/simulink/slref/datastorememory.html) 

[When to Use a Data Store](http://www.mathworks.com/help/simulink/ug/when-to-use-a-data-store.html)

[Data Store Examples](http://www.mathworks.com/help/simulink/ug/data-store-examples.html)

[Data Stores and Software Verification](http://www.mathworks.com/help/simulink/ug/data-stores-and-software-verification.html)
> see RTCA DO-331, ["Model-Based Development and Verification Supplement to DO-178C and DO-278A," Section MB.6.3.3.b.](http://www.rtca.org/Files/ListofAvailableDocsMarch2013.pdf)

The *Data Model* provides static and dynamics parameters as needed by other models in the simulation. 

### Static Parameters

Many parameters are constant throughout the simulation, notably the structural dimensions. All structural dimensions are generated in the CATIA Design and output to a spreadsheet, which the simulation will load and place in a Matlab *Map Container* instance.

> http://www.mathworks.com/help/matlab/map-containers.html

This instance can be accessed by multiple models to clearly and effectively provide parameter access. 


#### Spreadsheet Import and Mapping
~~~~ {#mycode .matlab .numberLines startFrom="1"}
function parametric_data_object = data_parametric_model()
%--------------------------------------------------------------------------------
%
% data_parametric_model.m
%
% Data Access of Parametric Model
%
% Design Parameters for the Rocket are stored in a spreadsheet. 
% These parameters will be accessed and passed along into the simulation to 
% determine other parameters and ultimately to evaluate the performance of 
% those design values
%
%--------------------------------------------------------------------------------
% References
% http://www.mathworks.com/help/simulink/ug/how-to-import-data-from-an-excel-spreadsheet.html
% http://www.mathworks.com/help/matlab/matlab_external/example-reading-excel-spreadsheet-data.html
%--------------------------------------------------------------------------------

% Import the data from Excel
[pnum,ptxt,praw] = xlsread('Parametric_Data.xlsm','Matlab_Data');

% Extract parameters from the imported data 
keyset = ptxt(2:end,1);
valset = praw(2:end,2);

% initialize map object to store parametric data
parametric_data_object = containers.Map(keyset,valset);

end
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~ {include="../functions/data/data_parametric_model.m"}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Dynamic Parameters

As discussed in the *Dynamic Parameters* section, many parameters are changing due to flight conditions. An additional *Map Container* instance is created to handle and deliver these changes to the models that need them.

