%%% ISA Model Figure


%% Trim the array sizes to match the smallest set
arraysize = size(tout,1)
openrocket_time = simtime(1:arraysize)

%% Set the x-axis
openrocket_xdata = {openrocket_time, openrocket_time, openrocket_time, openrocket_time, openrocket_time};
matlab_xdata = {tout, tout, tout, tout, tout};

%% Set the y-axis
matlab_ydata = {
    altitude,...
    mach_number,...
    acceleration,...
    drag_force,...
    drag_coefficient,...
};

matlab_drag_data = {
    drag_coefficient,...
    reynolds_number(:,1),...
    coef_drag_skin_friction,...
    coef_drag_fin_pressure_normalized,...
    coef_drag_base_normalized,...
};

openrocket_ydata = {
    openrocket_altitude(1:arraysize),...
    openrocket_mach(1:arraysize),...
    openrocket_acceleration(1:arraysize),...
    openrocket_drag_force(1:arraysize),...
    openrocket_drag_coef(1:arraysize),...
};

openrocket_drag_data = {
    openrocket_drag_coef(1:arraysize),...
    openrocket_reynolds(1:arraysize),...
    openrocket_drag_friction_coef(1:arraysize),...
    openrocket_drag_pressure_coef(1:arraysize),...
    openrocket_drag_base_coef(1:arraysize),...
};

%--------------------------------------------------------------------------------
% Overall performance
%--------------------------------------------------------------------------------

%% Set the graph attributes
ylabel = {'Altitude','Mach Number','Acceleration','Drag Force','Drag Coefficient'};
matlab_linespec = {'b','b','b','b','b'};
openrocket_linespec = {'b','b','b','b','b'};

%% Plot
multiplot(openrocket_xdata, openrocket_ydata, 'YLabel', ylabel, ...
 'LineSpec', openrocket_linespec, 'Title', 'OpenRocket', 'XLabel', 'time');

%% Conditionally save the plot
if saveplots 
    saveas(gcf, '../documentation/images/plots/atmosphere_plot.png');
    export_fig atmosphere_plot.pnd -m2
end

multiplot(matlab_xdata, matlab_ydata, 'YLabel', ylabel, ...
 'LineSpec', matlab_linespec, 'Title', 'Matlab', 'XLabel', 'time');

%% Conditionally save the plot
if saveplots 
    saveas(gcf, '../documentation/images/plots/atmosphere_plot.png');
    export_fig atmosphere_plot.pnd -m2
end

%--------------------------------------------------------------------------------
% Drag performance VS TIME
%--------------------------------------------------------------------------------

%% Set the graph attributes
ylabel = {'Drag Coefficient','Reynolds Number','Friction Drag Coefficient','Pressure Drag Coefficient','Base Drag Coefficient'};
matlab_linespec = {'b','b','b','b','b'};
openrocket_linespec = {'b','b','b','b','b'};

%% Plot
multiplot(openrocket_xdata, openrocket_drag_data, 'YLabel', ylabel, ...
 'LineSpec', openrocket_linespec, 'Title', 'OpenRocket - Drag Vs Time', 'XLabel', 'time');

%% Conditionally save the plot
if saveplots 
    saveas(gcf, '../documentation/images/plots/atmosphere_plot.png');
    export_fig atmosphere_plot.pnd -m2
end

multiplot(matlab_xdata, matlab_drag_data, 'YLabel', ylabel, ...
 'LineSpec', matlab_linespec, 'Title', 'Matlab Drag Vs Time', 'XLabel', 'time');

%% Conditionally save the plot
if saveplots 
    saveas(gcf, '../documentation/images/plots/atmosphere_plot.png');
    export_fig atmosphere_plot.pnd -m2
end

%--------------------------------------------------------------------------------
% Drag performance VS MACH
%--------------------------------------------------------------------------------

openrocket_mach_trimmed = openrocket_mach(1:arraysize);
openrocket_xdata = {openrocket_mach_trimmed, openrocket_mach_trimmed, openrocket_mach_trimmed, openrocket_mach_trimmed, openrocket_mach_trimmed};
matlab_xdata = {mach_number, mach_number, mach_number, mach_number, mach_number};

%% Set the graph attributes
ylabel = {'Drag Coefficient','Reynolds Number','Friction Drag Coefficient','Pressure Drag Coefficient','Base Drag Coefficient'};
matlab_linespec = {'b','b','b','b','b'};
openrocket_linespec = {'b','b','b','b','b'};

%% Plot
multiplot(openrocket_xdata, openrocket_drag_data, 'YLabel', ylabel, ...
 'LineSpec', openrocket_linespec, 'Title', 'OpenRocket - Drag Vs Mach', 'XLabel', 'time');

%% Conditionally save the plot
if saveplots 
    saveas(gcf, '../documentation/images/plots/atmosphere_plot.png');
    export_fig atmosphere_plot.pnd -m2
end

multiplot(matlab_xdata, matlab_drag_data, 'YLabel', ylabel, ...
 'LineSpec', matlab_linespec, 'Title', 'Matlab Drag Vs Mach', 'XLabel', 'time');

%% Conditionally save the plot
if saveplots 
    saveas(gcf, '../documentation/images/plots/atmosphere_plot.png');
    export_fig atmosphere_plot.pnd -m2
end
