%--------------------------------------------------------------------------------
%
% data_parametric_model.m
%
% Data Access of Parametric Model
%
% Thrust curves are provided in tabulated and time-based form. The values for 
% thrust need to be processed as input to the model in a synchronized fashion
% with the simulation clock
%
% Additionally, Design Parameters for the Rocket are stored in a spreadsheet. 
% These parameters will be accessed and passed along into the simulation to 
% determine other parameters and ultimately to evaluate the performance of those 
% design values
%
%--------------------------------------------------------------------------------
% References
% http://www.mathworks.com/help/simulink/ug/how-to-import-data-from-an-excel-spreadsheet.html
% http://www.mathworks.com/help/matlab/matlab_external/example-reading-excel-spreadsheet-data.html
%--------------------------------------------------------------------------------

% Import the data from Excel for a lookup table
data = xlsread('Parametric_Model','Sheet1');

% Row indices for lookup table
breakpoints1 = data(2:end,1)';

% Column indices for lookup table
breakpoints2 = data(1,2:end);

% Output values for lookup table
table_data = data(2:end,2:end);
