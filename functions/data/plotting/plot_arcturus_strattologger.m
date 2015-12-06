%% Plot Arcturus Strattologger Data

xdata = {t_arc_strat, t_arc_strat, t_arc_strat, t_arc_strat};
ydata = {baroalt_arc_strat, velocity_arc_strat, acceleration_arc_strat, mach_arc_strat};

ylabel = ...
    {'Barometric Atitude (m)','Velocity (m/s)','Acceleration (m/s^2)','Mach Number'};

linespec = {'b','b','b','b'};

multiplot(xdata, ydata, 'YLabel', ylabel, ...
 'LineSpec', linespec, 'Title', 'Arcturus Strattologger Data', 'XLabel', 'time');

if saveplots % conditionally save the plot
    saveas(gcf, '../documentation/images/plots/arcturus_strattologger_plot.png');
    export_fig arcturus_strattologger_plot.pnd -m2
end
