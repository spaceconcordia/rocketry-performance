%% Import Data
%import_arcturus_strattologger;
%import_arcturus_openrocket_data;

openrocket_summary
timetoapogee

%% Apogee 
indexmax = find(max(altitude) == altitude);
time_to_apogee = tout(indexmax);
altitude_max = altitude(indexmax);

strat_indexmax = find(max(arcstrat_Altitude) == arcstrat_Altitude);
strat_time_to_apogee = tout(strat_indexmax);
strat_altitude_max = arcstrat_Altitude(strat_indexmax);

or_indexmax = find(max(openrocket_Altitudem) == openrocket_Altitudem);
or_time_to_apogee = tout(or_indexmax);
or_altitude_max = altitude(or_indexmax);

%% Terminal Velocity
arcstrat_index_vmax = find(4.2 == arcstrat_Time);
arcstrat_vmax = arcstrat_Speed(arcstrat_index_vmax)/3.28;

index_vmax = find(max(velocity) == velocity);
time_to_termv = tout(index_vmax);
velocity_max = velocity(index_vmax);

%% Interpolate Data
% Altitude
arcstrat_altitude_interp = interp1(arcstrat_Time,arcstrat_Altitude,tout,'PCHIP');
% NOT WORKING % or_altitude_interp = interp1(openrocket_VarName1, openrocket_Altitudem,tout,'PCHIP');
% Velocity
arcstrat_velocity_interp = interp1(arcstrat_Time,arcstrat_Speed,tout,'PCHIP');
% NOT WORKING % or_velocity_interp = interp1(openrocket_VarName1, openrocket_Altitudem,tout,'PCHIP');

%% Calculate Error
% Percent Error = (Observed - Simulated)/(Observed) * 100
matlab_altitude_error = ((arcstrat_altitude_interp/3.28) - altitude) ./ (arcstrat_altitude_interp/3.28) * 100;
matlab_velocity_error = (arcstrat_velocity_interp/3.28 - velocity) ./ (arcstrat_velocity_interp/3.28) * 100;
apogee_error = ( (strat_altitude_max/3.28) - altitude_max ) / (strat_altitude_max/3.28) * 100
terminal_velocity_error = ( arcstrat_vmax - max(velocity) ) / (arcstrat_vmax) * 100

%% Plot Error
figure; 
plot(tout, matlab_altitude_error, 'b-*');
hold on;
plot(tout, matlab_velocity_error, 'k-o');
hold off;
legend('Altitude Error','Velocity Error');
title('Error as a function of time');
xlim([1,30]); ylim([-100,100]);

%% Plot Altitude Comparison
figure;
clear title xlabel ylabel
plot(tout(1:indexmax), altitude(1:indexmax), 'm-*');
hold on;
%plot(openrocket_VarName1(1:or_indexmax), openrocket_Altitudem(1:or_indexmax), 'b-*');
plot(arcstrat_Time(1:strat_indexmax),arcstrat_Altitude(1:strat_indexmax)/3.28,'k-*')
hold off;
%h_legend = legend('Matlab','OpenRocket','Arcturus Launch',...
h_legend = legend('Matlab','Arcturus Launch',...
    'location', 'southeast' ...
    ); 
title('Arcturus Altitude');
xlabel('Time (s)');
ylabel('Altitude (m)');

rightbound=32; upperbound=4000;
xlim([0,rightbound]); ylim([0,4000]);

% Altitude Annotations
axPos = get(gca,'Position'); %# gca gets the handle to the current axes
xMinMax = xlim;
yMinMax = ylim;

x_interest = tout(indexmax);
y_interest = altitude(indexmax);
xAnnotation = axPos(1) + ((x_interest - xMinMax(1))/(xMinMax(2)-xMinMax(1))) * axPos(3);
yAnnotation = axPos(2) + ((y_interest - yMinMax(1))/(yMinMax(2)-yMinMax(1))) * axPos(4);
annotation(...
    'textarrow',    ...
    [xAnnotation-0.1, xAnnotation], ...
    [yAnnotation-0.2, yAnnotation], ...
    'String','Matlab Apogee'...
);
%
x_interest = arcstrat_Time(strat_indexmax);
y_interest = arcstrat_Altitude(strat_indexmax+5)/3.28;

xAnnotation = axPos(1) + ((x_interest - xMinMax(1))/(xMinMax(2)-xMinMax(1))) * axPos(3);
yAnnotation = axPos(2) + ((y_interest - yMinMax(1))/(yMinMax(2)-yMinMax(1))) * axPos(4);
annotation(...
    'textarrow',    ...
    [xAnnotation-0.05, xAnnotation], ...
    [yAnnotation-0.175, yAnnotation], ...
    'String','Arcturus Apogee'...
);

dim = [.5 .2 .3 .3];
str = strcat('Apogee Altitude Error: ',int2str(apogee_error),'%');
a = annotation('textbox',dim,'String',str,'FitBoxToText','on');
a.FontSize = 24;

% save altitude comparison plot
if exist('saveplots')
    if saveplots
        saveas(gcf, 'documentation/images/plots/plot_arcturus_altitude_analysis.png');
        %export_fig plot_louisville_analysis.png -m2
    end
end

%% Plot Velocity Comparison
figure;
clear title xlabel ylabel
plot(tout, velocity, 'm-*');
hold on;
%plot(openrocket_VarName1(1:or_indexmax), openrocket_Totalvelocityms(1:or_indexmax), 'b-*');
plot(arcstrat_Time(1:strat_indexmax),arcstrat_Speed(1:strat_indexmax)/3.28,'k-*')
hold off;
%h_legend = legend('Matlab','OpenRocket','Arcturus Launch',...
h_legend = legend('Matlab','OpenRocket','Arcturus Launch',...
    'location', 'northeast' ...
); 
title('Arcturus Velocity');
xlabel('Time (s)');
ylabel('Velocity (m/s)');
set(h_legend,'FontSize',12);
set(h_legend,'FontName','Courier New');
xlim([0,32]); ylim([0,325]);

% Velocity Annotations
% get axis coordinates
axPos = get(gca,'Position'); %# gca gets the handle to the current axes
xMinMax = xlim;
yMinMax = ylim;
% Matlab plot annotation
x_interest=time_to_termv;
y_interest=velocity_max;
xAnnotation = axPos(1) + ((x_interest - xMinMax(1))/(xMinMax(2)-xMinMax(1))) * axPos(3);
yAnnotation = axPos(2) + ((y_interest - yMinMax(1))/(yMinMax(2)-yMinMax(1))) * axPos(4);
annotation(...
    'textarrow',    ...
    [xAnnotation+0.025, xAnnotation], ...
    [yAnnotation, yAnnotation], ...
    'String','Matlab Terminal Velocity'...
);
% Arcturus plot annotation
x_interest=4.2;
y_interest=arcstrat_vmax;
xAnnotation = axPos(1) + ((x_interest - xMinMax(1))/(xMinMax(2)-xMinMax(1))) * axPos(3);
yAnnotation = axPos(2) + ((y_interest - yMinMax(1))/(yMinMax(2)-yMinMax(1))) * axPos(4);
annotation(...
    'textarrow',    ...
    [xAnnotation+0.025, xAnnotation], ...
    [yAnnotation+0.025 yAnnotation], ...
    'String','Arcturus Terminal Velocity'...
);

dim = [.5 .3 .3 .3];
str = strcat('Terminal Velocity Error: ',int2str(terminal_velocity_error),'%');
a = annotation('textbox',dim,'String',str,'FitBoxToText','on');
a.FontSize = 24;

% save velocity comparison plot
if exist('saveplots')
    if saveplots
        saveas(gcf, 'documentation/images/plots/plot_arcturus_velocity_analysis.png');
        %export_fig plot_louisville_analysis.png -m2
    end
end
