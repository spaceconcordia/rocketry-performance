%% Plot drag coef
plot(mach_number_trimmed, drag_coefficient)

hold on
plot(mach_number_trimmed, openrocket_drag_coef(1:arraysize))
hold off

title('Drag Coefficient vs Mach Number');
xlabel('Mach Number');
%ylabel('Drag coefficient');
legend('Matlab','OpenRocket')