%% Plot Arcturus Accelerometer Data

xdata = {t_acc_arcturus, t_acc_arcturus, t_acc_arcturus};
ydata = {x_acc_arcturus, y_acc_arcturus, z_acc_arcturus};

ylabel = ...
    {...
    'X - Acceleration',...
    'Y - Acceleration',...
    'Z - Acceleration'...
    };

linespec = {'b','b','b'};

multiplot(xdata, ydata, 'YLabel', ylabel, ...
 'LineSpec', linespec, 'Title', 'Arcturus Accelerometer Data', 'XLabel', 'time');

if saveplots % conditionally save the plot
    saveas(gcf, '../documentation/images/plots/arcturus_accelerometer_plot.png');
    export_fig arcturus_accelerometer_plot.pnd -m2
end
