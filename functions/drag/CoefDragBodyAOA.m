function coef_drag_body_aoa = CoefDragBodyAOA(inputs)

aoa   = inputs(1); % Angle of Attack
delta = inputs(2); % Experimentally determined coefficient
eta   = inputs(3); % Experimentally determined coefficient
L     = inputs(4); % Total rocket length
h_n   = inputs(5); % Height of nose cone
OD    = inputs(6); % Rocket body diameter

coef_drag_body_aoa = ...
    2 * delta * aoa^2 ...
    + ...
    3.6 * eta * ( 1.36 * L - 0.55 * h_n ) ...
    / ...
    pi() * OD ...
    * ...
    aoa^3 ...
    ;
