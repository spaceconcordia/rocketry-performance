%% Import data from text file.
% Script for importing data from the following text file:
%
%    C:\Users\scorpii\Documents\Space\Rocketry\Performance\Simulation
%    Data\University_of_Louisville_14-15_Rocket_Characteristics\Altimeter1_FullScale_SodFarm.pf2
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

% Auto-generated by MATLAB on 2016/02/24 18:49:51

%% Initialize variables.
filename = 'C:\Users\scorpii\Documents\Space\Rocketry\Performance\Simulation Data\University_of_Louisville_14-15_Rocket_Characteristics\Altimeter5_FullScale_SodFarm.pf2';
delimiter = ',';
startRow = 15;

%% Format string for each line of text:
%   column1: double (%f)
%	column2: double (%f)
%   column3: double (%f)
%	column4: double (%f)
%   column5: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%f%f%f%f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
textscan(fileID, '%[^\n\r]', startRow-1, 'ReturnOnError', false);
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names_
Louisville_DataTime_5     = dataArray{:, 1};
Louisville_Altitude_5     = dataArray{:, 2};
Louisville_Velocity_5     = dataArray{:, 3};
Louisville_TemperatureF_5 = dataArray{:, 4};
Louisville_Voltage_5      = dataArray{:, 5};

Louisville_Velocity_5a = zeros(length(Louisville_Altitude_5),1);
Louisville_Velocity_5a(1) = 0;
for i=2:length(Louisville_Altitude_5)
    Louisville_Velocity_5a(i) = (Louisville_Altitude_5(i)-Louisville_Altitude_5(i-1)) / (Louisville_DataTime_5(i) - Louisville_DataTime_5(i-1) ) / 100;
end

%% Clear temporary variables
clearvars filename delimiter startRow formatSpec fileID dataArray ans;
