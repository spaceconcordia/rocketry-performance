function COEF_drag_skin_friction(A_wet_fins, A_ref, C_f_c, f_b, t, c)

% Skin Friction Drag is a component of parasitic drag
% The skin friction drag coefficient is a function of the wetted area, the reference area, the boyant force

function C_D_fric = fcn(C_f_c, f_b, A_wet_body, t, c, A_wet_fins, A_ref)
%#codegen
C_D_fric=C_f_c*( (1+1/(2*f_b))*A_wet_body + (1+2*t/c)*A_wet_fins  )/A_ref
end