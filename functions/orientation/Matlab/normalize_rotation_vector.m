function normal_vector = normalize_rotation_vector(Rvec)

% Rotation vector co-ordinates:
Rx = Rvec(1);
Ry = Rvec(2);
Rz = Rvec(3);

% Vector magnitude:
Rmag = sqrt(Rx^2+Ry^2+Rz^2);

% Normalized (unit) vector coordinates:
ax = Rx/Rmag;
ay = Ry/Rmag;
az = Rz/Rmag;

Rnorm = [ax, ay, az];

MagRnorm = sqrt(ax^2+ay^2+az^2);

expected = 1;
actual = MagRnorm;
assert (...
    actual == expected, ...
    'Rotation Unit Vector Magnitude \n actual = %d \n expected = %d ', actual, expected ...
);

%disp('Rotation unit vector has magnitude of 1!');

normal_vector = [ax, ay, az];

end
