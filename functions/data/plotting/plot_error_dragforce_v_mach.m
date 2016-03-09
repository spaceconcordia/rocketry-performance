lbf2newton = 4.4482216152605;

%% Find value index of apogee for each source
% OpenRocket
indexmax_openrocket = find(max(openrocket_Altitude) == openrocket_Altitude);
time_to_apogee_openrocket = openrocket_VarName1(indexmax_openrocket);
openrocket_altitude_max = openrocket_Altitude(indexmax_openrocket);

% RasAero
indexmax_rasaero = find(max(rasaero_Altitudeft) == rasaero_Altitudeft);
time_to_apogee_rasaero = rasaero_Timesec(indexmax_rasaero);
rasaero_altitude_max = rasaero_Altitudeft(indexmax_rasaero);

% RockSim
indexmax_Rocksim = find(max(Rocksim_AltitudeFeet) == Rocksim_AltitudeFeet);
time_to_apogee_Rocksim = Rocksim_Time(indexmax_Rocksim);
Rocksim_altitude_max = Rocksim_AltitudeFeet(indexmax_Rocksim);

%% Plot drag coef v mach number
matlab_plot = plot(mach_number, drag_force, 'm--*')
hold on
openrocket_plot = plot(...
    openrocket_Machnumber(1:indexmax_openrocket), ...
    openrocket_Dragforce(1:indexmax_openrocket), ...
    'b--.'...
);
rasaero_plot = plot( ...
    rasaero_Mach(1:indexmax_rasaero), ...
    rasaero_Draglb(1:indexmax_rasaero)*lbf2newton, ...
    'c--o' ...
);
rocksim_plot = plot( ...
    Rocksim_Machnumber(1:indexmax_Rocksim), ...
    Rocksim_DragforceN(1:indexmax_Rocksim), ...
    'k- .' ...
);
hold off

    [matlab_plot, openrocket_plot, rasaero_plot, rocksim_plot],...
h_legend = legend(...
    'Matlab','OpenRocket','Rasaero','Rocksim', ...
    'location', 'southeast' ...
);
set(h_legend,'FontSize',12);
set(h_legend,'FontName','Courier New');

%% Graph Details
clear title xlabel ylabel
grid on;
title('Drag Force vs Mach Number');
xlabel('Mach Number');
ylabel('Drag Force (N)');
xlim([0,1]);

%% save plot
if exist('saveplots')
    if saveplots
        saveas(gcf, 'documentation/images/plots/error_dragforce_plot.png');
        export_fig error_dragforce_plot.png -m2
    end
end
