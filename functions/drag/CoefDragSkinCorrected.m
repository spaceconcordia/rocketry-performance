function coef_drag_skin_corrected = CoefDragSkinCorrected(inputs)

coef_drag_skin_uncorrected = inputs(1);
mach_number                = inputs(2);

% or, if 0.8 < Mach < 1.1, apply Prandtl-Glauert compressibility correction
if mach_number < 1
    % apply subsonic correction factor 
    coef_calculation=...
      coef_drag_skin_uncorrected * (1-0.1*mach_number^2);
    % take the higher of the corrected or uncorrected
    if coef_calculation>coef_drag_skin_uncorrected
      coef_drag_skin_corrected=coef_calculation
    else
      coef_drag_skin_corrected=coef_drag_skin_uncorrected;
    end;
else
    % calculate corrected roughness limited value for comparison
    coef_roughness_limited =...
       coef_drag_skin_uncorrected / (1+0.18*mach_number^2);

    % apply supersonic correction factor
    coef_drag_skin_corrected=...
        coef_drag_skin_uncorrected...
            * ((1+0.15*mach_number^2)^0.58)^-1;

    % take the higher of the roughness limited or supersonic correction
    if coef_roughness_limited > coef_drag_skin_corrected
        coef_drag_skin_corrected = coef_roughness_limited
    end
end
