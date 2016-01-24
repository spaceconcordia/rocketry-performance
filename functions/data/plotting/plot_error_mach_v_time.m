%% Define globals
upperbound = 0.9
lowerbound = 0.8;

%% Find value index of apogee for each source
% OpenRocket
indexmax_matlab = find(max(altitude) == altitude)
time_to_apogee_matlab = tout(indexmax_matlab)
matlab_mach_max = altitude(indexmax_openrocket);

% OpenRocket
indexmax_openrocket = find(max(openrocket_Altitude) == openrocket_Altitude)
time_to_apogee_openrocket = openrocket_VarName1(indexmax_openrocket)
openrocket_altitude_max = openrocket_Altitude(indexmax_openrocket);

% RasAero
indexmax_rasaero = find(max(rasaero_Altitudeft) == rasaero_Altitudeft)
time_to_apogee_rasaero = rasaero_Timesec(indexmax_rasaero)
rasaero_altitude_max = rasaero_Altitudeft(indexmax_rasaero)

% RockSim
indexmax_Rocksim = find(max(Rocksim_AltitudeFeet) == Rocksim_AltitudeFeet)
time_to_apogee_Rocksim = Rocksim_Time(indexmax_Rocksim)
Rocksim_altitude_max = Rocksim_AltitudeFeet(indexmax_Rocksim)

%% Define shaded region for competition bounds
x1 = Rocksim_Time(1:indexmax_Rocksim);
y1 = linspace(upperbound,upperbound,size(Rocksim_Time(1:indexmax_Rocksim),1));
y2 = linspace(lowerbound,lowerbound,size(Rocksim_Time(1:indexmax_Rocksim),1));

%% Plot altitude error
ha = shadedplot(x1, y1, y2, [0.7, 1, 0.7], 'r'); %first area is red
hold on
matlab_plot = plot( ...
    tout(1:indexmax_matlab), ... 
    mach_number(1:indexmax_matlab), ...
    'm--*'...
);
openrocket_plot = plot( ...
    openrocket_VarName1(1:indexmax_openrocket), ...
    openrocket_Machnumber(1:indexmax_openrocket), ...
    'b--.'...
);
rasaero_plot = plot( ...
    rasaero_Timesec(1:indexmax_rasaero), ...
    rasaero_Mach(1:indexmax_rasaero), ...
    'c--o' ...
);
rocksim_plot = plot( ...
    Rocksim_Time(1:indexmax_Rocksim), ...
    Rocksim_Machnumber(1:indexmax_Rocksim), ...
    'k- .' ...
);
hold off
h_legend = legend(...
    [matlab_plot, openrocket_plot, rasaero_plot, rocksim_plot],...
    'Matlab','OpenRocket','Rasaero','Rocksim', ...
    'location', 'east' ...
);
set(h_legend,'FontSize',14);

%% Plot details
clear title xlabel ylabel
title('Mach Number vs Time');
xlabel('Time (s)');
ylabel('Mach Number');

%% save plot
if exist('saveplots')
    if saveplots
        saveas(gcf, 'documentation/images/plots/error_mach_plot.png');
        export_fig error_mach_plot.png -m2
    end
end
