%% Import Rocket Design Data
%clear;
fprintf ( 'Updating Parametric Data ... ' );
data_parametric_model('Parametric_Data.xlsm');
clearvars filename filen filep;
disp ( 'Done' );

%% Import thrust curve
fprintf ( 'Updating Thrust Data ... ' );
import_thrust_curve_M1830
disp ( 'Done' );

%% Run Simulation
fprintf ( 'Running RocketFlight Simulation ... ' );
sim('RocketFlight_TestModel');
disp ( 'Done' );

timetoapogee

fprintf( 'Maximum Matlab Altitude: %d m, %d ft \r\n', max(altitude), max(altitude)*3.28);
fprintf( 'Average Damping Ratio:  %d \r\n', mean(rocket_damping_ratio));

indexguide = dsearchn(altitude, launch_guide_length);
matlab_guide_velocity = velocity(indexguide);
fprintf( 'Velocity leaving launch guide:              %d m/s \r',...
    matlab_guide_velocity...
);

fprintf( 'Average Damping Ratio:  %d \r\n', mean(rocket_damping_ratio));

%% Plotting
saveplots = confirm('Save plots (takes additional time)?');
fprintf ( 'Plotting output ... ' );
import_openrocket_data_worst;
import_rasaero_data;
import_rocksim_data;
plot_error_mass_v_time;
plot_error_altitude_v_time;
plot_error_mach_v_time;

% plot_output
disp ( 'Done' );

%% Done
disp ( 'Done!' );
