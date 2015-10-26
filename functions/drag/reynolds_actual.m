function ra = reynolds_actual(velocity, length, temperature)
%function ra = reynolds_actual(velocity, length, kinematic_viscosity)

% TODO verify this

T = temperature

%ra = (velocity * length) / kinematic_viscosity

A = -1e-14
B = 1e-10
C = 3e-8
D = 3e-6

ra = (velocity * length) / (A*T^3 + B*T^2 + C*T - D)

end
