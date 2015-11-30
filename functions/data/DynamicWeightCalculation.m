function outputs = DynamicWeightCalculation(inputs)
%--------------------------------------------------------------------------
% INPUT PARAMETERS
% thrust_curve     - a horizontal data set containing time and thrust
%                    data from a given motor    
% wfc              - the rate of motor weight loss due to fuel consumption 
% wet_motor_weight - the weight in Newtons of a motor *including* 
%                    propellant
%
% NOTE: this implementation skips the W_dot evaluation, just uses mfc 
% NOTE: UNTESTED
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
% Demux inputs
%--------------------------------------------------------------------------
thrust_curve      = inputs(1);
burntime          = inputs(2);
wet_motor_weight  = inputs(3);
dry_motor_weight  = inputs(4);
wfc               = inputs(5);
dry_rocket_weight = inputs(6);

%--------------------------------------------------------------------------
% populate motor_weight array
%--------------------------------------------------------------------------
motor_weight_buffer = wet_motor_weight - wfc.*burntime;

if motor_weight_buffer <= dry_motor_weight
    motor_weight = dry_motor_weight;
else
    motor_weight = wet_motor_weight - wfc.*burntime;
end

weight          = motor_weight + dry_rocket_weight;
thrust          = thrust_curve;
mass            = weight / 9.81;
mass_propellant = (motor_weight - dry_motor_weight) / 9.81;

%--------------------------------------------------------------------------
% Mux outputs
%--------------------------------------------------------------------------
outputs = [mass, weight, thrust, mass_propellant];

%--------------------------------------------------------------------------
% END OF FUNCTION
%--------------------------------------------------------------------------
end
