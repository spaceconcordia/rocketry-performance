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

% Plot shaded region for stability bounds
x1 = tout;
upperbound = initial_amplitude*0.05;
lowerbound = -initial_amplitude*0.05;

figure;
coef_damping_moment = coef_damping_aero + coef_damping_jet;

%ha = shadedplot(x1, upperbound, lowerbound, [0.7, 1, 0.7], 'r');
plot(tout, angular_position, 'k--o');
hold on;
%plot(tout, inverse_time_constant,'b--o');
%plot(tout, sin(angular_frequency.*(tout-disturbance_time) + phase_angle), 'g-*' );
%plot(tout, exp(-inverse_time_constant.*(tout-disturbance_time)), 'm-o' );
plot(tout, initial_amplitude.*exp(-inverse_time_constant.*(tout-disturbance_time)), 'k' );
plot(tout, -initial_amplitude.*exp(-inverse_time_constant.*(tout-disturbance_time)), 'k' );
plot(tout,upperbound,'g-o');
plot(tout,lowerbound,'g-o');
hold off;
%legend ('\alpha_x','D','sin(omega * t + phi)','exp(-Dt)','A*exp(-Dt)','A'); 
legend ('\alpha_x','Ae^{-Dt}','-Ae^{-Dt}','Upper Bound','Lower Bound'); 
title('Matlab Response to initial condition');
xlim([3.2,25]);

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


