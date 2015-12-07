%% Plot altitude
plot(tout, altitude)

hold on
plot(tout, openrocket_altitude(1:arraysize))
hold off

title('Altitude vs Time');
xlabel('Time (s)');
%ylabel('Drag coefficient');
legend('Matlab','OpenRocket')

if exist('saveplots')
    if saveplots
        saveas(gcf, '../documentation/images/plots/error_altitude_plot.png');
        export_fig error_altitude_plot.png -m2
    end
end