% -----------------------------------------------------
%   Inputs
% -----------------------------------------------------

% Get point/vector to be rotated, P
prompt = 'Input the P matrix (point to be rotated): ';
P = input(prompt);

% Get rotation vector, R_vec
prompt = 'Input the vector about which you wish to rotate: ';
R_vec = input(prompt);

% Get angle of rotation, thetaDeg
prompt = 'Input the angle through which you wish to rotate (in degrees): ';
thetaDeg = input(prompt);

% -----------------------------------------------------
%   Run Method I: Quaternion Rotation
% -----------------------------------------------------

disp('The rotated point for Method I is: ');
p_prime = method_I_quaternion(P, R_vec, thetaDeg)  

% -----------------------------------------------------
%   Run Method II: Rotation Matrix
% -----------------------------------------------------

disp('The rotated point for Method II is: ');
p_prime = method_II_quaternion(P, R_vec, thetaDeg)  