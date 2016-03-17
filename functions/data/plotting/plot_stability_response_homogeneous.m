%% Matlab

% Plot shaded region for stability bounds
x1 = tout;
upperbound = initial_disturbance*0.05;
lowerbound = -initial_disturbance*0.05;

figure;
coef_damping_moment = coef_damping_aero + coef_damping_jet;

%ha = shadedplot(x1, upperbound, lowerbound, [0.7, 1, 0.7], 'r');
plot(tout, angular_position, 'k');
hold on;
%plot(tout, inverse_time_constant,'b--o');
%plot(tout, sin(angular_frequency.*(tout-disturbance_time) + phase_angle), 'g-*' );
%plot(tout, exp(-inverse_time_constant.*(tout-disturbance_time)), 'm-o' );
plot(tout, initial_amplitude.*exp(-inverse_time_constant.*(tout-disturbance_time)), 'k--' );
plot(tout, -initial_amplitude.*exp(-inverse_time_constant.*(tout-disturbance_time)), 'k--' );
plot(tout,upperbound,'g');
plot(tout,lowerbound,'g');
hold off;
%legend ('\alpha_x','D','sin(omega * t + phi)','exp(-Dt)','A*exp(-Dt)','A'); 
legend ('\alpha_x','Ae^{-Dt}','-Ae^{-Dt}','Upper Bound','Lower Bound'); 
title_string = sprintf('Homogeneous Response to Initial Conditions \n [ Angle-of-Attack = %d deg ], [ Angular-Velocity = 0 deg/s ]',initial_disturbance*180/pi);
title(title_string);
xlim([0,11]);

%% Conditionally save the plot
if exist('saveplots')
    if saveplots
        saveas(gcf, 'documentation/images/plots/plot_stability_homogeneous_response.png');
        export_fig plot_stability_homogeneous_response.png -m2
    end
end