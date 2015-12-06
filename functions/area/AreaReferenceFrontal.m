function area_reference_frontal = AreaReferenceFrontal(inputs)

%-------------------------------------------------------------------------------
% This function calculates the area of the rocket from the frontal reference
% at an angle attack of zero
%-------------------------------------------------------------------------------
outer_diameter = inputs(1);
number_of_fins = inputs(2);
fin_thickness  = inputs(3);
height_of_fins = inputs(4);

area_reference_frontal = (pi/4 * outer_diameter^2) + (fin_thickness * height_of_fins * number_of_fins);

assignin( 'base' , 'area_reference_frontal' , area_reference_frontal );

end
