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
%-------------------------------------------------------------------------%

%-------------------------------------------------------------------------%
% Data Import
%   This section imports the atmospheric data from the same folder that
%   this script is located within. 
%
%   Variables:
%       FileList    = List of files in current folder. It is converted from
%                     a struct to a cell array for simplicity
%       n           = A placeholder variable for counting and runoff
%       NumFiles    = Contains the number of files that will be processed
%       AtmoData    = Contains the atmospheric data in a 3D Array. It only
%                     uses the first 3 columns of the input data sets
%       name        = Temporary container for the full file name being
%                     treated in the for loop
%       InterArray  = Temporary container for holding a single array of
%                     atmospheric data
%       DataPoints  = An array to hold the number of atmospheric data
%                     points in each set to facilitate future calculations
%       ThirdParty  = Boolean variable. If it contains 1, the script will 
%                     retrieve data from the "thirdparty" folder
%-------------------------------------------------------------------------%

ThirdParty = 1;

if ThirdParty == 1
    
    FileList = dir('thirdparty\*_array*.mat');
    
    FileList = struct2cell(FileList);

    [~, NumFiles] = size(FileList);

    AtmoData = zeros(5, 3, NumFiles);

    for n = 1:NumFiles
    
        name = char(FileList(1,n));
        name = strcat('thirdparty\',name);
        InterArray = cell2mat(struct2cell(load(name)));
        [DataPoints(n),~] = size(InterArray);
    
        for j = 1:DataPoints(n)
        
            AtmoData(j,1,n) = InterArray(j,1);
            AtmoData(j,2,n) = InterArray(j,2);
            AtmoData(j,3,n) = InterArray(j,3);
        
        end
    
    end
    
else
    
    FileList = dir('*_array*.mat');
    
    FileList = struct2cell(FileList);

    [~, NumFiles] = size(FileList);

    AtmoData = zeros(5, 3, NumFiles);

    for n = 1:NumFiles
    
        name = char(FileList(1,n));
        InterArray = cell2mat(struct2cell(load(name)));
        [DataPoints(n),~] = size(InterArray);
    
        for j = 1:DataPoints(n)
        
            AtmoData(j,1,n) = InterArray(j,1);
            AtmoData(j,2,n) = InterArray(j,2);
            AtmoData(j,3,n) = InterArray(j,3);
        
        end
    
    end
    
end

%-------------------------------------------------------------------------%
% Results Array - Theoretical
%   This section runs the ISAModel.m script and places the temperature and
%   pressure at altitude in a 3D array. This computed array will only
%   contain pressure and temperature and pressure data based on the initial
%   conditions, just like the flight simulations shoul;d
%
%   Variables:
%       TheoValues  = Array to hold all theoretically obtained values for
%                     comparison against experimental data (columns:
%                     pressure, altitude, temperature)
%       inputs      = Array to hold input data for ISAModel.m
%       outputs     = Array to hold output data from ISAModel.m
%-------------------------------------------------------------------------%

TheoValues = zeros(1,3,NumFiles); 

for n = 1:NumFiles
    
    inputs(1) = AtmoData(1,3,n) + 273.15;  % T_in in Kelvin
    inputs(2) = AtmoData(1,1,n) * 100;     % P_in in Pascals
    inputs(3) = AtmoData(1,2,n);           % Alt_in in meters
    
    for j = 1:DataPoints(n)
        
        inputs(4) = AtmoData(j,2,n);
        outputs = ISAModel(inputs);
        
        TheoValues(j,1,n) = outputs(2);
        TheoValues(j,2,n) = inputs(4);
        TheoValues(j,3,n) = outputs(1);
        
    end
    
end

%-------------------------------------------------------------------------%
% Error Calculation
%   This section calculates the experimental error between the theoretical
%   values and the experimental values. The values for error on each plot
%   are stored in an array
%
%   Variables:
%       AllError    = A 3D array which stores all the error values
%                     (columns: Pressure error, Temperature error)    
%       E           = Temporary variable to contain error values
%-------------------------------------------------------------------------%

AllError = zeros(1,2,NumFiles);

for n = 1:NumFiles
    
    for j = 1:DataPoints(n)
        
        %Pressure error
        E = abs((100*AtmoData(j,1,n)-TheoValues(j,1,n))/TheoValues(j,1,n));
        AllError(j,1,n) = E*100;
        
        %Temperature error
        E = (AtmoData(j,3,n)+273.15-TheoValues(j,3,n))/TheoValues(j,3,n);
        AllError(j,2,n) = abs(E*100);
        
    end

end

%-------------------------------------------------------------------------%
% Plot creation
%   This section takes all the previous data and and creates several plots
%   in a matlab figure. The plots are saved under the call sign with which
%   the data was entered. As well, a summary figure is created to show the
%   overall trend of the error
%
%-------------------------------------------------------------------------%

