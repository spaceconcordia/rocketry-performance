function C_parasitic = coef_drag_parasitic(L,h,C_stag,OD)
    % L - total length of rocket 
    % h - 
    % C_stag - stagnation drag coefficient
    % OD - rocket outer diameter
    C_parasitic=max(1.3-0.3*(L-h)/OD, 1)*C_stag
end
