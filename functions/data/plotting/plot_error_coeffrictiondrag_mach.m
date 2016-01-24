%% Plot drag coef
plot(mach_number, coef_drag_skin_friction, 'm--*')

hold on
plot(openrocket_Machnumber, openrocket_Frictiondragcoefficient, 'b--')
hold off

clear title xlabel ylabel
title('Friction Drag Coefficient vs Mach Number');
xlabel('Mach Number');
ylabel('Drag coefficient');
legend('Matlab','OpenRocket')

%% Conditionally save the plot
if exist('saveplots')
    if saveplots
        saveas(gcf, 'documentation/images/plots/error_coeffriction_drag_plot.png');
        export_fig error_coeffriction_drag_plot.png -m2
    end
end
