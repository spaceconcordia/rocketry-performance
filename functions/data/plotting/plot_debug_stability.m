import_openrocket_data;
import_rasaero_data;
import_rocksim_data;

plot_rocket_flight_stability;

figure; 
plot(tout, coef_moment_corrective,'m');
hold on;
plot(tout, coef_damping_aero+coef_damping_jet,'b');
plot(tout, coef_normal_force,'k');
title('Corrective Moment Coefficient vs Damping Moment Coefficient');
legend('Corrective Moment','Damping Moment','Normal Force');

figure; plot_stability_coefficients;

figure; plot(tout, angular_position);   title('Angular Position'); 
figure; plot(tout, angular_velocity);   title('Angular Velocity');
figure; plot(tout, phase_angle);        title('Phase Angle');
figure; plot(tout, initial_amplitude);  title('Initial Amplitude');
figure; plot(tout, angular_frequency);  title('Angular Frequency');
figure; plot(tout, inverse_time_constant);  title('Inverse Time Constant');
