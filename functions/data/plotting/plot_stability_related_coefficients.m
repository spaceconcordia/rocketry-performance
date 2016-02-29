figure;

subplot(3,2,1);
plot(tout, coef_moment_corrective);
title('C_1');
ylabel('C_1');

subplot(3,2,2);
plot(tout, coef_damping_moment);
title('C_2');
ylabel('C_2');

subplot(3,2,3);
title('I_L');
plot(tout, rocket_moment_inertia_long);
ylabel('I_L');

subplot(3,2,4);
title('Velocity');
plot(tout, velocity);
ylabel('m/s');

subplot(3,2,5);
title('AOA');
plot(tout, angular_position);
xlabel('tout');
ylabel('radians');

subplot(3,2,6);
title('Damping Ratio');
plot(tout, rocket_damping_ratio);
xlim([1,24]);   
ylabel('\zeta');
xlabel('tout');


figure;

subplot(3,2,1);
plot(tout, phase_angle);
title('Phase Angle');

subplot(3,2,2);
plot(tout, angular_frequency);
title('Angular Frequency');

subplot(3,2,3);
title('Initial Amplitude');
plot(tout, initial_amplitude);

subplot(3,2,4);
title('Inverse Time Constant');
plot(tout, inverse_time_constant);

subplot(3,2,5);
title('AOA');
plot(tout, angular_position);
xlabel('tout');
ylabel('radians');

subplot(3,2,6);
title('Damping Ratio');
plot(tout, rocket_damping_ratio);
xlim([1,24]);   
ylabel('\zeta');
xlabel('tout');