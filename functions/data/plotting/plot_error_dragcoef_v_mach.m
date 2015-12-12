%% Plot drag coef v mach number
plot(mach_number_trimmed, drag_coefficient, 'm')
hold on
plot(mach_number_trimmed, openrocket_drag_coef(1:arraysize), 'b')
hold off

%% Graph Details
clear title xlabel ylabel
title('Drag Coefficient vs Mach Number');
xlabel('Mach Number');
ylabel('Drag coefficient');
legend('Matlab','OpenRocket')

%% save plot
if exist('saveplots')
    if saveplots
        saveas(gcf, '../documentation/images/plots/error_dragcoef_v_mach_plot.png');
        export_fig error_dragcoef_v_mach_plot.png -m2
    end
end
