% External resources: http://www.mathworks.com/matlabcentral/fileexchange/39325-density-altitude-calculator 
%-------------------------------------------------------------------------%

%-------------------------------------------------------------------------%
% This test is for validation of the ISA_model output
% The ISA_model.m takes in ground temperature, ground pressure, and actual 
% altitude, and outputs the density of air (rho)
%-------------------------------------------------------------------------%

%-------------------------------------------------------------------------%
% The test will ensure the correct determination of density by comparing to
% tabulated values. It will insert the ground conditions as the initial 
% conditions for running the function, calculate the viscosities at
% altitudes for both the ISA function and the sounding data, and then
% compare the difference in viscosity estimates to get an error value. The 
% errors will be averaged to reach an average deviation from the model
%-------------------------------------------------------------------------%

%-------------------------------------------------------------------------%
% Import tabulated pressure, temperature, alitude, density values.
% The imported data comes in arrays with 11 columns. The data contained in
% the columns is as follows:
%   Column 1:   Pressure in hPa
%   Column 2:   Height in meters
%   Column 3:   Temperature in Celsius
%   Column 4:   Dewpoint in Celsius
%   Column 5:   Percent relative humidity
%   Column 6:   Mixing Ratio in g/kg
%   Column 7:   Wind direction in degrees to true north
%   Column 8:   Wind speed in knots
%   Column 9:   Potential temperature in Kelvin
%   Column 10:  Equivalent potential temperature in Kelvin
%   Column 11:  Virtual potential temperature in Kelvin
%
% The following script opens .mat files in the matlab workspace which are
% stored in the same working folder. The folders are named with the
% convention ###_array.mat, where ### is a 3-letter code in capital letters
% representing the call sign of the weather station performing the survey.
% The only data currently used are the pressure, height and temperature.
% They are imported into arrays which are named based on the call-sign.


% calculate density using ISA_model function
% TODO

% assert calculated values of density versus tabulated values of density
% TODO
