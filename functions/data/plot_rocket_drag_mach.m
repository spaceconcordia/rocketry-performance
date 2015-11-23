%% Drag vs Mach Figure
xdata = {mach_number, mach_number};
ydata = {drag_force, drag_coefficient};
ylabel = {'Drag Force (N)','Drag Coefficient'};
linespec = {'b','b'};
multiplot(xdata, ydata, 'YLabel', ylabel, ...
 'LineSpec', linespec, 'Title', 'Drag vs. Mach Number Plot', 'XLabel', 'Mach Number');

if saveplots % conditionally save the plot
    saveas(gcf, '../documentation/images/plots/drag_v_mach.png');
    export_fig drag_v_mach_plot.png -m2
end
