%--------------------------------------------------------------------------
% Import Rocket Design Data
%--------------------------------------------------------------------------
disp ( 'Updating Parametric Data...' );
%data_parametric_model;

disp ( 'Running Simulation...' );
sim('VerticalFlight_TestModel');

disp ( 'Plotting output...' );
%--------------------------------------------------------------------------
% Dynamics Plot
%--------------------------------------------------------------------------
xdata = {tout, tout, tout};
ydata = {mass, weight, thrust};
ylabel = {'Mass (kg)','Weight (N)','Thrust (N)'};
linespec = {'b-*','b:+','b'};
multiplot(xdata, ydata, 'YLabel', ylabel, ...
 'LineSpec', linespec, 'Title', 'Dynamics Plot', 'XLabel', 'time');

%--------------------------------------------------------------------------
% Kinematics Figure
%--------------------------------------------------------------------------
xdata = {tout, tout, tout};
ydata = {altitude, velocity, acceleration};
ylabel = {'Altitude (m)','Velocity (m/s)','Altitude (m/s^2)'};
linespec = {'b-*','b:+','b'};
multiplot(xdata, ydata, 'YLabel', ylabel, ...
 'LineSpec', linespec, 'Title', 'Kinematics Plot', 'XLabel', 'time');

%--------------------------------------------------------------------------
% ISA Model Figure
%--------------------------------------------------------------------------
xdata = {tout, tout, tout, tout, tout};
ydata = {local_temperature, local_pressure, local_density, local_absolute_viscosity, local_kinematic_viscosity};
ylabel = {'Local Temperature (K)','Local Pressure (kPa)','Local Density (kg/m^3)','Local Absolute Viscosity','Local Kinematic Viscosity'};
linespec = {'b','b','b','b','b'};
multiplot(xdata, ydata, 'YLabel', ylabel, ...
 'LineSpec', linespec, 'Title', 'ISA Model Plot', 'XLabel', 'time');

%--------------------------------------------------------------------------
% Drag Model Figure
%--------------------------------------------------------------------------
%xdata = {tout, tout, tout};
xdata = {tout, tout};
%ydata = {drag_force, drag_coefficient, reynolds_number};
ydata = {drag_force, drag_coefficient};
%ylabel = {'Drag Force (N)','Drag Coefficient','Reynolds Number'};
ylabel = {'Drag Force (N)','Drag Coefficient'};
%linespec = {'b-*','b:+','b'};
linespec = {'b-*','b:+'};
multiplot(xdata, ydata, 'YLabel', ylabel, ...
 'LineSpec', linespec, 'Title', 'Drag vs. Time Plot', 'XLabel', 'time');

%--------------------------------------------------------------------------
% Drag Model Figure
%--------------------------------------------------------------------------
%xdata = {velocity, velocity, velocity};
xdata = {velocity, velocity};
%ydata = {drag_force, drag_coefficient, reynolds_number(:,:,:)};
ydata = {drag_force, drag_coefficient};
ylabel = {'Drag Force (N)','Drag Coefficient'};
%linespec = {'b-*','b:+','b'};
linespec = {'b-*','b:+'};
multiplot(xdata, ydata, 'YLabel', ylabel, ...
 'LineSpec', linespec, 'Title', 'Drag vs. Velocity Plot', 'XLabel', 'Velocity (m/s)');

%--------------------------------------------------------------------------
% TODO write data to output CSV
%--------------------------------------------------------------------------

disp ( 'Done!' );
