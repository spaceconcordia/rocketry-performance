function cop_rocket = COPRocket(inputs)

aoa                       = inputs(1);
stability_derivative_list = inputs(2);
cop_component_list        = inputs(3);
coef_normal_force         = inputs(4);

size_sdl = size(stability_derivative_list)
size_cop = size(cop_component_list)
stability_derivative_list
cop_component_list

% verify incoming muxed arrays are the same size
if size(stability_derivative_list,1) ~= size(cop_component_list)
    error('Size of stability_derivative_list must be equal to the size of cop_component_list')
end

% prevent division by zero
if coef_normal_force == 0
    coef_normal_force = 1
end

numerator = 0;
for i = 1:size(stability_derivative_list,1)
    numerator = numerator + ( cos(aoa) * stability_derivative_list(i) * cop_component_list(i) )
end

%numerator = cos(aoa) + (stability_derivative_list .* cop_component_list)

cop_rocket = numerator / coef_normal_force
