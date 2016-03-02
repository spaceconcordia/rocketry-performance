%% Import Data
%import_louisville_data;
%import_louisville_openrocket_data;

%% Plot Comparison
figure;
plot(openrocket_VarName1, openrocket_Altitudem*3.28, 'b-.');
hold on;
plot(tout, altitude*3.28, 'm-*');
plot(Louisville_DataTime_1,Louisville_Altitude_1,'b-*')
plot(Louisville_DataTime_2,Louisville_Altitude_2,'b-o');
plot(Louisville_DataTime_3,Louisville_Altitude_3,'b-O');
plot(Louisville_DataTime_5,Louisville_Altitude_5,'b--*');
plot(Louisville_DataTime_6,Louisville_Altitude_6,'b--.');
hold off;
xlim([0,14]); ylim([0,2500]);
h_legend = legend('OpenRocket','Matlab','Launch 1','Launch 2', 'Launch 3', 'Launch 5', 'Launch 6',...
    'location', 'southeast' ...
    ); 
xlabel('Time (s)');
ylabel('Altitude (ft)');
set(h_legend,'FontSize',12);
set(h_legend,'FontName','Courier New');

%% save plot
if exist('saveplots')
    if saveplots
        saveas(gcf, 'documentation/images/plots/plot_louisville_analysis.png');
        %export_fig plot_louisville_analysis.png -m2
    end
end
