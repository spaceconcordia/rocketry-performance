function weight_curve = dynamic_weight_calculation(thrust_curve, burntime, wet_motor_weight, dry_motor_weight, mfc)
%------------------------------------------------------------------------------
% INPUT PARAMETERS
% thrust_curve     - a horizontal data set containing time and thrust
%                    data from a given motor    
% mfc              - the mass flow rate based on fuel consumption 
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

weight_curve = thrust_curve;

% zero all thrust data to be replaced by weight data
weight_curve(1,:)=0;
    
for i = 1:length(thrust_curve)
    weight_curve(1,i) = wet_motor_weight - mfc*burntime(i,1); 
end
