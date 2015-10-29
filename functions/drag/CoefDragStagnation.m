function coef_drag_stagnation = CoefDragStagnation(mach_number)

if mach_number < 0.9
    coef_drag_stagnation = (1-M^2)^(-0.417) - 1
else
    % we don't support supersonic estimates yet
    coef_drag_stagnation = 1
end
