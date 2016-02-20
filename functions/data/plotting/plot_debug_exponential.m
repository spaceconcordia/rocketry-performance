figure;
plot( ...
    tout-disturbance_time, ...
    inverse_time_constant .* (tout-disturbance_time), ...
    'k--*' ...
);
hold on;
plot( ...
    tout-disturbance_time, ...
    inverse_time_constant, ...
    'c--*' ...
);
plot ( ...
    tout-disturbance_time, ... 
    angular_position, ...
    'k--o' ...
);
plot( ...
    tout-disturbance_time, ...
    exp( (-1) * inverse_time_constant .* (tout-disturbance_time) ), ...
    'r--o' ...
);
plot( ...
    tout-disturbance_time, ...
    initial_amplitude .* exp( (-1) * inverse_time_constant .* (tout-disturbance_time) ), ...
    'b' ...
);
plot( ...
    tout-disturbance_time, ...
    initial_amplitude, ...
    'r' ...
);

%plot(tout-disturbance_time,coef_damping_moment,'c');
%plot(tout-disturbance_time,rocket_moment_inertia_long,'y');

hold off;
legend(...
    'Dt', ...
    'D', ...
    'AOA', ...
    'e^{-Dt}', ...
    'Ae^{-Dt}', ...
    'A' ...
);

figure;
plot( ...
    Rocksim_Time, ...
    Rocksim_WindangleofattackDeg, ...
    'k--*' ...
);
hold on;
plot( ...
    Rocksim_Time, ...
    Rocksim_Dampingmomentcoefficient, ...
    'c--*' ...
);

hold off;
legend(...
    'AOA', ...
    'C_2' ...
);