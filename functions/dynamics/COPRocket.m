function cop_rocket = COPRocket(inputs)

aoa                 = inputs(1);
sd_nosecone         = inputs(2);
sd_bodytube         = inputs(3);
sd_finset           = inputs(4);
sd_rocket_planform  = inputs(5);
cop_nose_cone       = inputs(5);
cop_body_tube       = inputs(6);
cop_fin_set         = inputs(8);
cop_rocket_planform = inputs(9);
coef_normal_force   = inputs(10);

% prevent division by zero
if coef_normal_force == 0
    coef_normal_force = 1;
end

numerator = ...
    ( cos(aoa) * sd_nosecone * cop_nose_cone ) ...
    + ...
    ( cos(aoa) * sd_bodytube * cop_body_tube ) ...
    + ...
    ( cos(aoa) * sd_finset * cop_fin_set ) ...
    + ...
    ( cos(aoa) * sd_rocket_planform * cop_rocket_planform ) ...
    ;

cop_rocket = numerator / coef_normal_force;
