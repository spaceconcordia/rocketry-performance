if confirm('Validate Drag data?')
else
     return
end

arraysize       = size(tout,1);
openrocket_time = openrocket_VarName1(1:arraysize);

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
    openrocket_Dragcoefficient,...
    openrocket_Reynoldsnumber,...
    openrocket_Frictiondragcoefficient,...
    openrocket_Pressuredragcoefficient,...
    openrocket_Basedragcoefficient,...
};

%--------------------------------------------------------------------------------
% Drag performance VS TIME
%--------------------------------------------------------------------------------

%% Set the graph attributes
ylabel              = {'Drag Coefficient','Reynolds Number','Friction Drag Coefficient','Pressure Drag Coefficient','Base Drag Coefficient'};
matlab_linespec     = {'b','b','b','b','b'};
openrocket_linespec = {'b','b','b','b','b'};

%% Plot
%{
multiplot(openrocket_xdata, openrocket_drag_data, 'YLabel', ylabel, ...
 'LineSpec', openrocket_linespec, 'Title', 'OpenRocket - Drag Vs Time', 'XLabel', 'time');
%}

%% Conditionally save the plot
%{
if exist('saveplots')
    if saveplots
        saveas(gcf, '../documentation/images/plots/error_drag_plot.png');
        export_fig error_drag_plot.png -m2
    end
end
%}

%{
multiplot(matlab_xdata, matlab_drag_data, 'YLabel', ylabel, ...
 'LineSpec', matlab_linespec, 'Title', 'Matlab Drag Vs Time', 'XLabel', 'time');
%}

%% Conditionally save the plot
%{
if exist('saveplots')
    if saveplots
        saveas(gcf, '../documentation/images/plots/error_drag_plot.png');
        export_fig error_drag_plot.png -m2
    end
end
%}

%--------------------------------------------------------------------------------
%% Drag performance VS MACH
%--------------------------------------------------------------------------------

openrocket_xdata        = {openrocket_Machnumber, openrocket_Machnumber, openrocket_Machnumber, openrocket_Machnumber, openrocket_Machnumber};

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

xlim([0,0.9]);

multiplot(matlab_xdata, matlab_drag_data, 'YLabel', ylabel, ...
 'LineSpec', matlab_linespec, 'Title', 'Matlab Drag Vs Mach', 'XLabel', 'Mach Number');

figure;
plot_openrocket_drag_coef_v_mach
figure;
plot_rocket_drag_coef_v_mach
