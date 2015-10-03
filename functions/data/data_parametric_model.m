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
keyset = praw(2:end,1);
valset = praw(2:end,2);

% initialize map object to store parametric data
parametric_data_object = containers.Map(keyset,valset);

end
