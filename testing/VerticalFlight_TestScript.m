sim('VerticalFlight_TestModel');

%--------------------------------------------------------------------------
% Dynamics Plot
%--------------------------------------------------------------------------
figure;

%--------------------------------------------------------------------------
% Mass Plot
%--------------------------------------------------------------------------
subplot(3,1,1);
plot(tout, mass);
title('Mass vs. Time');
xlabel('Time (s)');
ylabel('Mass (kg)')
xlim([0,5]);
ylim([0,20]);

indexmax = find(max(mass) == mass);
xmax = mass(indexmax);
ymax = mass(indexmax);

strmax = ['Maximum = ',num2str(ymax)];
text(xmax,ymax,strmax,'HorizontalAlignment','right');

%--------------------------------------------------------------------------
% Weight Plot
%--------------------------------------------------------------------------
subplot(3,1,2);
plot(tout, weight);
title('Weight vs. Time');
xlabel('Time (s)');
ylabel('Weight (N)');
xlim([0,5]);
ylim([0,60]);

indexmax = find(max(weight) == weight);
xmax = weight(indexmax);
ymax = weight(indexmax);

strmax = ['Maximum = ',num2str(ymax)];
text(xmax,ymax,strmax,'HorizontalAlignment','right');

%--------------------------------------------------------------------------
% Thrust Plot
%--------------------------------------------------------------------------
subplot(3,1,3);
plot(tout, thrust);
title('Thrust vs. Time');
xlabel('Time (s)');
ylabel('Thrust (N)');
xlim([0,5]);
ylim([0,2500]);

indexmax = find(max(thrust) == thrust);
xmax = thrust(indexmax);
ymax = thrust(indexmax);

strmax = ['Maximum = ',num2str(ymax)];
text(xmax,ymax,strmax,'HorizontalAlignment','right');

%--------------------------------------------------------------------------
% Kinematics Figure
%--------------------------------------------------------------------------
figure; 

%--------------------------------------------------------------------------
% Altitude Plot
%--------------------------------------------------------------------------
subplot(3,1,1);
plot(tout, altitude);
title('Altitude vs. Time');
xlabel('Time (s)');
ylabel('Altitude (m)');
ylim([0,6000]);
indexmax = find(max(altitude) == altitude);
xmax = altitude(indexmax);
ymax = altitude(indexmax);

strmax = ['Maximum = ',num2str(ymax)];
text(xmax,ymax,strmax,'HorizontalAlignment','right');

%--------------------------------------------------------------------------
% Velocity Plot
%--------------------------------------------------------------------------
subplot(3,1,2);
plot(tout, velocity);
title('Velocity vs. Time');
xlabel('Time (s)');
ylabel('Velocity (m/s)');
ylim([-25,1500]);
indexmax = find(max(velocity) == velocity);
xmax = velocity(indexmax);
ymax = velocity(indexmax);

strmax = ['Maximum = ',num2str(ymax)];
text(xmax,ymax,strmax,'HorizontalAlignment','right');

%--------------------------------------------------------------------------
% Acceleration Plot
%--------------------------------------------------------------------------
subplot(3,1,3);
plot(tout, acceleration);
title('Acceleration vs. Time');
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
ylim([-10,15]);

indexmax = find(max(acceleration) == acceleration);
xmax = acceleration(indexmax);
ymax = acceleration(indexmax);

strmax = ['Maximum = ',num2str(ymax)];
text(xmax,ymax,strmax,'HorizontalAlignment','right');
