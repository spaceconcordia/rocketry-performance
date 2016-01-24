%% Import Rocket Design Data
ord = confirm('Import thrust curve (needed to launch simulation)?');
if ord
    fprintf ( 'Updating Thrust Data ... ' );
    openrocket_data_import('aurelius_openrocket_simulation.csv','');
    disp ( 'Done' );
    fprintf( 'Maximum OpenRocket altitude: %d m, %d ft \r\n', max(openrocket_altitude), max(openrocket_altitude)*3.28);
end

dpm = confirm('Update Parametric Data (needed to launch simulation)?');
if dpm
    fprintf ( 'Updating Parametric Data ... ' );
    data_parametric_model;
    disp ( 'Done' );
end

%% Run Simulation
vftm = confirm('Run VerticalFlight_TestModel (zero angle of attack)?');
if vftm
    fprintf ( 'Running VerticalFlight Simulation ... ' );
    sim('VerticalFlight_TestModel');
    disp ( 'Done' );
    
    timetoapogee
    
    fprintf( 'Maximum Matlab Altitude: %d m, %d ft \r\n', max(altitude), max(altitude)*3.28);
end

rftm = confirm('Run RocketFlight_TestModel (inital disturbance, testing stability?');
if rftm
    fprintf ( 'Running RocketFlight Simulation ... ' );
    sim('RocketFlight_TestModel');
    disp ( 'Done' );
    
    timetoapogee
    
    fprintf( 'Maximum Matlab Altitude: %d m, %d ft \r\n', max(altitude), max(altitude)*3.28);
    fprintf( 'Average Damping Ratio:  %d \r\n', mean(rocket_damping_ratio));
end

%% Plotting
plotoutput = confirm('Plot output?');
if plotoutput
   saveplots = confirm('Save plots (takes additional time)?');
   fprintf ( 'Plotting output ... ' );
   timetoapogee_openrocket
   import_openrocket_data
   import_rocksim_data
   import_rasaero_aero
   import_rasaero_flight
   plot_error
   plot_rocket_angular_flight
end

disp ( 'Done' );

%--------------------------------------------------------------------------
% TODO write data to output CSV
%--------------------------------------------------------------------------

disp ( 'Done!' );
