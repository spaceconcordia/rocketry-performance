%% Plot Arcturus Pressure Data

xdata = {t_bar_arc, t_bar_arc, t_bar_arc};
ydata = {pressure_bar_arc, temperature_bar_arc, altitude_bar_arc};

ylabel = ...
    {'Local Pressure (kPa)','Local Temperature (K)','Rocket Altitude (m)',};

linespec = {'b','b','b'};

multiplot(xdata, ydata, 'YLabel', ylabel, ...
 'LineSpec', linespec, 'Title', 'Arcturus Pressure Data', 'XLabel', 'time');

if saveplots % conditionally save the plot
    saveas(gcf, '../documentation/images/plots/arcturus_pressure_plot.png');
    export_fig arcturus_pressure_plot.pnd -m2
end
