function C_f = CoefDragSkinUncorrected(inputs)

reynolds_number_actual   = inputs(1);
reynolds_number_critical = inputs(2);
R_s                      = inputs(3);
L                        = inputs(4);

double C_f
double B

if reynolds_number_actual <= reynolds_number_critical
    C_f = 1.328 / sqrt(reynolds_number_actual);
else 
    B = ...
        (reynolds_number_critical) ...
        *(...
            0.074 / reynolds_number_actual^(1/5) ...
            - 1.328 / sqrt(reynolds_number_actual) ...
         );

    C_f = ...
        (0.074 / reynolds_number_actual^(1/5)) ...
        - (B / reynolds_number_actual);
end

