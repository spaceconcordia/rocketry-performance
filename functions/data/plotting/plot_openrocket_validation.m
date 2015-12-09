%% Trim the array sizes to match the smallest set
arraysize       = size(tout,1);
openrocket_time = simtime(1:arraysize);

%% Set the x-axis
openrocket_xdata = {openrocket_time, openrocket_time, openrocket_time, openrocket_time, openrocket_time};
matlab_xdata     = {tout, tout, tout, tout, tout};

plot_openrocket_validation_overall
plot_openrocket_validation_drag
plot_openrocket_validation_motor

figure
subplot(3,1,1)
plot_error_drag_mach
subplot(3,1,2)
plot_error_mach_v_time
subplot(3,1,3)
plot_error_altitude_v_time

