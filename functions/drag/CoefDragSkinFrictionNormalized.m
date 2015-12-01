function coef_skin_friction_drag_normalized = CoefDragSkinFrictionNormalized(inputs)
%% The skin friction drag coefficient is a function of the wetted area, the reference area, the boyant force
coef_skin_drag_corrected = inputs(1);
fineness_ratio           = inputs(2);
area_wetted_body         = inputs(3);
thickness_fins_base      = inputs(4);
fin_chord_length         = inputs(5);
area_wetted_fins         = inputs(6);
reference_area           = inputs(7);

coef_skin_friction_drag_normalized = ...
    coef_skin_drag_corrected * ...
    (...
      ( 1 + 1/(2*fineness_ratio) ) * area_wetted_body + ...
      ( 1 + ( (2*thickness_fins_base) / fin_chord_length) ) * area_wetted_fins  ...
    ) / reference_area;
end