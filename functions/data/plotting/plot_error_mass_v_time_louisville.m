lbf2newton = 4.4482216152605;
ounce2kilogram = .02834952;
newton2kilogram = 9.81;
lbf2kilogram = lbf2newton / newton2kilogram;
ft2meter = 1/3.28;
in2meter = 1/12/3.28;

%% Find value index of apogee for each source
% OpenRocket
indexmax_openrocket = find(max(openrocket_Altitudem) == openrocket_Altitudem);
time_to_apogee_openrocket = openrocket_VarName1(indexmax_openrocket);
openrocket_altitude_max = openrocket_Altitudem(indexmax_openrocket);

%% Thrust vs time
subplot(5,1,1);
matlab_plot_1 = plot(tout, thrust, 'm--*');
hold on;
openrocket_plot_1 = plot(...
    openrocket_VarName1(1:indexmax_openrocket), ...
    openrocket_ThrustN(1:indexmax_openrocket), ...
    'b--.'...
);
hold off;

h_legend = legend(...
    [matlab_plot_1, openrocket_plot_1],...
    'Matlab','OpenRocket', ...
    'location', 'northeast' ...
);
set(h_legend,'FontSize',14);
set(h_legend,'FontName','Courier New');

clear title xlabel ylabel
title('Thrust vs Time');
ylabel('Thrust (N)');
xlabel('Time (s)');

%% Mass vs Time
subplot(5,1,2)

matlab_plot_2 = plot(tout, mass, 'm--*');
hold on;
openrocket_plot_2 = plot(...
    openrocket_VarName1(1:indexmax_openrocket), ...
    openrocket_Massg(1:indexmax_openrocket)/1000, ...
    'b--.'...
);
hold off

h_legend_2 = legend(...
    [matlab_plot_2, openrocket_plot_2],...
    'Matlab','OpenRocket', ...
    'location', 'northeast' ...
);
set(h_legend_2,'FontSize',12);
set(h_legend_2,'FontName','Courier New');

clear title xlabel ylabel
title('Mass vs Time');
ylabel('Mass (kg)');
xlabel('Time (s)');

%% COP vs time
subplot(5,1,3)

matlab_plot_3 = plot(tout, cop_rocket, 'm--*');
hold on;
openrocket_plot_3 = plot(...
    openrocket_VarName1(1:indexmax_openrocket), ...
    openrocket_CPlocationcm(1:indexmax_openrocket)/100, ...
    'b--.'...
);
hold off

h_legend_3 = legend(...
    [matlab_plot_3, openrocket_plot_3],...
    'Matlab','OpenRocket', ...
    'location', 'northeast' ...
);
set(h_legend_2,'FontSize',12);
set(h_legend_2,'FontName','Courier New');

clear title xlabel ylabel
title('COP vs Time');
ylabel('COP (m)');
xlabel('Time (s)');

%% COG vs time
subplot(5,1,4)

matlab_plot_3 = plot(tout, cog_rocket, 'm--*');
hold on;
openrocket_plot_3 = plot(...
    openrocket_VarName1(1:indexmax_openrocket), ...
    openrocket_CGlocationcm(1:indexmax_openrocket)/100, ...
    'b--.'...
);
hold off

h_legend_3 = legend(...
    [matlab_plot_3, openrocket_plot_3],...
    'Matlab','OpenRocket', ...
    'location', 'northeast' ...
);
set(h_legend_2,'FontSize',12);
set(h_legend_2,'FontName','Courier New');

clear title xlabel ylabel
title('COG vs Time');
ylabel('COG (m)');
xlabel('Time (s)');

%% I_L vs time
subplot(5,1,5)

matlab_plot_3 = plot(tout, rocket_moment_inertia_long, 'm--*');
hold on;
openrocket_plot_3 = plot(...
    openrocket_VarName1(1:indexmax_openrocket), ...
    openrocket_Longitudinalmomentofinertiakgm(1:indexmax_openrocket), ...
    'b--.'...
);
hold off

h_legend_3 = legend(...
    [matlab_plot_3, openrocket_plot_3],...
    'Matlab','OpenRocket', ...
    'location', 'northeast' ...
);
set(h_legend_2,'FontSize',12);
set(h_legend_2,'FontName','Courier New');

clear title xlabel ylabel
title('I_L vs Time');
ylabel('I_l (m^4)');
xlabel('Time (s)');

%% Conditionally save the plot
if exist('saveplots')
    if saveplots
        saveas(gcf, 'documentation/images/plots/error_mass_v_time_plot.png');
        export_fig error_drag_plot.png -m2
    end
end
