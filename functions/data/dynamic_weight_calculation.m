function weight_curve = dynamic_weight_calculation(thrust_curve, wet_motor_weight, wfc)
%------------------------------------------------------------------------------
% INPUT PARAMETERS
% thrust_curve     - a horizontal data set containing time and thrust
%                    data from a given motor    
% wfc              - the rate of motor weight loss due to fuel consumption 
% wet_motor_weight - the weight in Newtons of a motor *including* 
%                    propellant
% dry_motor_weight - the weight in Newtons of a motor *excluding* 
%                    propellant
%
% NOTE: this implementation skips the W_dot evaluation, just uses mfc 
% NOTE: UNTESTED
%------------------------------------------------------------------------------

% create the weight curve from an input thrust curvve matlab file 
% with the same dimensions as the input thrust curve
% weight_curve = {'time','weight'}

% grab the size of the input thrust curve
data_length = size(thrust_curve,1);

% create the corresponding weight curve, same size
weight_curve = zeros(data_length,1);
%weight_curve = thrust_curve;

% zero all thrust data to be replaced by weight data
%weight_curve(:,2) = 0;
    
%for i = 1:length(thrust_curve)
for i = 1:data_length
    weight_curve(i,1) = wet_motor_weight - wfc*thrust_curve(i,1); 
end
