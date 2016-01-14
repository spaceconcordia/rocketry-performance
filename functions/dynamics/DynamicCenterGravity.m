function center_of_gravity = DynamicCenterGravity(inputs)
%% demux inputs
static_cog   = inputs(1);
static_mass  = inputs(2);
motor_cog    = inputs(3);
motor_mass   = inputs(4); % motor_mass is a function of time

center_of_gravity = ...
(static_mass*static_cog + motor_mass*motor_cog) / (static_mass + motor_mass);
