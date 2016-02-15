%% RockSim
figure;

subplot(4,1,1);
plot(Rocksim_Time, Rocksim_Correctivemomentcoefficient);
title('Rocksim Corrective Moment Coefficient');

subplot(4,1,2);
plot(Rocksim_Time, Rocksim_Dampingmomentcoefficient);
title('Rocksim Damping Moment Coefficient');

subplot(4,1,3);
plot(Rocksim_Time, Rocksim_CNanormalforcecoefficient);
title('Rocksim Normal Force Coefficient');

subplot(4,1,4);
Rocksim_phase= ...
    sqrt(...
        Rocksim_Correctivemomentcoefficient./Rocksim_LongitudinalmomentofinertiaOuncesInches2 ...
        - Rocksim_Dampingmomentcoefficient.^2./(4.*Rocksim_LongitudinalmomentofinertiaOuncesInches2) ...
    );
plot( ...
    Rocksim_Time, Rocksim_phase);
title('Rocksim Phase');

%% OpenRocket
figure;
plot ( openrocket_VarName1, openrocket_Normalforcecoefficient,'g' );
hold on;
plot ( openrocket_VarName1, openrocket_Pitchdampingcoefficient,'r');
plot ( openrocket_VarName1, openrocket_Pitchmomentcoefficient,'k' );
hold off;
legend('Normal Force','Pitch Damping','Pitch Moment');
ylim([-0.5,1]);

%% Matlab

figure;
coef_damping_moment = coef_damping_aero + coef_damping_jet;

plot(tout, inverse_time_constant);
hold on;
plot(tout, sin(angular_frequency.*(tout-disturbance_time) + phase_angle), 'g-*' );
plot(tout, exp(-inverse_time_constant.*(tout-disturbance_time)), 'm-o' );
plot(tout, initial_amplitude.*exp(-inverse_time_constant.*(tout-disturbance_time)), 'k-*' );
plot(tout, initial_amplitude, 'c-*' );
hold off;
legend ('D','sin(omega * t + phi)','exp(-Dt)','A*exp(-Dt)','A'); 
title('Matlab Damping Moment Coefficient');

figure;
subplot(2,1,1);
plot(tout, coef_moment_corrective);
title('Matlab Corrective Moment Coefficient');
subplot(2,1,2);
matlab_frequency_squared = ...
    coef_moment_corrective./rocket_moment_inertia_long - coef_damping_moment.^2./(4.*rocket_moment_inertia_long);
plot( ...
    tout, matlab_frequency_squared);
title('Matlab Frequency Squared');


