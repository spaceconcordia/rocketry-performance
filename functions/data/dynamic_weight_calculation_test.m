%------------------------------------------------------------------------------
%
% Dynamic Weight Calculation Test
%
% run the function against input thrust data
%------------------------------------------------------------------------------

g                = 9.81;
wet_motor_weight = 5.906*g;
dry_motor_weight = 3.624*g;
mfc              = 0.8236*g;

thrust_curve = thrust_data_import('monotomic_time_thrust_curve.csv');

burntime     = thrust_curve(:,1);
thrust_force = thrust_curve(:,2);

subplot(2,1,1);
plot(burntime,thrust_force);
title('Dynamic Weight Calculation Test - Motor Thrust Curve');
ylabel('Thrust - T (N)');
xlabel('Time - t (s)');

[actual_mass, actual_weight, actual_thrust] = dynamic_weight_calculation(thrust_curve, wet_motor_weight, mfc);

subplot(2,1,2);
plot(burntime,actual_weight(:,1))
title('Dynamic Weight Calculation Test - Motor Weight Curve');
ylabel('Weight - W (N)');
xlabel('Time - t (s)');

% TODO need to provide some hand-calculated data to assert against

% check that the last weight value is equal to the dry motor weight
%assert ( actual_weight_curve(122,1) == dry_motor_weight );
last_row = size(actual_weight,1);
final_weight = actual_weight(last_row, 1);

% TODO right now this assertion fails because the thrust data is not interpolated
assert ( dry_motor_weight == final_weight );
