function area_wetted_body = AreaWettedBody(inputs)

outer_diameter      = inputs(1);
total_length        = inputs(2);
height_of_nose_cone = inputs(3);
fin_thickness       = inputs(4);
number_of_fins      = inputs(5);
fin_length          = inputs(6);
A_surface_nose      = inputs(7);

area_wetted_body=3.14159*outer_diameter*(total_length-height_of_nose_cone)+A_surface_nose-fin_length*fin_length*number_of_fins;

end
