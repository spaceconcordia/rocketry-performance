function C_f = CoefDragSkinUncorrected(inputs)

reynolds_number_actual   = inputs(1);
reynolds_number_critical = inputs(2);
R_s                      = inputs(3);
L                        = inputs(4);

% TODO verify source, suspect OpenRocket tech doc
if reynolds_number_actual<1E4
    C_f=0.0148
else if reynolds_number_actual <= reynolds_number_critical
    C_f = 1.328 ./ sqrt(reynolds_number_actual)
else 
    B = (reynolds_number_critical).*(0.074 / reynolds_number_actual^(1/5) - 1.328 / sqrt(reynolds_number_actual));
    C_f = (0.074 ./ reynolds_number_actual^(1/5)) - (B ./ reynolds_number_actual)
end

%{
if reynolds_number_actual<1E4
  C_f=0.0148
elseif reynolds_number_actual<reynolds_number_critical
  %C_f=1/(1.5*log(reynolds_number_actual)-5.6)^2 
%else
  %C_f=0.032*(R_s/L)^(0.2)
%end 
%}

end
