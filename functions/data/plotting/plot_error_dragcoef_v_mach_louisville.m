%% Find value index of apogee for each source
% OpenRocket
indexmax_openrocket = find(max(openrocket_Altitudem) == openrocket_Altitudem);
time_to_apogee_openrocket = openrocket_VarName1(indexmax_openrocket);
openrocket_altitude_max = openrocket_Altitudem(indexmax_openrocket);

%% Plot drag coef v mach number
matlab_plot = plot(mach_number, drag_coefficient, 'm--*')
hold on
openrocket_plot = plot(...
    openrocket_Machnumber(1:indexmax_openrocket), ...
    openrocket_Dragcoefficient(1:indexmax_openrocket), ...
    'b--.'...
);
hold off

h_legend = legend(...
    [matlab_plot, openrocket_plot],...
    'Matlab','OpenRocket', ...
    'location', 'east' ...
);
set(h_legend,'FontSize',12);
set(h_legend,'FontName','Courier New');

%% Graph Details
clear title xlabel ylabel
title('Drag Coefficient vs Mach Number');
xlabel('Mach Number');
ylabel('Drag coefficient');
xlim([0,1]);

%% save plot
if exist('saveplots')
    if saveplots
        saveas(gcf, 'documentation/images/plots/error_louisville_dragcoef_v_mach_plot.png');
        export_fig error_louisville_dragcoef_v_mach_plot.png -m2
    end
end
