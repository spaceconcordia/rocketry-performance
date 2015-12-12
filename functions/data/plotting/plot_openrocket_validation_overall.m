if confirm('Validate overall data?')
else
     return
end

if isempty(openrocket_time)
    plot_openrocket_validation_prepare
end;


%% Set the x-axis
openrocket_xdata = {openrocket_time, openrocket_time, openrocket_time, openrocket_time, openrocket_time};
matlab_xdata     = {tout, tout, tout, tout, tout};

%% Set the y-axis

matlab_ydata = {
    altitude,...
    velocity,...
    acceleration,...
    thrust,...
    drag_force,...
};

openrocket_ydata = {
    openrocket_altitude(1:arraysize),...
    openrocket_velocity(1:arraysize),...
    openrocket_acceleration(1:arraysize),...
    openrocket_thrust(1:arraysize),...
    openrocket_drag_force(1:arraysize),...
};

%% Set the graph attributes
ylabel              = {'Altitude','Velocity','Acceleration','Thrust','Drag Force'};
matlab_linespec     = {'b','b','b','b','b'};
openrocket_linespec = {'b','b','b','b','b'};

%% Plot
multiplot(openrocket_xdata, openrocket_ydata, 'YLabel', ylabel, ...
 'LineSpec', openrocket_linespec, 'Title', 'OpenRocket', 'XLabel', 'time');

%% Conditionally save the plot
%{
if exist('saveplots')
    if saveplots
        saveas(gcf, '../documentation/images/plots/error_drag_plot.png');
        export_fig error_drag_plot.png -m2
    end
end
%}

multiplot(matlab_xdata, matlab_ydata, 'YLabel', ylabel, ...
 'LineSpec', matlab_linespec, 'Title', 'Matlab', 'XLabel', 'time');

%% Conditionally save the plot
%{
if exist('saveplots')
    if saveplots
        saveas(gcf, '../documentation/images/plots/error_drag_plot.png');
        export_fig error_drag_plot.png -m2
    end
end
%}
