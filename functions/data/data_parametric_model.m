function pmo = data_parametric_model()
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

%% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%    Workbook:
%    C:\Users\scorpii\Documents\Space\Rocketry\Performance\rocketry-performance\data\Parametric_Data.xlsm
%    Worksheet: Matlab_Data2
%
% To extend the code for use with different selected data or a different
% spreadsheet, generate a function instead of a script.

% Auto-generated by MATLAB on 2015/11/07 20:45:24

% Import the data from Excel
%[pnum,ptxt,praw] = xlsread('C:\Users\scorpii\Google Drive\PARAMETRIC DATA\Parametric_Data.xlsm','Matlab_Data');
[pnum,ptxt,praw] = xlsread('C:\Users\scorpii\Documents\Space\Rocketry\Performance\rocketry-performance\data\Parametric_Data.xlsm','Matlab_Data');

% Extract parameters from the imported data 
keyset = praw(2:end,1);
valset = praw(2:end,2);

for i = 1:length(keyset)
    assignin( 'base' , keyset{i}            , valset{i}            );
    %eval([keyset{i} '= valset(i)'])
    %keyset(i) = genvarname(valset(i))
end

%% Clear temporary variables
clearvars pnum ptxt praw;

