function C_f = CoefDragSkinUncorrected_Niskanen(inputs)

reynolds_number_actual   = inputs(1);
reynolds_number_critical = inputs(2);
R_s                      = inputs(3);
L                        = inputs(4);

if reynolds_number_actual<1E4
  C_f = 0.0148;
elseif reynolds_number_actual> 1E4 && reynolds_number_actual<reynolds_number_critical
  C_f = 1 / (1.5 * log(reynolds_number_actual) - 5.6 )^2;
elseif reynolds_number_actual > reynolds_number_critical
  C_f = 0.032*(R_s/L)^(0.2);
else
  error('Something is wrong')
end 

