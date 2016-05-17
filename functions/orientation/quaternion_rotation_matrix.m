% -----------------------------------------------------
%   Inputs
% -----------------------------------------------------

% TODO: Make these inputs user-inputs:

% Point to rotate:
P(1) = 1;
P(2) = -1;
P(3) = 2;

% Rotation vector co-ordinates:
Rvec(1) = 0;
Rvec(2) = 0.5;
Rvec(3) = sqrt(3)/2;

% Angle of rotation:
thetaDeg = 60;
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

B = transpose(P);
P_prime = R*B;

P_prime

% Validation done using the following solved examples:
% http://www.imsc.res.in/~knr/131129workshop/writeup_knr.pdf

% -----------------------------------------------------
%   Plot vector and rotated vector
% -----------------------------------------------------

