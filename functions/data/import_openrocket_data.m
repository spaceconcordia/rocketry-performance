%% Import data from text file.
% Script for importing data from the following text file:
%
%    C:\Users\scorpii\Documents\Space\Rocketry\Performance\rocketry-performance\data\aurelius_openrocket_simulation_nowind_greenriver_temp_pressure_no_isa.csv
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

% Auto-generated by MATLAB on 2016/01/23 19:41:58

%% Initialize variables.
%filename = 'aurelius_openrocket_simulation_nowind_greenriver_temp_pressure_no_isa.csv';
filename = 'aurelius_openrocket_best.csv';
delimiter = ',';
startRow = 2;

%% Format string for each line of text:
%   column1: double (%f)
%	column2: double (%f)
%   column3: double (%f)
%	column4: double (%f)
%   column5: double (%f)
%	column6: double (%f)
%   column7: double (%f)
%	column8: double (%f)
%   column9: double (%f)
%	column10: double (%f)
%   column11: double (%f)
%	column12: double (%f)
%   column13: double (%f)
%	column14: double (%f)
%   column15: double (%f)
%	column16: double (%f)
%   column17: double (%f)
%	column18: double (%f)
%   column19: double (%f)
%	column20: double (%f)
%   column21: double (%f)
%	column22: double (%f)
%   column23: double (%f)
%	column24: double (%f)
%   column25: double (%f)
%	column26: double (%f)
%   column27: double (%f)
%	column28: double (%f)
%   column29: double (%f)
%	column30: double (%f)
%   column31: double (%f)
%	column32: double (%f)
%   column33: double (%f)
%	column34: double (%f)
%   column35: double (%f)
%	column36: double (%f)
%   column37: double (%f)
%	column38: double (%f)
%   column39: double (%f)
%	column40: double (%f)
%   column41: double (%f)
%	column42: double (%f)
%   column43: double (%f)
%	column44: double (%f)
%   column45: double (%f)
%	column46: double (%f)
%   column47: double (%f)
%	column48: double (%f)
%   column49: double (%f)
%	column50: double (%f)
%   column51: double (%f)
%	column52: double (%f)
%   column53: double (%f)
%	column54: double (%f)
%   column55: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'HeaderLines' ,startRow-1, 'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
openrocket_VarName1 = dataArray{:, 1};
openrocket_Altitude = dataArray{:, 2};
openrocket_Verticalvelocityms = dataArray{:, 3};
openrocket_Verticalaccelerationms = dataArray{:, 4};
openrocket_Totalvelocityms = dataArray{:, 5};
openrocket_Totalaccelerationms = dataArray{:, 6};
openrocket_PositionEastoflaunch = dataArray{:, 7};
openrocket_PositionNorthoflaunch = dataArray{:, 8};
openrocket_Lateraldistance = dataArray{:, 9};
openrocket_Lateraldirection = dataArray{:, 10};
openrocket_Lateralvelocityms = dataArray{:, 11};
openrocket_Lateralaccelerationms = dataArray{:, 12};
openrocket_Latitude = dataArray{:, 13};
openrocket_Longitude = dataArray{:, 14};
openrocket_Gravitationalaccelerationms = dataArray{:, 15};
openrocket_Angleofattack = dataArray{:, 16};
openrocket_Rollrates = dataArray{:, 17};
openrocket_Pitchrates = dataArray{:, 18};
openrocket_Yawrates = dataArray{:, 19};
openrocket_Mass = dataArray{:, 20};
openrocket_Propellantmass = dataArray{:, 21};
openrocket_Longitudinalmomentofinertiakgm = dataArray{:, 22};
openrocket_Rotationalmomentofinertiakgm = dataArray{:, 23};
openrocket_CPlocation = dataArray{:, 24};
openrocket_CGlocationcm = dataArray{:, 25};
openrocket_Stabilitymargincalibers = dataArray{:, 26};
openrocket_Machnumber = dataArray{:, 27};
openrocket_Reynoldsnumber = dataArray{:, 28};
openrocket_Thrust = dataArray{:, 29};
openrocket_Dragforce = dataArray{:, 30};
openrocket_Dragcoefficient = dataArray{:, 31};
openrocket_Axialdragcoefficient = dataArray{:, 32};
openrocket_Frictiondragcoefficient = dataArray{:, 33};
openrocket_Pressuredragcoefficient = dataArray{:, 34};
openrocket_Basedragcoefficient = dataArray{:, 35};
openrocket_Normalforcecoefficient = dataArray{:, 36};
openrocket_Pitchmomentcoefficient = dataArray{:, 37};
openrocket_Yawmomentcoefficient = dataArray{:, 38};
openrocket_Sideforcecoefficient = dataArray{:, 39};
openrocket_Rollmomentcoefficient = dataArray{:, 40};
openrocket_Rollforcingcoefficient = dataArray{:, 41};
openrocket_Rolldampingcoefficient = dataArray{:, 42};
openrocket_Pitchdampingcoefficient = dataArray{:, 43};
openrocket_Coriolisaccelerationms = dataArray{:, 44};
openrocket_Referencelengthcm = dataArray{:, 45};
openrocket_Referenceareacm = dataArray{:, 46};
openrocket_Verticalorientationzenith = dataArray{:, 47};
openrocket_Lateralorientationazimuth = dataArray{:, 48};
openrocket_Windvelocityms = dataArray{:, 49};
openrocket_AirtemperatureC = dataArray{:, 50};
openrocket_Airpressurembar = dataArray{:, 51};
openrocket_Speedofsoundms = dataArray{:, 52};
openrocket_Simulationtimestep = dataArray{:, 53};
openrocket_Computationtime = dataArray{:, 54};
openrocket_DynamicPressurembar = dataArray{:, 55};

openrocket_DampingCoefficient = openrocket_Pitchdampingcoefficient ./ (2 .* sqrt(openrocket_Longitudinalmomentofinertiakgm .* openrocket_Pitchmomentcoefficient) );

%% Clear temporary variables
clearvars filename delimiter startRow formatSpec fileID dataArray ans;

%% Print apogee data to console
fprintf( 'Maximum OpenRocket altitude:      %d m, %d ft \r',...
    max(openrocket_Altitude),...
    max(openrocket_Altitude)*3.28 ...
    );

fprintf( 'Maximum OpenRocket Vertical Velocity:      %d m/s, %d ft/s \r',...
    max(openrocket_Verticalvelocityms),...
    max(openrocket_Verticalvelocityms)*3.28 ...
    );

fprintf( 'Maximum OpenRocket acceleration:  %d m/s^2, %d ft/s^2 \r',...
    max(openrocket_Verticalvelocityms),...
    max(openrocket_Verticalvelocityms)*3.28 ...
    );

fprintf( 'Maximum OpenRocket drag force:    %d m/s \r',...
    max(openrocket_Dragforce)...
    );
