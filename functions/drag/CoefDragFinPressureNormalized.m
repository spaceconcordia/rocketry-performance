function coef_drag_fin_pressure_normalized = CoefDragFinPressureNormalized(inputs)

fin_pressure_drag      = inputs(1)
number_of_fins         = inputs(2)
base_thickness_of_fins = inputs(3)
height_of_fins         = inputs(4)
reference_area         = inputs(5)

coef_drag_fin_pressure_normalized = fin_pressure_drag*number_of_fins*base_thickness_of_fins*height_of_fins/reference_area;
