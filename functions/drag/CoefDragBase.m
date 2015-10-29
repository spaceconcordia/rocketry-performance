function coef_drag_base = CoefDragBase(mach_number)

if mach_number<1
    coef_drag_base = 0.12+0.13*mach_number^2;
else
    % TODO we don't support supersonic velocity yet
    coef_drag_base = 0.25/mach_number;
end

end
