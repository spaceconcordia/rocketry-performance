function reynolds_number_actual = ReynoldsNumberActual(inputs)
%function ra = reynolds_actual(velocity, length, kinematic_viscosity)

velocity            = inputs(1);
length              = inputs(2);
kinematic_viscosity = inputs(3);

reynolds_number_actual = (velocity * length) / kinematic_viscosity;

end
