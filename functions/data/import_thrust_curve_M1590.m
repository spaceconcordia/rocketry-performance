%% Import data from text file.
% Script for importing data from the following text file:
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

%% Initialize variables.
filename = 'C:\Users\scorpii\Documents\Space\Rocketry\Performance\rocketry-performance\data\motors\Cesaroni_M1590.eng';
delimiter = ' ';
startRow = 3;

%% Format string for each line of text:
%   column1: double (%f)
%	column2: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%f%f%*s%*s%*s%*s%*s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'HeaderLines' ,startRow-1, 'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Allocate imported array to column variable names
raw_time = dataArray{:,1};
raw_thrust = dataArray{:,2};

%% Interpolate data for simulation
disp('Setting baseline time');
simulation_time = max(raw_time); % seconds
t_new           = linspace(0,simulation_time,simulation_time/timestep);
t_new           = t_new.';

disp('Interpolating thrust data');
thrust = interp1(raw_time, raw_thrust, t_new, 'PCHIP');

%% plot
figure;
plot(t_new, thrust);
title('Imported Thrust Curve');
xlabel('Time (s)');
ylabel('Thrust (N)');

%% save to m file
thrust_curve(1,:)    = t_new.';
thrust_curve(2,:)    = thrust.';
save ('thrust_curve_mclass.mat','-v7.3','thrust_curve');

%% Clear temporary variables
clearvars filename delimiter endRow formatSpec fileID dataArray ans t_new simulation_time raw_time raw_thrust filen filep startRow thrust_curve thrust;
