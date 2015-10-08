function C_stag = coef_drag_stagnation(M)
    % 1.84 - 
    % 0.76 - 
    % 0.166 - 
    % 0.035 - 
    % 0.85 - 
    if M<1
            C_stag=0.85*(1+M^2/4+M^4/40)
    else
            C_stag=0.85*(1.84-0.76/M^2+0.166/M^4+0.035/M^6)
    end
end
