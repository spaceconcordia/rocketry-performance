function force_normal = ForceNormal(inputs)

density = inputs(1);
velocity = inputs(2);
area_cross_sec = inputs(3);
coef_force_normal = inputs(4);

force_normal = 1/2 * density * velocity^2 * area_cross_sec * coef_force_normal;
