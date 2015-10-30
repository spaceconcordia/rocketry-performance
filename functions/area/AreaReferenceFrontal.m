function area_reference_frontal = AreaReferenceFrontal(inputs)

outer_diameter = inputs(1)
number_of_fins = inputs(2)
fin_thickness  = inputs(3)
height_of_fins = inputs(4)

area_reference_frontal=3.14159*outer_diameter^2/4+fin_thickness*s*number_of_fins

end
