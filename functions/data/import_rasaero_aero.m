%% Import data from text file.
% Script for importing data from the following text file:
%
%    C:\Users\scorpii\Documents\Space\Rocketry\Performance\rocketry-performance\data\aureliues_rasaero_aero.CSV
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

% Auto-generated by MATLAB on 2016/01/23 17:12:35

%% Initialize variables.
filename = 'aureliues_rasaero_aero.CSV';
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
% For more information, see the TEXTSCAN documentation.
formatSpec = '%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines' ,startRow-1, 'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
rasaero_Mach = dataArray{:, 1};
rasaero_Alpha = dataArray{:, 2};
rasaero_CD = dataArray{:, 3};
rasaero_CDPowerOff = dataArray{:, 4};
rasaero_CDPowerOn = dataArray{:, 5};
rasaero_CAPowerOff = dataArray{:, 6};
rasaero_CAPowerOn = dataArray{:, 7};
rasaero_CL = dataArray{:, 8};
rasaero_CN = dataArray{:, 9};
rasaero_CNPotential = dataArray{:, 10};
rasaero_CNViscous = dataArray{:, 11};
rasaero_CNalpha0to4degperrad = dataArray{:, 12};
rasaero_CP = dataArray{:, 13};
rasaero_CP0to4deg = dataArray{:, 14};
rasaero_ReynoldsNumber = dataArray{:, 15};

%% Clear temporary variables
clearvars filename delimiter startRow formatSpec fileID dataArray ans;
