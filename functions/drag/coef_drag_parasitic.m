function C_parasitic = coef_drag_parasitic(L,h,C_stag,OD)
    %#codegen
    C_parasitic=max(1.3-0.3*(L-h)/OD, 1)*C_stag
end
