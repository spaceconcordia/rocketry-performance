arraysize = size(tout,1)
plot( mach_number , openrocket_drag_base_coef(1:arraysize) , 'm' );
hold on;
plot( mach_number , openrocket_drag_friction_coef(1:arraysize) , 'b' );
plot( mach_number , openrocket_drag_pressure_coef(1:arraysize) , 'g' );
plot( mach_number , openrocket_drag_axial_coef(1:arraysize) , 'c' );
plot( mach_number , openrocket_drag_coef(1:arraysize)  , 'k' );
hold off;
title('OpenRocket - Drag Coefficient vs. Mach Number');
xlabel('Mach Number');
legend ('Base','Friction','Pressure','Axial','Total');

if saveplots % conditionally save the plot
    saveas(gcf, '../documentation/images/plots/openrocket_drag_mach_coefficients.png');
    export_fig openrocket_drag_mach_coefficients.pnd -m2
end
