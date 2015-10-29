function reynolds_number_critical = ReynoldsNumberCritical(inputs)

surface_roughness = inputs(1);
length            = inputs(2);

% TODO this relation and exponent need to be verified

critical_exponent        = -1.039
reynolds_number_critical = 51 * (surface_roughness/length)^critical_exponent

end