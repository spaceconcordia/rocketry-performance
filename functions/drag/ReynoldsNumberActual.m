function reynolds_number_actual = ReynoldsNumberActual(inputs)

velocity            = inputs(1);
length              = inputs(2);
kinematic_viscosity = abs( inputs(3) );

reynolds_number_actual = (velocity * length) / kinematic_viscosity;

end
