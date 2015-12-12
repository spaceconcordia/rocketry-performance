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

%% Conditionally save the plot
%{
if exist('saveplots')
    if saveplots
        saveas(gcf, '../documentation/images/plots/error_drag_plot.png');
        export_fig error_drag_plot.png -m2
    end
end
%}

figure;
plot (t_acc_arcturus, x_acc_arcturus);
axis([0 30 -30 30]);
title('Accelerometer Data to Apogee');
xlabel('Time (s)');

%% Conditionally save the plot
%{
if exist('saveplots')
    if saveplots
        saveas(gcf, '../documentation/images/plots/error_drag_plot.png');
        export_fig error_drag_plot.png -m2
    end
end
%}

%% interpolate and align acceleration data
disp('Setting baseline time');
simulation_time = 252; % seconds
timestep        = 0.001; % seconds
t_new           = linspace(0,simulation_time,simulation_time/timestep);
t_new           = t_new.';

x_acc_arcturus_interpolated = interp1(t_acc_arcturus, x_acc_arcturus, t_new);

figure;
plot (t_new, x_acc_arcturus_interpolated);
axis([0 30 -30 30]);
title('Interpolated Accelerometer Data to Apogee');
xlabel('Time (s)');

%% Conditionally save the plot
%{
if exist('saveplots')
    if saveplots
        saveas(gcf, '../documentation/images/plots/error_drag_plot.png');
        export_fig error_drag_plot.png -m2
    end
end
%}

figure;
plot (t_new, openrocket_acceleration);
axis([0 30 -30 30]);
title('Interpolated Openrocket Acceleration Data to Apogee');
xlabel('Time (s)');
hold off;

%% Conditionally save the plot
%{
if exist('saveplots')
    if saveplots
        saveas(gcf, '../documentation/images/plots/error_drag_plot.png');
        export_fig error_drag_plot.png -m2
    end
end
%}
