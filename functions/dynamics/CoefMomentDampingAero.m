function coef_moment_damping = CoefMomentDampingAero(inputs)

density                     = inputs(1);
velocity                    = inputs(2);
area_ref                    = inputs(3);
component_coef_force_normal = inputs(4);
component_distance_cop      = inputs(5);
component_distance_cog      = inputs(6);

sum_term = 0;
sum_size = size(component_coef_force_normal,1);

for i = 1:sum_size
    sum_term = sum_term + ...
        component_coef_force_normal(i) ...
        * (component_distance_cop(i) - component_distance_cog(i))^2;
end

coef_moment_damping = ...
    1 / 2 ... 
    * density ...
    * velocity^2 ...
    * area_ref ...
    * sum_term;
