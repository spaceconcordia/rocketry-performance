%% Plot drag coef
plot(mach_number_trimmed, coef_drag_skin_friction)

hold on
plot(mach_number_trimmed, openrocket_drag_friction_coef(1:arraysize))
hold off

title('Friction Drag Coefficient vs Mach Number');
xlabel('Mach Number');
%ylabel('Drag coefficient');
legend('Matlab','OpenRocket')