function center_of_gravity = DynamicCenterGravity(inputs)
%% demux inputs
static_mass  = inputs(1);
static_cog   = inputs(2);
motor_mass   = inputs(3); % motor_mass is a function of time
motor_cog    = inputs(4);

center_of_gravity = ...
(static_mass*static_cog + motor_mass*motor_cog) / (static_mass + motor_mass);
