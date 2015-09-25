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
% Important Notes:
% Time values need to be monotomically non-decreasing. Meaning, the time
% step must be equal or increasing only. As such, the smallest time-step
% should be chosen and the data in between interpolated to complete the 
% set. TODO
%
%--------------------------------------------------------------------------------
% References
% http://www.mathworks.com/help/simulink/ug/how-to-import-data-from-an-excel-spreadsheet.html
% http://www.mathworks.com/help/matlab/matlab_external/example-reading-excel-spreadsheet-data.html
%--------------------------------------------------------------------------------

% Import the data from Excel
data = xlsread('monotomic_time_thrust_curve.csv');

% Transpose the data for the .mat file
data_transpose = data.';

% Store the data in a .mat file
save('thrust_curve.mat','data_transpose');

% Extract data from mat file
time = data(:,1);
thrust = data(:,2);

% Plot the thrust curve for reference
% TODO: maybe we want to ask the user to verify the curve before proceeding
plot(time,thrust);

% Row indices for lookup table
% breakpoints1 = data(2:end,1)';

% Column indices for lookup table
% breakpoints2 = data(1,2:end);

% Output values for lookup table
% table_data = data(2:end,2:end);
