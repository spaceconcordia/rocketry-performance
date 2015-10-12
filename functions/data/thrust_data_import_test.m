%------------------------------------------------------------------------------
%
% thrust_data_import_test.m
%
% Data Access of Parametric Model
%
%------------------------------------------------------------------------------

thrust_curve = thrust_data_import('monotomic_time_thrust_curve.csv')

plot(thrust_curve(:,1), thrust_curve(:,2))

assert (1 == 0)

