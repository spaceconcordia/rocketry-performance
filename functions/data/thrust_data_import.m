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

%% Enable xlsread in Simulink 
coder.extrinsic('xlsread');

%% Import the data from Excel
% data = xlsread(csvfilename);
% TODO hardcoding is bad
data = xlsread('aurelius_openrocket_simulation.csv');

raw_thrust = data(:,29);
raw_time   = data(:,1);

% you must remember to remove all comment rows from the open rocket data

simulation_time = 252; % seconds
timestep        = 0.001; % seconds
t_new           = linspace(0,simulation_time,simulation_time/timestep);
t_new           = t_new.';

thrust = interp1(raw_time, raw_thrust, t_new, 'PCHIP'); % PCHIP is cubic spline

thrust_curve(1,:) = t_new.';
thrust_curve(2,:) = thrust.';

save ('thrust_curve_mclass.mat','-v7.3','thrust_curve');
