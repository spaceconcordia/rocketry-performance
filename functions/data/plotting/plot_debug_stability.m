plot_rocket_flight_stability;

figure; 
plot(tout, coef_moment_corrective);
hold on;
plot(tout, coef_damping_aero+coef_damping_jet);
title('Corrective Moment Coefficient vs Damping Moment Coefficient');
legend('Corrective','Damping');

figure; 
plot(Rocksim_Time, Rocksim_Correctivemomentcoefficient./Rocksim_LongitudinalmomentofinertiaOuncesInches2 - Rocksim_Dampingmomentcoefficient.^2./(4.*Rocksim_LongitudinalmomentofinertiaOuncesInches2));
title('Rocksim Corrective Moment Coefficient vs Damping Moment Coefficient');

figure; plot(tout, angular_position);   title('Angular Position'); 
figure; plot(tout, angular_velocity);   title('Angular Velocity');
figure; plot(tout, phase_angle);        title('Phase Angle');
figure; plot(tout, initial_amplitude);  title('Initial Amplitude');
figure; plot(tout, angular_frequency);  title('Angular Frequency');