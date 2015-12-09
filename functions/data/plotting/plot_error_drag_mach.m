%% Plot drag force
plot(mach_number_trimmed, drag_force)

hold on
plot(mach_number_trimmed, openrocket_drag_force(1:arraysize))
hold off

clear title xlabel ylabel
title('Drag Force vs Mach Number');
xlabel('Mach Number');
ylabel('Drag Force (N)');
legend('Matlab','OpenRocket')

%% save plot
if exist('saveplots')
    if saveplots
        saveas(gcf, '../documentation/images/plots/error_drag_plot.png');
        export_fig error_drag_plot.png -m2
    end
end