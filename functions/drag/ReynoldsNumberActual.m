function reynolds_number_actual = ReynoldsNumberActual(inputs)
%function ra = reynolds_actual(velocity, length, kinematic_viscosity)

velocity    = inputs(1);
length      = inputs(2);
temperature = inputs(3);

T = temperature;

%ra = (velocity * length) / kinematic_viscosity

% TODO verify this
A = -1e-14;
B = 1e-10;
C = 3e-8;
D = 3e-6;

reynolds_number_actual = (velocity * length) / (A*T^3 + B*T^2 + C*T - D);

end
