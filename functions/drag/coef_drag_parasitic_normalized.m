function C_parasitic_norm = coef_drag_parasitic_normalized(C_parasitic, A_ref, r_ext, r_int, L, h, OD)
    C_parasitic_norm=C_parasitic*(3.14159*(r_ext^2-r_int^2)*max(1-(L-h)/OD, 0))/A_ref
end
