%% Plot mach number
plot(tout, mach_number_trimmed, 'm');

hold on
plot(tout, openrocket_mach(1:arraysize), 'b');
hold off

clear title xlabel ylabel
title('Mach Number vs Time');
xlabel('Time (s)');
ylabel('Drag coefficient');
legend('Matlab','OpenRocket')

%% save plot
if exist('saveplots')
    if saveplots
        saveas(gcf, '../documentation/images/plots/error_mach_plot.png');
        export_fig error_mach_plot.png -m2
    end
end
