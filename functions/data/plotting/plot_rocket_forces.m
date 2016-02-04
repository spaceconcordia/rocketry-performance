figure;
subplot(2,1,1);
title ('Rocket Forces in Newtons');
plot(tout,force_normal,'g');
hold on;
plot(tout,force_lift,'b');
plot(tout,drag_force,'k');
plot(tout,-9.81,'r');
hold off;
legend('Restoring Force', 'Damping Force', 'Drag Force', 'Weight','Axial Force');
subplot(2,1,2);
plot(tout,thrust,'m');
legend('Thrust');
xlabel('Time (s)')
