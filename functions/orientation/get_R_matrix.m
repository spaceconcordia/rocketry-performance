function R_matrix = get_R_matrix(normR, theta)

% Find rotation matrix components:
w = cos(theta/2);
Vx = normR(1)*sin(theta/2);
Vy = normR(2)*sin(theta/2);
Vz = normR(3)*sin(theta/2);

R_matrix = [1-2*Vy^2-2*Vz^2, 2*Vx*Vy-2*w*Vz, 2*Vx*Vz+2*w*Vy;...
    2*Vx*Vy+2*w*Vz, 1-2*Vx^2-2*Vz^2, 2*Vy*Vz-2*w*Vx;...
    2*Vx*Vz-2*w*Vy, 2*Vy*Vz+2*w*Vx, 1-2*Vx^2-2*Vy^2];

end