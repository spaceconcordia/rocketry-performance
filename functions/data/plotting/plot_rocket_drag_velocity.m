%% Drag Model Figure
%xdata = {velocity_rocket, velocity_rocket, velocity_rocket};
xdata = {velocity_rocket, velocity_rocket};
%ydata = {drag_force, drag_coefficient, reynolds_number(:,:,:)};
ydata = {drag_force, drag_coefficient};
ylabel = {'Drag Force (N)','Drag Coefficient'};
%linespec = {'b-*','b:+','b'};
linespec = {'b','b'};
multiplot(xdata, ydata, 'YLabel', ylabel, ...
 'LineSpec', linespec, 'Title', 'Drag vs. Velocity Plot', 'XLabel', 'Velocity (m/s)');
if saveplots % conditionally save the plot
    saveas(gcf, '../documentation/images/plots/drag_v_velocity_plot.png');
    export_fig drag_v_velocity_plot.png -m2
end
