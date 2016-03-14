%% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%    Workbook:
%    C:\Users\scorpii\Documents\Space\Rocketry\Performance\Anomaly\RocketFlightDataStrattoLogger.xlsx
%    Worksheet: RocketFlightDataStrattoLogger
%
% To extend the code for use with different selected data or a different
% spreadsheet, generate a function instead of a script.

% Auto-generated by MATLAB on 2016/03/14 14:25:47

%% Import the data
[~, ~, raw] = xlsread('C:\Users\scorpii\Documents\Space\Rocketry\Performance\Anomaly\RocketFlightDataStrattoLogger.xlsx','RocketFlightDataStrattoLogger','A2:J7113');
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};
cellVectors = raw(:,[9,10]);
raw = raw(:,[1,2,3,4,5,6,7,8]);

%% Replace non-numeric cells with 0.0
R = cellfun(@(x) (~isnumeric(x) && ~islogical(x)) || isnan(x),raw); % Find non-numeric cells
raw(R) = {0.0}; % Replace non-numeric cells

%% Create output variable
data = reshape([raw{:}],size(raw));

%% Allocate imported array to column variable names
arcstrat_Time = data(:,1);
arcstrat_Altitude = data(:,2);
arcstrat_Speed = data(:,3);
arcstrat_temp = data(:,4);
arcstrat_Altm = data(:,5);
arcstrat_tempdegC = data(:,6);
arcstrat_pressureratio = data(:,7);
arcstrat_pressurePa = data(:,8);
arcstrat_temp2 = cellVectors(:,1);
arcstrat_Altitude2 = cellVectors(:,2);

%% Clear temporary variables
clearvars data raw cellVectors R;