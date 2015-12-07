arraysize       = size(tout,1);
openrocket_time = simtime(1:arraysize);

if exist('openrocket_time')
else
    plot_openrocket_validation_prepare
end;

%--------------------------------------------------------------------------------
% Drag Performance
%--------------------------------------------------------------------------------

%% Set the x-axis
openrocket_xdata = {openrocket_time, openrocket_time, openrocket_time, openrocket_time, openrocket_time};
matlab_xdata     = {tout, tout, tout, tout, tout};

matlab_drag_data = {
    drag_coefficient,...
    reynolds_number(1,:),...
    coef_drag_skin_friction,...
    coef_drag_fin_pressure_normalized,...
    coef_drag_base_normalized,...
};

openrocket_drag_data = {
    openrocket_drag_coef(1:arraysize),...
    openrocket_reynolds(1:arraysize),...
    openrocket_drag_friction_coef(1:arraysize),...
    openrocket_drag_pressure_coef(1:arraysize),...
    openrocket_drag_base_coef(1:arraysize),...
};

%--------------------------------------------------------------------------------
% Drag performance VS TIME
%--------------------------------------------------------------------------------

%% Set the graph attributes
ylabel              = {'Drag Coefficient','Reynolds Number','Friction Drag Coefficient','Pressure Drag Coefficient','Base Drag Coefficient'};
matlab_linespec     = {'b','b','b','b','b'};
openrocket_linespec = {'b','b','b','b','b'};

%% Plot
multiplot(openrocket_xdata, openrocket_drag_data, 'YLabel', ylabel, ...
 'LineSpec', openrocket_linespec, 'Title', 'OpenRocket - Drag Vs Time', 'XLabel', 'time');

%% Conditionally save the plot
if saveplots 
    %saveas(gcf, '../documentation/images/plots/atmosphere_plot.png');
    %export_fig atmosphere_plot.png -m2
end

multiplot(matlab_xdata, matlab_drag_data, 'YLabel', ylabel, ...
 'LineSpec', matlab_linespec, 'Title', 'Matlab Drag Vs Time', 'XLabel', 'time');

%% Conditionally save the plot
if saveplots 
    %saveas(gcf, '../documentation/images/plots/atmosphere_plot.png');
    %export_fig atmosphere_plot.png -m2
end

%--------------------------------------------------------------------------------
% Drag performance VS MACH
%--------------------------------------------------------------------------------

openrocket_mach_trimmed = openrocket_mach(1:arraysize);
openrocket_xdata        = {openrocket_mach_trimmed, openrocket_mach_trimmed, openrocket_mach_trimmed, openrocket_mach_trimmed, openrocket_mach_trimmed};

mach_number_trimmed     = mach_number;

matlab_xdata            = {mach_number_trimmed, mach_number_trimmed, mach_number_trimmed, mach_number_trimmed, mach_number_trimmed};

matlab_drag_data = {
    drag_coefficient,...
    reynolds_number(1,:),...
    coef_drag_skin_friction,...
    coef_drag_fin_pressure_normalized,...
    coef_drag_base_normalized,...
};

%% Set the graph attributes
ylabel              = {'Drag Coefficient','Reynolds Number','Friction Drag Coefficient','Pressure Drag Coefficient','Base Drag Coefficient'};
matlab_linespec     = {'b','b','b','b','b'};
openrocket_linespec = {'b','b','b','b','b'};

%% Plot
multiplot(openrocket_xdata, openrocket_drag_data, 'YLabel', ylabel, ...
 'LineSpec', openrocket_linespec, 'Title', 'OpenRocket - Drag Vs Mach', 'XLabel', 'Mach Number');

%% Conditionally save the plot
if saveplots 
    %saveas(gcf, '../documentation/images/plots/atmosphere_plot.png');
    %export_fig atmosphere_plot.png -m2
end

multiplot(matlab_xdata, matlab_drag_data, 'YLabel', ylabel, ...
 'LineSpec', matlab_linespec, 'Title', 'Matlab Drag Vs Mach', 'XLabel', 'Mach Number');


%% Conditionally save the plot
if saveplots 
    %saveas(gcf, '../documentation/images/plots/atmosphere_plot.png');
    %export_fig atmosphere_plot.png -m2
end

figure
subplot(2,1,1)
plot_error_drag_mach
subplot(2,1,2)
plot_error_coeffrictiondrag_mach


