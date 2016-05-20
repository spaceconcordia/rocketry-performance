function p_prime = method_II_quaternion(P, R_vec, thetaDeg)  

% -----------------------------------------------------
%   Inputs
% -----------------------------------------------------

% % TODO: Make these inputs user-inputs:
% 
% % Point to rotate:
% P(1) = 1;
% P(2) = -1;
% P(3) = 2;
% 
% % Rotation vector co-ordinates:
% Rvec(1) = 0;
% Rvec(2) = 0.5;
% Rvec(3) = sqrt(3)/2;
% 
% % Angle of rotation:
% thetaDeg = 60;
% theta = thetaDeg*pi/180;

% TODO: Check that P is 4x1 matrix like this: [x x x x]
% TODO: Check that R_vec is 3x1 matrix like this: [x x x x]
% TODO: Make sure that thetaDeg is given in degrees

theta = thetaDeg*pi/180;

% -----------------------------------------------------
%   Normalize Rotation Vector
% -----------------------------------------------------

% Normalized vector:
normR = normalize_rotation_vector(Rvec);

% -----------------------------------------------------
%   Obtain rotation matrix
% -----------------------------------------------------

R = get_R_matrix(normR, theta);

% -----------------------------------------------------
%   Obtain rotated vector
% -----------------------------------------------------

P_t = transpose(P);
P_prime = R*P_t;

%Print final answer:
p_prime = P_prime

% Validation done using the following solved examples:
% http://www.imsc.res.in/~knr/131129workshop/writeup_knr.pdf

% -----------------------------------------------------
%   Plot vector and rotated vector
% -----------------------------------------------------
end
