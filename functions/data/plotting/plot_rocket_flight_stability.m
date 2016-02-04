%% Find value index of apogee for each source
% OpenRocket
indexmax_openrocket       = find(max(openrocket_Altitude) == openrocket_Altitude);
time_to_apogee_openrocket = openrocket_VarName1(indexmax_openrocket);
openrocket_altitude_max   = openrocket_Altitude(indexmax_openrocket);
openrocket_altitude_max   = openrocket_altitude_max(1)*meter2feet;

% RasAero
indexmax_rasaero       = find(max(rasaero_Altitudeft) == rasaero_Altitudeft);
time_to_apogee_rasaero = rasaero_Timesec(indexmax_rasaero);
rasaero_altitude_max   = rasaero_Altitudeft(indexmax_rasaero);
rasaero_altitude_max   = rasaero_altitude_max;

% RockSim
indexmax_Rocksim       = find(max(Rocksim_AltitudeFeet) == Rocksim_AltitudeFeet);
time_to_apogee_Rocksim = Rocksim_Time(indexmax_Rocksim);
Rocksim_altitude_max   = Rocksim_AltitudeFeet(indexmax_Rocksim);
Rocksim_altitude_max   = Rocksim_altitude_max;

%% Plot shaded region for competition bounds
x1 = rasaero_Timesec(1:indexmax_rasaero);
y1 = linspace(upperbound,upperbound,size(rasaero_Timesec(1:indexmax_rasaero),1));
y2 = linspace(lowerbound,lowerbound,size(rasaero_Timesec(1:indexmax_rasaero),1));

rasaero_aoa              = plot( ...
    rasaero_Timesec(1:indexmax_rasaero), ...
    rasaero_AngleofAttackdeg(1:indexmax_rasaero), ...
    'c--o' ...
);
hold on;

matlab_aoa = plot( ...
    tout, ...
    angular_position*180/pi, ...
    'm--*' ...
);

%{
rasaero_pitch_attitude   = plot( ...
    rasaero_Timesec(1:indexmax_rasaero), ...
    rasaero_PitchAttitudedeg(1:indexmax_rasaero), ...
    'c--o' ...
);
%}

%{
rocksim_flight_angle     = plot( ...
    Rocksim_Time(1:indexmax_Rocksim), ...
    Rocksim_FlightangleDeg(1:indexmax_Rocksim), ...
    'k- .'
);
%}

rocksim_aoa              = plot( ...
    Rocksim_Time(1:indexmax_Rocksim), ...
    Rocksim_WindangleofattackDeg(1:indexmax_Rocksim), ...
    'k- .' ...
);

%{
openrocket_wind_veloctiy = plot( ...
    openrocket_VarName1(1:indexmax_openrocket), ...
    openrocket_Windvelocityms(1:indexmax_openrocket), ...
    'b--.' ...
);
%}

%{
openrocket_pitch_rate    = plot( ...
    openrocket_VarName1(1:indexmax_openrocket), ...
    openrocket_Pitchrates(1:indexmax_openrocket), ...
    'b--.' ...
);
%}
hold off;

h_legend = legend( ...
    [rasaero_aoa, rocksim_aoa, matlab_aoa], ...
    'RASAero AOA', 'RockSim AOA', 'Matlab AOA' ...
);

set(h_legend,'FontSize',12);
set(h_legend,'FontName','Courier New');

%% Graph details
clear title xlabel ylabel
title('Angle-of-Attack vs Time');
grid on;
xlabel('Time (s)');
ylabel('Angle of Attack (deg)');
xlim([0,25]);
ylim([-2,5]);

%% conditionally save the plot
if exist('saveplots')
    if saveplots
        saveas(gcf, 'documentation/images/plots/error_aoa_plot.png');
        export_fig error_aoa_plot.png -m2
    end
end
