function thrust_curve = thrust_data_import(csvfilename)
%-------------------------------------------------------------------------------
%
% thrust_data_import.m
%
% Data Access of Parametric Model
%
% Thrust curves are provided in tabulated and time-based form. The values for 
% thrust need to be processed as input to the model in a synchronized fashion
% with the simulation clock
%
% A csvfilename shall be provided for a CSV file containing in the first column
% the time and in the secoond column the thrust force
%
% The data is read using xlsread and transposed for a lookup table to change
% the data
% 
% TODO The data should be interpolated to keep the time-step constant
% 
% Important Notes:
% Time values need to be monotomically non-decreasing. Meaning, the time
% step must be equal or increasing only. As such, the smallest time-step
% should be chosen and the data in between interpolated to complete the 
% set. TODO
%
%-------------------------------------------------------------------------------
% References
% http://www.mathworks.com/help/simulink/ug/how-to-import-data-from-an-excel-spreadsheet.html
% http://www.mathworks.com/help/matlab/matlab_external/example-reading-excel-spreadsheet-data.html
%-------------------------------------------------------------------------------

% Import the data from Excel
data = xlsread(csvfilename);

% Interpolate the data
% data = scrd_interpolate(data)

% Transpose the data for the .mat file
data_transpose = data.';

% Store the data in a .mat file
save('thrust_curve.mat','data_transpose');

% Extract data from mat file
time = data(:,1);
thrust = data(:,2);

% Plot the thrust curve for reference
% TODO: maybe we want to ask the user to verify the curve before proceeding
%plot(time,thrust);

thrust_curve = data_transpose;

% Row indices for lookup table
% breakpoints1 = data(2:end,1)';

% Column indices for lookup table
% breakpoints2 = data(1,2:end);

% Output values for lookup table
% table_data = data(2:end,2:end);
