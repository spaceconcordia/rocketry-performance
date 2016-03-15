%% Import Data
%import_louisville_data;
%import_louisville_openrocket_data;

%% Interpolation
lv_alt_1 = interp1(Louisville_DataTime_1,Louisville_Altitude_1,tout,'PCHIP');
lv_alt_2 = interp1(Louisville_DataTime_2,Louisville_Altitude_2,tout,'PCHIP');
lv_alt_3 = interp1(Louisville_DataTime_3,Louisville_Altitude_3,tout,'PCHIP');
lv_alt_5 = interp1(Louisville_DataTime_5,Louisville_Altitude_5,tout,'PCHIP');
lv_alt_6 = interp1(Louisville_DataTime_6,Louisville_Altitude_6,tout,'PCHIP');

lv_vel_1 = interp1(Louisville_DataTime_1,Louisville_Velocity_1,tout,'PCHIP');
lv_vel_2 = interp1(Louisville_DataTime_2,Louisville_Velocity_2,tout,'PCHIP');
lv_vel_3 = interp1(Louisville_DataTime_3,Louisville_Velocity_3,tout,'PCHIP');
lv_vel_5 = interp1(Louisville_DataTime_5,Louisville_Velocity_5,tout,'PCHIP');
lv_vel_6 = interp1(Louisville_DataTime_6,Louisville_Velocity_6,tout,'PCHIP');


%% Average Louisville flight
lv_alt_avg = zeros(length(tout),1);
lv_vel_avg = zeros(length(tout),1);
for i = 1:length(tout)
   lv_alt_avg(i) = (1/5)*(lv_alt_1(i) + lv_alt_2(i) + lv_alt_3(i) + lv_alt_5(i) + lv_alt_6(i));
   lv_vel_avg(i) = (1/5)*(lv_vel_1(i) + lv_vel_2(i) + lv_vel_3(i) + lv_vel_5(i) + lv_vel_6(i));
end

%% Apogee 
indexmax = find(max(altitude) == altitude);
time_to_apogee = tout(indexmax);
altitude_max = altitude(indexmax)*3.28;

strat_indexmax = indexmax-4;
temp_strat_indexmax = find(max(altitude) == altitude);
strat_time_to_apogee = tout(temp_strat_indexmax);
strat_altitude_max = lv_alt_avg(temp_strat_indexmax);

or_indexmax = find(max(openrocket_Altitudem) == openrocket_Altitudem);
or_time_to_apogee = tout(or_indexmax);
or_altitude_max = altitude(or_indexmax);

%% Terminal Velocity
arcstrat_index_vmax = find(2.2 == tout);
arcstrat_vmax = lv_vel_avg(arcstrat_index_vmax)/3.28;

index_vmax = find(max(velocity) == velocity);
time_to_termv = tout(index_vmax);
velocity_max = velocity(index_vmax);

%% Calculate Error
% Percent Error = (Observed - Simulated)/(Observed) * 100
matlab_altitude_error = ((lv_alt_avg) - altitude*3.28) ./ (lv_alt_avg) * 100;
matlab_velocity_error = (lv_vel_avg - velocity*3.28) ./ (lv_vel_avg) * 100;
apogee_error = (altitude_max - (strat_altitude_max)) / (altitude_max) * 100
terminal_velocity_error = ( arcstrat_vmax - max(velocity) ) / (arcstrat_vmax) * 100

%% Plot Altitude Comparison
figure;
plot(tout, altitude*3.28, 'm-*');
hold on;
%plot(openrocket_VarName1, openrocket_Altitudem*3.28, 'b-*');
plot(tout,lv_alt_1,'k--.');
plot(tout,lv_alt_1,'k--*');
plot(tout,lv_alt_1,'k--o');
plot(tout,lv_alt_1,'k--O');
plot(tout,lv_alt_1,'k--x');
plot(tout,lv_alt_avg,'k-*');
hold off;
xlim([0,13]); ylim([0,2500]);
title('Altitude Prediction');
%h_legend = legend('Matlab','OpenRocket','Launch 1','Launch 2', 'Launch 3', 'Launch 5', 'Launch 6',...
h_legend = legend('Matlab','Launch 1','Launch 2', 'Launch 3', 'Launch 4', 'Launch 5', 'Launch Average',...
    'location', 'southeast' ...
); 
xlabel('Time (s)');
ylabel('Altitude (ft)');
set(h_legend,'FontSize',12);
set(h_legend,'FontName','Courier New');

% Altitude Annotations
axPos = get(gca,'Position'); %# gca gets the handle to the current axes
xMinMax = xlim;
yMinMax = ylim;

x_interest = tout(indexmax);
y_interest = altitude(indexmax)*3.28;
xAnnotation = axPos(1) + ((x_interest - xMinMax(1))/(xMinMax(2)-xMinMax(1))) * axPos(3);
yAnnotation = axPos(2) + ((y_interest - yMinMax(1))/(yMinMax(2)-yMinMax(1))) * axPos(4);
annotation(...
    'textarrow',                    ...
    [xAnnotation-0.2,   xAnnotation], ...
    [yAnnotation,       yAnnotation],     ...
    'String','Matlab Apogee'        ...
);
%
x_interest = tout(strat_indexmax);
y_interest = lv_alt_avg(strat_indexmax+5);

xAnnotation = axPos(1) + ((x_interest - xMinMax(1))/(xMinMax(2)-xMinMax(1))) * axPos(3);
yAnnotation = axPos(2) + ((y_interest - yMinMax(1))/(yMinMax(2)-yMinMax(1))) * axPos(4);
annotation(...
    'textarrow',                    ...
    [xAnnotation-0.05,   xAnnotation], ...
    [yAnnotation-0.2,  yAnnotation], ...
    'String','Louisville Apogee'    ...
);

dim = [.5 .2 .3 .3];
str = strcat('Apogee Altitude Error: ',int2str(apogee_error),'%');
a = annotation('textbox',dim,'String',str,'FitBoxToText','on');
a.FontSize = 24;

% save plot
if exist('saveplots')
    if saveplots
        saveas(gcf, 'documentation/images/plots/plot_louisville_altitude_analysis.png');
        %export_fig plot_louisville_analysis.png -m2
    end
end

%% Plot Velocity Comparison
figure;
plot(tout, velocity*3.28, 'm-*');
hold on;
%plot(openrocket_VarName1, openrocket_Verticalvelocityms*3.28,'b-*');
plot(Louisville_DataTime_1,Louisville_Velocity_1,'k--*')
plot(Louisville_DataTime_2,Louisville_Velocity_2,'k--o');
plot(Louisville_DataTime_3,Louisville_Velocity_3,'k--O');
plot(Louisville_DataTime_5,Louisville_Velocity_5,'k--*');
plot(Louisville_DataTime_6,Louisville_Velocity_6,'k--.');
plot(tout,lv_vel_avg,'k--');
hold off;

%h_legend = legend('Matlab','OpenRocket','Launch 1','Launch 2', 'Launch 3', 'Launch 4', 'Launch 5',...
h_legend = legend( ...
    'Matlab', ...
    'Launch 1','Launch 2', 'Launch 3', 'Launch 4', 'Launch 5', ...
    'Louisville Average', ...    
    'location', 'northeast' ...
); 
xlabel('Time (s)');
ylabel('Velocity (ft/s)');
set(h_legend,'FontSize',12);
set(h_legend,'FontName','Courier New');
title('Terminal Velocity Prediction');
xlim([0,13]); ylim([0,400]);

% Louisville plot annotation
x_interest=2.2;
y_interest=arcstrat_vmax;
xAnnotation = axPos(1) + ((x_interest - xMinMax(1))/(xMinMax(2)-xMinMax(1))) * axPos(3);
yAnnotation = axPos(2) + ((y_interest - yMinMax(1))/(yMinMax(2)-yMinMax(1))) * axPos(4);
annotation(...
    'textarrow',    ...
    [xAnnotation+0.025, xAnnotation], ...
    [yAnnotation+0.025 yAnnotation], ...
    'String','Louisville Terminal Velocity'...
);

dim = [.5 .3 .3 .3];
str = strcat('Terminal Velocity Error: ',int2str(terminal_velocity_error),'%');
a = annotation('textbox',dim,'String',str,'FitBoxToText','on');
a.FontSize = 24;

% save plot
if exist('saveplots')
    if saveplots
        saveas(gcf, 'documentation/images/plots/plot_louisville_velocity_analysis.png');
        %export_fig plot_louisville_analysis.png -m2
    end
end
