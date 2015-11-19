%% Kinematics Figure
xdata = {tout, tout, tout};
ydata = {altitude, velocity, acceleration};
ylabel = {'Altitude (m)','Velocity (m/s)','Acceleration (m/s^2)'};
linespec = {'b-*','b:+','b'};
multiplot(xdata, ydata, 'YLabel', ylabel, ...
 'LineSpec', linespec, 'Title', 'Kinematics Plot', 'XLabel', 'time');
saveas(gcf, '../documentation/images/plots/kinematics_plot.png');
export_fig kinematics_plot.png -m2
