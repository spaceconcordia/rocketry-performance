function rocket_moment_of_inertia = DynamicMomentInertia(inputs)

%% demux inputs
rocket_cog            = inputs(1);
static_cog            = inputs(2);
static_mass           = inputs(3);
static_moment_inertia = inputs(4);
motor_length          = inputs(5);
motor_cog             = inputs(6);
motor_mass            = inputs(7); % motor mass is a function of time

% static parameters refer to the state when all fuel is expended

%% calculate the distance between the rocket_cog and the static_cog
% this is the distance of the static mass from the axis of rotation
d_staticcog_rocketcog = abs(rocket_cog-static_cog);

%% applying the parallel axis theorem:
% calculate the moment of inertia of the STATIC mass
I_s = static_moment_inertia + static_mass*(d_staticcog_rocketcog)^2;

%% calculate the distance between the rocket_cog and the static_cog
% this is the distance of the motor mass from the axis of rotation
d_motorcog_rocketcog = abs(rocket_cog-motor_cog);

%% applying the parallel axis theorem:
% calculate the moment of inertia of the CHANGING mass
motor_moment_inertia = (1/12) * (motor_mass*motor_length^2);
I_m = motor_moment_inertia + motor_mass*(d_motorcog_rocketcog)^2;

%% the total rocket moment of inertia is the sum of the component
% inertia
rocket_moment_of_inertia = I_s + I_m;