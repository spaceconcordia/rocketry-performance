%% Plot drag coef
subplot(2,1,1)
plot(tout, thrust, 'm')
hold on
plot(tout, openrocket_thrust(1:arraysize), 'b')
hold off

clear title xlabel ylabel
title('Thrust vs Time');
xlabel('Thrust (N)');
ylabel('Time (s)');
legend('Matlab','OpenRocket')

subplot(2,1,2)
plot(tout, mass, 'm')
hold on
plot(tout, openrocket_mass(1:arraysize), 'b')
hold off

clear title xlabel ylabel
title('Mass vs Time');
xlabel('Mass (kg)');
ylabel('Time (s)');
legend('Matlab','OpenRocket')


%% Conditionally save the plot
if exist('saveplots')
    if saveplots
        saveas(gcf, '../documentation/images/plots/error_mass_v_time_plot.png');
        export_fig error_drag_plot.png -m2
    end
end
