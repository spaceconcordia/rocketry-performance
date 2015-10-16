%------------------------------------------------------------------------------
%
% thrust_data_import_test.m
%
% Data Access of Parametric Model
%
%------------------------------------------------------------------------------

thrust_curve = thrust_data_import('monotomic_time_thrust_curve.csv');

time   = thrust_curve(1,:)
thrust = thrust_curve(2,:);

plot(time, thrust);

assert (1 == 1);

