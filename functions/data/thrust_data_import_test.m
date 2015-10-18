%------------------------------------------------------------------------------
%
% thrust_data_import_test.m
%
% Data Access of Parametric Model
%
%------------------------------------------------------------------------------

%thrust_curve = thrust_data_import('monotomic_time_thrust_curve.csv');
thrust_curve = thrust_data_import();
thrust_curve_len = length(thrust_curve);

burntime     = thrust_curve(:,1);
thrust_force = thrust_curve(:,2);

plot(burntime, thrust_force);

assert (1 == 1);

