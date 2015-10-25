function DynWCalcOutputs = DynWCalc(inputs)

% function [mass, weight, thrust] = dynamic_weight_calculation(thrust_curve, burntime, wet_motor_weight, dry_motor_weight, wfc)
%------------------------------------------------------------------------------
% INPUT PARAMETERS
% thrust_curve     - a horizontal data set containing time and thrust
%                    data from a given motor    
% wfc              - the rate of motor weight loss due to fuel consumption 
% wet_motor_weight - the weight in Newtons of a motor *including* 
%                    propellant
%
% NOTE: this implementation skips the W_dot evaluation, just uses mfc 
% NOTE: UNTESTED
%------------------------------------------------------------------------------


thrust_curve = inputs(1); %inputs = 
burntime = inputs(2);
wet_motor_weight = inputs(3);
dry_motor_weight = inputs(4);
wfc = inputs(5);

% grab the size of the input thrust curve
data_length = size(thrust_curve,1);

% create the corresponding weight curve, same size
weight = zeros(data_length,1);

% populate weight array
weight_buffer = wet_motor_weight - wfc.*burntime;

if weight_buffer <= dry_motor_weight
    weight = dry_motor_weight
else
    weight = wet_motor_weight - wfc.*burntime;
end

%for i = 1:data_length
%    weight(i,1) = wet_motor_weight - wfc*i*0.01
%end

thrust = thrust_curve;
mass = weight * 9.81;

DynWCalcOutputs = [mass, weight, thrust];

end

