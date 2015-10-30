function coef_drag_parasitic = CoefDragParasitic(inputs)

total_length_of_rocket = inputs(1);
height_of_nose_cone    = inputs(2);
coef_drag_stagnation   = inputs(3);
outer_diameter         = inputs(4);

coef_drag_parasitic = max(1.3-0.3*(total_length_of_rocket-height_of_nose_cone)/outer_diameter, 1)*coef_drag_stagnation;
end
