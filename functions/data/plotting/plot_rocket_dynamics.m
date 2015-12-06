%% Dynamics Plot
xdata = {tout, tout, tout};
ydata = {mass, weight, thrust};
ylabel = {'Mass (kg)','Weight (N)','Thrust (N)'};
linespec = {'b','b','b'};
multiplot(xdata, ydata, 'YLabel', ylabel, ...
 'LineSpec', linespec, 'Title', 'Dynamics Plot', 'XLabel', 'time');

if saveplots % conditionally save the plot
    saveas(gcf, '../documentation/images/plots/dynamics_plot.png');
    export_fig dynamics_plot.png -m2
end
