%------------------------------------------------------------------------------
% run the function against input thrust data
%------------------------------------------------------------------------------

thrust_curve = read()

actual_weight_curve = dynamic_weight_calculation('thrust_curve.mat', 5.906*9.81,3.624*9.81,0.8236);

plot(actual_weight_curve(:,1),actual_weight_curve(:,2))

% TODO need to provide some hand-calculated data to assert against

assert ( 1 == 1 )
