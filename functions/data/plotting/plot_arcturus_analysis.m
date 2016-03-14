%% Import Data
import_arcturus_strattologger;
import_arcturus_openrocket_data;

openrocket_summary
timetoapogee

indexmax = find(max(altitude) == altitude);
time_to_apogee = tout(indexmax);
altitude_max = altitude(indexmax);

strat_indexmax = find(max(arcstrat_Altitude) == arcstrat_Altitude);
strat_time_to_apogee = tout(strat_indexmax);
strat_altitude_max = altitude(strat_indexmax);

or_indexmax = find(max(openrocket_Altitudem) == openrocket_Altitudem);
or_time_to_apogee = tout(or_indexmax);
or_altitude_max = altitude(or_indexmax);

%% Plot Comparison
figure;
clear title xlabel ylabel
plot(openrocket_VarName1(1:or_indexmax), openrocket_Altitudem(1:or_indexmax), 'b-*');
hold on;
plot(tout(1:indexmax), altitude(1:indexmax), 'm-*');
plot(arcstrat_Time(1:strat_indexmax),arcstrat_Altitude(1:strat_indexmax)/3.28,'k-*')
hold off;
h_legend = legend('OpenRocket','Matlab','Arcturus Launch',...
    'location', 'southeast' ...
    ); 
title('Arcturus Altitude');
xlabel('Time (s)');
ylabel('Altitude (m)');
set(h_legend,'FontSize',12);
set(h_legend,'FontName','Courier New');
xlim([0,32]); ylim([0,4000]);

%% save plot
if exist('saveplots')
    if saveplots
        saveas(gcf, 'documentation/images/plots/plot_arcturus_altitude_analysis.png');
        %export_fig plot_louisville_analysis.png -m2
    end
end

figure;
clear title xlabel ylabel
plot(openrocket_VarName1(1:or_indexmax), openrocket_Totalvelocityms(1:or_indexmax), 'b-*');
hold on;
plot(tout, velocity, 'm-*');
plot(arcstrat_Time(1:strat_indexmax),arcstrat_Speed(1:strat_indexmax)/3.28,'k-*')
hold off;
h_legend = legend('OpenRocket','Matlab','Arcturus Launch',...
    'location', 'northeast' ...
    ); 
title('Arcturus Velocity');
xlabel('Time (s)');
ylabel('Velocity (m/s)');
set(h_legend,'FontSize',12);
set(h_legend,'FontName','Courier New');
xlim([0,32]); ylim([0,325]);

%% save plot
if exist('saveplots')
    if saveplots
        saveas(gcf, 'documentation/images/plots/plot_arcturus_velocity_analysis.png');
        %export_fig plot_louisville_analysis.png -m2
    end
end
