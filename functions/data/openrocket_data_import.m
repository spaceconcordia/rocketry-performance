function thrust_curve = openrocket_data_import(csvfilename)
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

if size(csvfilename) == 0
    csvfilename='aurelius_openrocket_simulation.csv';
end

%% Enable xlsread in Simulink 
coder.extrinsic('xlsread');

%% Import the data from Excel
% data = xlsread(csvfilename);
% TODO hardcoding is bad
disp('Reading CSV input file');
data = xlsread(csvfilename);

disp('Extracting parameters of interest');
raw_time               = data(:,1);
raw_altitude           = data(:,2);
raw_velocity           = data(:,3);
raw_acceleration       = data(:,4);
raw_mass               = data(:,20);
raw_mass_propellant    = data(:,21);
raw_mach               = data(:,27);
raw_reynolds           = data(:,28);
raw_thrust             = data(:,29);
raw_drag_force         = data(:,30);
raw_drag_coef          = data(:,31);
raw_drag_axial_coef    = data(:,32);
raw_drag_friction_coef = data(:,33);
raw_drag_pressure_coef = data(:,34);
raw_drag_base_coef     = data(:,35);

% you must remember to remove all comment rows from the open rocket data

disp('Setting baseline time');
simulation_time = 252; % seconds
timestep        = 0.01; % seconds
t_new           = linspace(0,simulation_time,simulation_time/timestep);
t_new           = t_new.';

%% Interpolate data
% PCHIP is cubic spline
disp('Interpolating thrust data');
thrust = interp1(raw_time, raw_thrust, t_new, 'PCHIP'); 

disp('Interpolating altitude data');
openrocket_altitude = interp1(raw_time, raw_altitude, t_new, 'PCHIP'); 

disp('Interpolating velocity data');
openrocket_velocity = interp1(raw_time, raw_velocity, t_new, 'PCHIP'); 

disp('Interpolating acceleration data');
openrocket_acceleration = interp1(raw_time, raw_acceleration, t_new, 'PCHIP'); 

disp('Interpolating reynolds data');
openrocket_reynolds = interp1(raw_time, raw_reynolds, t_new, 'PCHIP'); 

disp('Interpolating drag coef data');
openrocket_drag_coef  = interp1(raw_time, raw_drag_coef, t_new, 'PCHIP'); 

disp('Interpolating drag_axial coef data');
openrocket_drag_axial_coef  = interp1(raw_time, raw_drag_axial_coef, t_new, 'PCHIP'); 

disp('Interpolating drag_friction coef data');
openrocket_drag_friction_coef  = interp1(raw_time, raw_drag_friction_coef, t_new, 'PCHIP'); 

disp('Interpolating drag_pressure coef data');
openrocket_drag_pressure_coef  = interp1(raw_time, raw_drag_pressure_coef, t_new, 'PCHIP'); 

disp('Interpolating drag_base coef data');
openrocket_drag_base_coef  = interp1(raw_time, raw_drag_base_coef, t_new, 'PCHIP'); 

disp('Interpolating drag force data');
openrocket_drag_force = interp1(raw_time, raw_drag_force, t_new, 'PCHIP'); 

disp('Interpolating Mass data');
openrocket_mass = interp1(raw_time, raw_mass, t_new, 'PCHIP'); 
% convert to kg
openrocket_mass = openrocket_mass / 1000;

disp('Interpolating Mass data');
openrocket_mass_propellant = interp1(raw_time, raw_mass_propellant, t_new, 'PCHIP'); 
% convert to kg
openrocket_mass_propellant = openrocket_mass_propellant / 1000;

disp('Interpolating Mach data');
openrocket_mach = interp1(raw_time, raw_mach, t_new, 'PCHIP'); 

%% Transpose data
disp('Transposing data');
thrust_curve(1,:)    = t_new.';
thrust_curve(2,:)    = thrust.';

%% Write thrust to matfile
save ('thrust_curve_mclass.mat','-v7.3','thrust_curve');

%% Assign to workspace variables
assignin( 'base' , 'simtime'                       , t_new );
assignin( 'base' , 'openrocket_altitude'           , openrocket_altitude );
assignin( 'base' , 'openrocket_reynolds'           , openrocket_reynolds );
assignin( 'base' , 'openrocket_velocity'           , openrocket_velocity );
assignin( 'base' , 'openrocket_acceleration'       , openrocket_acceleration );
assignin( 'base' , 'openrocket_drag_coef'          , openrocket_drag_coef );
assignin( 'base' , 'openrocket_drag_axial_coef'    , openrocket_drag_axial_coef );
assignin( 'base' , 'openrocket_drag_friction_coef' , openrocket_drag_friction_coef );
assignin( 'base' , 'openrocket_drag_pressure_coef' , openrocket_drag_pressure_coef );
assignin( 'base' , 'openrocket_drag_base_coef'     , openrocket_drag_base_coef );
assignin( 'base' , 'openrocket_drag_force'         , openrocket_drag_force );
assignin( 'base' , 'openrocket_mass'               , openrocket_mass );
assignin( 'base' , 'openrocket_mass_propellant'    , openrocket_mass_propellant );
assignin( 'base' , 'openrocket_mach'               , openrocket_mach );

assignin( 'base' , 'openrocket_thrust' , thrust );

%% Cleanup
clearvars ans;

disp('Done');
