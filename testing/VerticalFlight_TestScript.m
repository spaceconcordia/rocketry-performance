%% Import Rocket Design Data
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

disp ( 'Done' );

%--------------------------------------------------------------------------
% TODO write data to output CSV
%--------------------------------------------------------------------------

disp ( 'Done!' );
