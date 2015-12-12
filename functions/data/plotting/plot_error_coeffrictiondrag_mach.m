%% Plot drag coef
plot(mach_number_trimmed, coef_drag_skin_friction, 'm')

hold on
plot(mach_number_trimmed, openrocket_drag_friction_coef(1:arraysize), 'b')
hold off

clear title xlabel ylabel
title('Friction Drag Coefficient vs Mach Number');
xlabel('Mach Number');
ylabel('Drag coefficient');
legend('Matlab','OpenRocket')

%% Conditionally save the plot
if exist('saveplots')
    if saveplots
        saveas(gcf, '../documentation/images/plots/error_friction_drag_plot.png');
        export_fig error_drag_plot.png -m2
    end
end
