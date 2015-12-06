%%% Drag Model Figure
%xdata = {tout, tout, tout};
xdata = {tout, tout};
%ydata = {drag_force, drag_coefficient, reynolds_number};
ydata = {drag_force, drag_coefficient};
%ylabel = {'Drag Force (N)','Drag Coefficient','Reynolds Number'};
ylabel = {'Drag Force (N)','Drag Coefficient'};
%linespec = {'b-*','b:+','b'};
linespec = {'b','b'};
multiplot(xdata, ydata, 'YLabel', ylabel, ...
 'LineSpec', linespec, 'Title', 'Drag vs. Time Plot', 'XLabel', 'time');

if saveplots % conditionally save the plot
    saveas(gcf, '../documentation/images/plots/drag_plot.png');
    export_fig drag_plot.png -m2
end
