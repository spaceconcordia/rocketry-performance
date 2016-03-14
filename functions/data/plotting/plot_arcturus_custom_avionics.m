%% Plot Arcturus Custom Avionics Data

xdata = {t_arc_strat, t_arc_strat, t_arc_strat, t_arc_strat};
ydata = {baroalt_arc_strat, velocity_arc_strat, acceleration_arc_strat, mach_arc_strat};

ylabel = ...
    {'Barometric Atitude (m)','Velocity (m/s)','Acceleration (m/s^2)','Mach Number'};

linespec = {'b','b','b','b'};

multiplot(xdata, ydata, 'YLabel', ylabel, ...
 'LineSpec', linespec, 'Title', 'Arcturus Strattologger Data', 'XLabel', 'time');

%% Conditionally save the plot
%{
if exist('saveplots')
    if saveplots
        saveas(gcf, '../documentation/images/plots/error_drag_plot.png');
        export_fig error_drag_plot.png -m2
    end
end
%}
