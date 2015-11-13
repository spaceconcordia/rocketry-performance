%--------------------------------------------------------------------------
% Import Rocket Design Data
%--------------------------------------------------------------------------
data_parametric_model;

sim('VerticalFlight_TestModel');

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
