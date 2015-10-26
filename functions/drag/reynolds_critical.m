function rc = reynolds_critical(surface_roughness, length)

% TODO this relation and exponent need to be verified

critical_exponent = -1.039
rc = 51 * (surface_roughness/L)^critical_exponent

end
