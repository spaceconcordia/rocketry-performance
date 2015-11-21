function coef_drag_base_normalized = CoefDragBaseNormalized(inputs)

coef_drag_base = inputs(1);
reference_area = inputs(2); % TODO should be motor base area
outer_diameter = inputs(3);

coef_drag_base_normalized = coef_drag_base*3.14159*(outer_diameter^2/4)/reference_area;
