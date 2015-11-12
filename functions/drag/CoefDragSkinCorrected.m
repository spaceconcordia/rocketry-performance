function coef_drag_skin_corrected = CoefDragSkinCorrected(inputs)

coef_drag_skin_uncorrected = inputs(1);
mach_number                = inputs(2);

double coef_calculation;

coef_calculation = coef_drag_skin_uncorrected * (1-0.1*mach_number^2);

% or, if 0.8 < Mach < 1.1
% Prandtl-Glauert compressibility correction
% coef_calculation = coef_drag_skin_uncorrectd * 1 / sqrt(1-mach_number^2)
% coef_calculation = coef_drag_skin_uncorrectd * 1 / sqrt(1-0.8^2)

if coef_calculation>coef_drag_skin_uncorrected
  coef_drag_skin_corrected=coef_calculation;
else
  coef_drag_skin_corrected=coef_drag_skin_uncorrected;
end;
