%% Find value index of apogee for each source
% OpenRocket
indexmax_openrocket = find(max(openrocket_Altitudem) == openrocket_Altitudem);
time_to_apogee_openrocket = openrocket_VarName1(indexmax_openrocket);
openrocket_altitude_max = openrocket_Altitudem(indexmax_openrocket);

% RasAero
indexmax_rasaero = find(max(rasaero_Altitudeft) == rasaero_Altitudeft);
time_to_apogee_rasaero = rasaero_Timesec(indexmax_rasaero);
rasaero_altitude_max = rasaero_Altitudeft(indexmax_rasaero);

% RockSim
indexmax_Rocksim = find(max(Rocksim_AltitudeFeet) == Rocksim_AltitudeFeet);
time_to_apogee_Rocksim = Rocksim_Time(indexmax_Rocksim);
Rocksim_altitude_max = Rocksim_AltitudeFeet(indexmax_Rocksim);

figure;
title ('Matlab - Rocket Damping Ratio');
optimum_plot = plot(tout, sqrt(2)/2, 'r');
hold on;
matlab_plot = plot( ...
    tout, ...
     rocket_damping_ratio, 'm--*' ...
);
openrocket_plot = plot( ...
    openrocket_VarName1(1:indexmax_openrocket), ...
    openrocket_DampingRatio(1:indexmax_openrocket), ...
    'b--.' ...
);
rocksim_plot = plot( ...
    Rocksim_Time(1:indexmax_Rocksim), ...
    Rocksim_DampingRatio(1:indexmax_Rocksim), ...
    'k- .' ...
);
hold off;
ylim([0,1]);

h_legend = legend(...
    'Optimal Damping' , 'Matlab'  , 'Openrocket' , 'Rocksim' , ...
    'location'        , 'east'...
);
set(h_legend,'FontSize',14);
set(h_legend,'FontName','Courier New');

clear title xlabel ylabel
title('Rocket Damping Ratio');
ylabel('Mass (kg)');
xlabel('Time (s)');

%plot (tout, coef_damping_aero + coef_damping_jet, 'k');
%plot (tout, coef_moment_corrective','r');
%plot (openrocket_VarName1, openrocket_Pitchdampingcoefficient, 'k');
%plot (openrocket_VarName1, openrocket_Pitchmomentcoefficient','r');
%plot (Rocksim_Time, Rocksim_Dampingmomentcoefficient, 'k');
%plot (Rocksim_Time, Rocksim_Correctivemomentcoefficient','r');
