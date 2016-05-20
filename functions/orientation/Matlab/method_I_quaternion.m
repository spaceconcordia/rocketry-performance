function p_prime = method_I_quaternion(P, R_vec, thetaDeg)  

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


theta = thetaDeg*pi/180;

% -----------------------------------------------------
%   Make P go into the complex "world"
% -----------------------------------------------------

% TODO: Is this legit?
for i = 1:3
    P(5-i) = P(4-i);
end
P(1) = 0;

% -----------------------------------------------------
%   Normalize Rotation Vector
% -----------------------------------------------------

% Normalized vector:
normR = normalize_rotation_vector(R_vec);

% -----------------------------------------------------
%   Get Quaternion and Conjugate of Quaternion
% -----------------------------------------------------

% q is quaternion
% q_con is the conjugate of the quaternion

q = get_quaternion(normR, theta);
q_con = get_con(q);

% -----------------------------------------------------
%   Obtain rotated vector (p' = qpq^-1)
% -----------------------------------------------------

% Get transposes of matrices for future use:
trans_q = transpose(q);
trans_P = transpose(P);
trans_q_con = transpose(q_con);

% Calculate the first part of the equation, qp
% Note: The result gives a 4x4 matrix, and must be resolved into a 4x1
% vector
qp_matrix = trans_q*P;

% Next, the qp VECTOR (4x1) must be obtained from the resulting 4x4 MATRIX
% This is done using the quaternion multiplication table:
%  x |	1	 i	 j	 k |
%----+-----------------+
%  1 |  1	 i	 j	 k |
%  i |  i	-1	 k	-j |
%  j |  j	-k	-1	 i |
%  k |  k	 j	-i	-1 |
%----------------------+

qp = [0 0 0 0];
qp(1) = qp_matrix(1,1);
for j = 2:4
    qp(1) = qp(1) - qp_matrix(j,j);
end
qp(2) = qp_matrix(1,2) + qp_matrix(2,1) + qp_matrix(3,4) - qp_matrix(4,3);
qp(3) = qp_matrix(1,3) + qp_matrix(3,1) + qp_matrix(4,2) - qp_matrix(2,4);
qp(4) = qp_matrix(1,4) + qp_matrix(4,1) + qp_matrix(2,3) - qp_matrix(3,2);

% This is the transpose of the qp vector:
qp_t = transpose(qp);

% Finally, the qpq^-1 matrix can be found:
qpq_con = qp_t*q_con;

% Once again, the quaternion multiplication table is used to resolve the
% matrix into its 4x1 vector:
P_prime = [0 0 0 0];
P_prime(1) = qpq_con(1,1);
for k = 2:4
    P_prime(1) = P_prime(1) - qpq_con(k,k);
end
P_prime(2) = qpq_con(1,2) + qpq_con(2,1) + qpq_con(3,4) - qpq_con(4,3);
P_prime(3) = qpq_con(1,3) + qpq_con(3,1) + qpq_con(4,2) - qpq_con(2,4);
P_prime(4) = qpq_con(1,4) + qpq_con(4,1) + qpq_con(2,3) - qpq_con(3,2);

% % The final answer is P_prime:
% % Note: The expected value for P_prime(1) is 0.

ppp_prime = [0; 0; 0];
 if abs(P_prime(1)) <= 0.000001
    for m = 1:3
        ppp_prime(m) = P_prime(m+1);
    end
    p_prime = ppp_prime;
 else
     disp('The first value of P_prime is not zero, which isnt normal so there is a problem somewhere... ')
    p_prime = P_prime;
 end


% Validation done using the following solved examples:
% http://www.imsc.res.in/~knr/131129workshop/writeup_knr.pdf

% -----------------------------------------------------
%   Plot vector and rotated vector
% -----------------------------------------------------

end