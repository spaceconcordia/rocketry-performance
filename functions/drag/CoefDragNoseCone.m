function coef_drag_nose_cone = CoefDragNoseCone(inputs)

A                        = inputs(1);
reference_area           = inputs(2);
nose_profile_coefficient = inputs(3);

% this is BS, placeholder
coef_drag_nose_cone = A * reference_area * nose_profile_coefficient * 0;
