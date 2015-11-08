sim('thrust_weight_mass_integrationTest');

%--------------------------------------------------------------------------
% Dynamics Plot
%--------------------------------------------------------------------------
figure;

%--------------------------------------------------------------------------
% Mass Plot
%--------------------------------------------------------------------------
subplot(3,1,1);
plot(tout, mass_test);
title('Mass vs. Time');
xlabel('Time (s)');
ylabel('Mass (kg)')
xlim([0,5]);
ylim([0,20]);

indexmax = find(max(mass_test) == mass_test);
xmax = mass_test(indexmax);
ymax = mass_test(indexmax);

strmax = ['Maximum = ',num2str(ymax)];
text(xmax,ymax,strmax,'HorizontalAlignment','right');

%--------------------------------------------------------------------------
% Weight Plot
%--------------------------------------------------------------------------
subplot(3,1,2);
plot(tout, weight_test);
title('Weight vs. Time');
xlabel('Time (s)');
ylabel('Weight (N)');
xlim([0,5]);
ylim([0,60]);

indexmax = find(max(weight_test) == weight_test);
xmax = weight_test(indexmax);
ymax = weight_test(indexmax);

strmax = ['Maximum = ',num2str(ymax)];
text(xmax,ymax,strmax,'HorizontalAlignment','right');

%--------------------------------------------------------------------------
% Thrust Plot
%--------------------------------------------------------------------------
subplot(3,1,3);
plot(tout, thrust_test);
title('Thrust vs. Time');
xlabel('Time (s)');
ylabel('Thrust (N)');
xlim([0,5]);
ylim([0,2500]);

indexmax = find(max(thrust_test) == thrust_test);
xmax = thrust_test(indexmax);
ymax = thrust_test(indexmax);

strmax = ['Maximum = ',num2str(ymax)];
text(xmax,ymax,strmax,'HorizontalAlignment','right');
