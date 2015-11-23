function coef_drag_stagnation = CoefDragStagnation(mach_number)
if mach_number<1
    coef_drag_stagnation=0.85*(1+mach_number^2/4+mach_number^4/40);
else
    coef_drag_stagnation=1;
    %coef_drag_stagnation=0.85*(1.84-0.76/mach_number^2+0.166/mach_number^4+0.035/mach_number^6);
end
