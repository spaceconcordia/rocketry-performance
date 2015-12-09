if exist('openrocket_time')
else
    plot_openrocket_validation_prepare
end;

%--------------------------------------------------------------------------------
% Motor Performance
%--------------------------------------------------------------------------------

matlab_motor_data = {
    thrust,...
    mass,...
    mass_propellant,...
};

openrocket_motor_data = {
    openrocket_thrust(1:arraysize),...
    openrocket_mass(1:arraysize),...
    openrocket_mass_propellant(1:arraysize),...
};

%--------------------------------------------------------------------------------
% Motor Performance
%--------------------------------------------------------------------------------

%% Set the graph attributes
openrocket_xdata    = {openrocket_time, openrocket_time, openrocket_time};
matlab_xdata        = {tout, tout, tout};
ylabel              = {'Motor Thrust','Rocket Mass','Propellant Mass'};
matlab_linespec     = {'b','b','b'};
openrocket_linespec = {'b','b','b'};

%% Plot
multiplot(openrocket_xdata, openrocket_motor_data, 'YLabel', ylabel, ...
 'LineSpec', openrocket_linespec, 'Title', 'OpenRocket - Motor (t)', 'XLabel', 'time');

%% Conditionally save the plot
%{
if exist('saveplots')
    if saveplots
        saveas(gcf, '../documentation/images/plots/error_drag_plot.png');
        export_fig error_drag_plot.png -m2
    end
end
%}

multiplot(matlab_xdata, matlab_motor_data, 'YLabel', ylabel, ...
 'LineSpec', matlab_linespec, 'Title', 'Matlab - Motor (t)', 'XLabel', 'time');

%% Conditionally save the plot
%{
if exist('saveplots')
    if saveplots
        saveas(gcf, '../documentation/images/plots/error_drag_plot.png');
        export_fig error_drag_plot.png -m2
    end
end
%}
