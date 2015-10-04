function weight_curve = dynamic_weight_calculation(thrust_curve, wet_motor_weight, dry_motor_weight, mfc)
    % INPUT PARAMETERS
    % thrust_curve     - a horizontal data set containing time and thrust
    %                    data from a given motor    
    % mfc              - the mass flow rate based on fuel consumption 
    % wet_motor_weight - the weight in Newtons of a motor *including* 
    %                    propellant
    % dry_motor_weight - the weight in Newtons of a motor *excluding* 
    %                    propellant

    % NOTE: this implementation skips the W_dot evaluation, just uses mfc 
    % NOTE: UNTESTED

    % create the weight curve with the same time set and dimensions
    % as the input thrust curve
    weight_curve = thrust_curve;

    % zero all thrust data to be replaced by weight data
    weight_curve(2,:)=0;
        
    for i = 1:length(thrust_curve)
        weight_curve(2,i) = wet_motor_weight - mfc*weight_curve(1,i); 
    end
