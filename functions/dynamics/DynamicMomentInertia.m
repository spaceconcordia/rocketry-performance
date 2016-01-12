function moment_of_inertia = DynamicMomentInertia(inputs)
%% demux inputs
rocket_cog            = inputs(1);
static_cog            = inputs(2);
static_mass           = inputs(3);
static_moment_inertia = inputs(4);
motor_length          = inputs(5);
motor_cog             = inputs(6);
motor_mass            = inputs(7); % motor mass is a function of time

d_staticcog_rocketcog = abs(rocket_cog-static_cog);
I_1 = static_moment_inertia + static_mass*(d_staticcog_rocketcog)^2;

motor_moment_inertia = (1/12) * (motor_mass*motor_length^2);
I_2 = static_moment_inertia + static_mass*(d_staticcog_rocketcog)^2;

moment_of_inertia = static_moment_inertia + motor_moment_inertia;
