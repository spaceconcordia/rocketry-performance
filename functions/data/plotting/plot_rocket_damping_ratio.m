figure;
plot(tout, rocket_damping_ratio,'b');
hold on;
plot (tout, coef_damping_aero + coef_damping_jet, 'k');
plot (tout, coef_moment_corrective','r');
hold off;
legend('Damping Ratio','Damping Coefficient', 'Corrective Moment Coefficient');
