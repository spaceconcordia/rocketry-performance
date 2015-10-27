function CoefDragSkinFriction(inputs)

% Skin Friction Drag is a component of parasitic drag
% The skin friction drag coefficient is a function of the wetted area, the reference area, the boyant force
C_f_c      = inputs(1);
f_b        = inputs(2);
A_wet_body = inputs(3);
t          = inputs(4)
c          = inputs(5);
A_wet_fins = inputs(6);
A_ref      = inputs(7);

C_D_fric = C_f_c * (  ( 1 + 1/ (2*f_b) )*A_wet_body + (1+2*t/c)*A_wet_fins  ) / A_ref
end
