import_openrocket_data
import_rocksim_data
import_rasaero_data

% Interpolation for plotting

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
assignin( 'base' , strcat(prefix,'simtime')                       , t_new );
assignin( 'base' , strcat(prefix,'openrocket_altitude')           , openrocket_altitude );
assignin( 'base' , strcat(prefix,'openrocket_reynolds')           , openrocket_reynolds );
assignin( 'base' , strcat(prefix,'openrocket_velocity')           , openrocket_velocity );
assignin( 'base' , strcat(prefix,'openrocket_acceleration')       , openrocket_acceleration );
assignin( 'base' , strcat(prefix,'openrocket_drag_coef')          , openrocket_drag_coef );
assignin( 'base' , strcat(prefix,'openrocket_drag_axial_coef')    , openrocket_drag_axial_coef );
assignin( 'base' , strcat(prefix,'openrocket_drag_friction_coef') , openrocket_drag_friction_coef );
assignin( 'base' , strcat(prefix,'openrocket_drag_pressure_coef') , openrocket_drag_pressure_coef );
assignin( 'base' , strcat(prefix,'openrocket_drag_base_coef')     , openrocket_drag_base_coef );
assignin( 'base' , strcat(prefix,'openrocket_drag_force')         , openrocket_drag_force );
assignin( 'base' , strcat(prefix,'openrocket_mass')               , openrocket_mass );
assignin( 'base' , strcat(prefix,'openrocket_mass_propellant')    , openrocket_mass_propellant );
assignin( 'base' , strcat(prefix,'openrocket_mach')               , openrocket_mach );

assignin( 'base' , 'openrocket_thrust' , thrust );
