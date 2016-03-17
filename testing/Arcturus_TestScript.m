%% Import Rocket Design Data
%clear;
fprintf ( 'Updating Parametric Data ... ' );
data_parametric_model('Parametric_Data_Arcturus_Mod.xlsm');
clearvars filename filen filep;
disp ( 'Done' );

%% Import thrust curve
fprintf ( 'Updating Thrust Data ... ' );
import_thrust_curve_M1540
%import_thrust_curve_M1590
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
import_arcturus_openrocket_data
import_arcturus_strattologger
plot_arcturus_analysis;
plot_output
disp ( 'Done' );

%% Done
disp ( 'Done!' );
