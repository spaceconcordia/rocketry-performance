%% Globals
upperbound = 5;
lowerbound = 2;

%% Plot shaded region for competition bounds
x1 = Rocksim_Time;
y1 = linspace(upperbound,upperbound,size(Rocksim_Time,1));
y2 = linspace(lowerbound,lowerbound,size(Rocksim_Time,1));

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

%% Plot stability error
ha = shadedplot(x1, y1, y2, [0.7, 1, 0.7], 'r'); %first area is red
hold on;

%matlab_plot = plot(tout, static_stability_margin, 'm--*')

openrocket_plot = plot(...
    openrocket_VarName1(1:indexmax_openrocket), ...
    openrocket_Stabilitymargincalibers(1:indexmax_openrocket), ...
    'b--.' ...
);

%{
rasaero_plot = plot( ...
    rasaero_Timesec(1:indexmax_rasaero), ...
    rasaero_Altitudeft(1:indexmax_rasaero), ...
    'c--o' ...
);
%}

rocksim_plot = plot( ...
    Rocksim_Time(1:indexmax_Rocksim), ...
    Rocksim_StaticstabilitymarginCalibers(1:indexmax_Rocksim), ...
    'k- .' ...
);

hold off;

h_legend = legend(...
    [openrocket_plot, rocksim_plot],...
    'OpenRocket','Rocksim', ...
    'location', 'southeast' ...
);
set(h_legend,'FontSize',12);
set(h_legend,'FontName','Courier New');

%% Graph details
clear title xlabel ylabel
title('Stability Margin (calibers) vs Time');
grid on;
xlabel('Time (s)');
ylabel('Calibers');
ylim([0,5]);

%% conditionally save the plot
if exist('saveplots')
    if saveplots
        saveas(gcf, 'documentation/images/plots/error_stability_calibers_plot.png');
        export_fig error_altitude_plot.png -m2
    end
end
