%% Import Rocket Design Data
fprintf ( 'Updating Parametric Data ... ' );
%data_parametric_model;
disp ( 'Done' );

%% Run Simulation
fprintf ( 'Running Simulation ... ' );
%sim('VerticalFlight_TestModel');
disp ( 'Done' );

%% Plotting
fprintf ( 'Plotting output ... ' );

plot_rocket_dynamics

plot_rocket_kinematics

plot_rocket_atmosphere

plot_rocket_drag_time

plot_rocket_drag_velocity

plot_rocket_drag_mach

plot_rocket_drag_coef

disp ( 'Done' );

%--------------------------------------------------------------------------
% TODO write data to output CSV
%--------------------------------------------------------------------------

disp ( 'Done!' );
