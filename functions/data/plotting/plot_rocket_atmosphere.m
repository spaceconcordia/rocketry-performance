%%% ISA Model Figure

xdata = {tout, tout, tout, tout, tout};
ydata = {local_temperature, local_pressure, local_density, local_absolute_viscosity, local_kinematic_viscosity};
ylabel = {'Local Temperature (K)','Local Pressure (kPa)','Local Density (kg/m^3)','Local Absolute Viscosity','Local Kinematic Viscosity'};
linespec = {'b','b','b','b','b'};
multiplot(xdata, ydata, 'YLabel', ylabel, ...
 'LineSpec', linespec, 'Title', 'ISA Model Plot', 'XLabel', 'time');

if saveplots % conditionally save the plot
    saveas(gcf, '../documentation/images/plots/atmosphere_plot.png');
    export_fig atmosphere_plot.png -m2
end
