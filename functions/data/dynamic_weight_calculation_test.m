%------------------------------------------------------------------------------
%
% Dynamic Weight Calculation Test
%
% run the function against input thrust data
%------------------------------------------------------------------------------

wet_motor_weight = 5.906*9.81;
dry_motor_weight = 3.624*9.81;
mfc              = 0.8236;

[burntime,thrust_curve] = thrust_data_import('monotomic_time_thrust_curve.csv');

subplot(2,1,1);
plot(burntime,thrust_curve);
title('Dynamic Weight Calculation Test - Motor Thrust Curve');
ylabel('Thrust - T (N)');
xlabel('Time - t (s)');

actual_weight_curve = dynamic_weight_calculation(thrust_curve, burntime, wet_motor_weight, dry_motor_weight, mfc);

subplot(2,1,2);
plot(burntime,actual_weight_curve(1,:))
title('Dynamic Weight Calculation Test - Motor Weight Curve');
ylabel('Weight - W (N)');
xlabel('Time - t (s)');

% TODO need to provide some hand-calculated data to assert against

% check that the last weight value is equal to the dry motor weight
assert ( actual_weight_curve(122,1) == dry_motor_weight );
