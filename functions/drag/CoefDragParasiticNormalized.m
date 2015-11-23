function coef_drag_parasitic_norm = CoefDragParasiticNormalized(inputs)

coef_drag_parasitic          = inputs(1);
reference_area               = inputs(2);
launch_guide_radius_exterior = inputs(3);
launch_guide_radius_interior = inputs(4);
total_length_of_rocket       = inputs(5);
height_of_nose_cone          = inputs(6);
outer_diameter               = inputs(7);

coef_drag_parasitic_norm = coef_drag_parasitic*(3.14159*(launch_guide_radius_exterior^2-launch_guide_radius_interior^2)*max(1-(total_length_of_rocket-height_of_nose_cone)/outer_diameter, 0))/reference_area;

