%% Import Rocket Design Data
ord = confirm('Update OpenRocket Data for thrust curve and validation?');
if ord
    fprintf ( 'Updating OpenRocket Data ... ' );
    openrocket_data_import('aurelius_openrocket_simulation.csv','');
    disp ( 'Done' );
    fprintf( 'Maximum OpenRocket altitude: %d m, %d ft \r\n', max(openrocket_altitude), max(openrocket_altitude)*3.28);
end

dpm = confirm('Update Parametric Data?');
if dpm
    fprintf ( 'Updating Parametric Data ... ' );
    data_parametric_model;
    disp ( 'Done' );
end

%% Run Simulation
vftm = confirm('Run VerticalFlight_TestModel?');
if vftm
    fprintf ( 'Running Simulation ... ' );
    sim('VerticalFlight_TestModel');
    disp ( 'Done' );
    
    timetoapogee
    
    fprintf( 'Maximum Matlab Altitude: %d m, %d ft \r\n', max(altitude), max(altitude)*3.28);
end

rftm = confirm('Run RocketFlight_TestModel?');
if rftm
    fprintf ( 'Running Simulation ... ' );
    sim('RocketFlight_TestModel');
    disp ( 'Done' );
    
    timetoapogee
    
    fprintf( 'Maximum Matlab Altitude: %d m, %d ft \r\n', max(altitude), max(altitude)*3.28);
end

%% Plotting
plotoutput = confirm('Plot output?');
if plotoutput
    saveplots = confirm('Save plots (takes additional time)?');
    fprintf ( 'Plotting output ... ' );
    plot_rocket_dynamics
    plot_rocket_kinematics
    plot_rocket_atmosphere
    plot_rocket_drag_time
    plot_rocket_drag_velocity
    plot_rocket_drag_mach
    plot_rocket_drag_coef
end

validate = confirm('Validate against OpenRocket?');
if validate
   timetoapogee_openrocket
   plot_openrocket_validation 
end

disp ( 'Done' );

%--------------------------------------------------------------------------
% TODO write data to output CSV
%--------------------------------------------------------------------------

disp ( 'Done!' );
