%% Globals
meter2feet = 3.28; 
upperbound = 12500/meter2feet;
lowerbound = 8500/meter2feet;

%% Find value index of apogee for each source
% OpenRocket
indexmax_openrocket = find(max(openrocket_Altitudem) == openrocket_Altitudem);
time_to_apogee_openrocket = openrocket_VarName1(indexmax_openrocket);
openrocket_altitude_max = openrocket_Altitudem(indexmax_openrocket);
openrocket_altitude_max = openrocket_altitude_max(1)*meter2feet;

% RasAero
indexmax_rasaero = find(max(rasaero_Altitudeft) == rasaero_Altitudeft);
time_to_apogee_rasaero = rasaero_Timesec(indexmax_rasaero);
rasaero_altitude_max = rasaero_Altitudeft(indexmax_rasaero);
rasaero_altitude_max = rasaero_altitude_max;

% RockSim
indexmax_Rocksim = find(max(Rocksim_AltitudeFeet) == Rocksim_AltitudeFeet);
time_to_apogee_Rocksim = Rocksim_Time(indexmax_Rocksim);
Rocksim_altitude_max = Rocksim_AltitudeFeet(indexmax_Rocksim);
Rocksim_altitude_max = Rocksim_altitude_max;

%% Plot shaded region for competition bounds
x1 = rasaero_Timesec(1:indexmax_rasaero);
y1 = linspace(upperbound,upperbound,size(rasaero_Timesec(1:indexmax_rasaero),1));
y2 = linspace(lowerbound,lowerbound,size(rasaero_Timesec(1:indexmax_rasaero),1));

%% Plot altitude error
figure;
matlab_plot = plot(tout, altitude, 'm--*');
hold on;
openrocket_plot = plot(...
    openrocket_VarName1(1:indexmax_openrocket), ...
    openrocket_Altitudem(1:indexmax_openrocket), ...
    'b--.'...
);
rasaero_plot = plot( ...
    rasaero_Timesec(1:indexmax_rasaero), ...
    rasaero_Altitudeft(1:indexmax_rasaero)/meter2feet, ...
    'c--o' ...
);
rocksim_plot = plot( ...
    Rocksim_Time(1:indexmax_Rocksim), ...
    Rocksim_AltitudeFeet(1:indexmax_Rocksim)/meter2feet, ...
    'k- .' ...
);
ha = shadedplot(x1, y1, y2, [0.7, 1, 0.7], 'r'); %first area is red
hold off;

h_legend = legend(...
    [matlab_plot, openrocket_plot , rasaero_plot, rocksim_plot] , ...
    strcat('Matlab       :' , sprintf('%0.2f' , floor( max(altitude)*meter2feet) ) , ' ft')        , ...
    strcat('OpenRocket   :' , sprintf('%0.2f' , openrocket_altitude_max(1))        , ' ft')        , ...
    strcat('Rasaero      :' , sprintf('%0.2f' , rasaero_altitude_max(1))           , ' ft')        , ...
    strcat('Rocksim      :' , sprintf('%0.2f' , Rocksim_altitude_max(1))           , ' ft')        , ...
    'location'              , 'southeast' ...
);
set(h_legend,'FontSize',12);
set(h_legend,'FontName','Courier New');

%% fill region in between
%{
hold on
X=[tout,fliplr(tout)]; %#create continuous x value array for plotting
Y=[openrocket_altitude(1:arraysize),fliplr(altitude)]; %#create y values for out and then back
fill(X,Y,'g'); %#plot filled area
hold off
%}

%% Graph details
clear title xlabel ylabel
title('Altitude vs Time');
grid on;
xlabel('Time (s)');
ylabel('Altitude (m)');

xlim([0,time_to_apogee_rasaero(end)]);

%% provide imperial units on right vertical axis
ylimit = [0,13000/meter2feet]; % ylimits in meters
n=14; % how many tickmarks
ytic = linspace(ylimit(1),ylimit(2),n); 
ax1 = gca;
set(ax1,'ylim', ylimit, 'ytick', ytic);
ylabel('in meters')
ax2 = axes('Position',get(ax1,'Position'),...
    'YAxisLocation','right','color','none');
set(ax2,'ylim',...
    ylimit*meter2feet, 'ytick',ytic*meter2feet,...
    'xtick',get(ax1,'xtick'), 'xticklabel',''...
    )
ylabel('in feet');

%% conditionally save the plot
if exist('saveplots')
    if saveplots
        saveas(gcf, 'documentation/images/plots/error_altitude_plot.png');
        export_fig error_altitude_plot.png -m2
    end
end
