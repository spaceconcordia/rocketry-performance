arraysize = size(tout,1);
plot( mach_number , openrocket_drag_base_coef(1:arraysize) , 'm' );
hold on;
plot( mach_number , openrocket_drag_friction_coef(1:arraysize) , 'b' );
plot( mach_number , openrocket_drag_pressure_coef(1:arraysize) , 'g' );
plot( mach_number , openrocket_drag_axial_coef(1:arraysize) , 'c' );
plot( mach_number , openrocket_drag_coef(1:arraysize)  , 'k' );
hold off;

clear title xlabel ylabel
title('OpenRocket - Drag Coefficient vs. Mach Number');
xlabel('Mach Number');
ylabel('Drag Coefficient')
legend ('Base','Friction','Pressure','Axial','Total');
ylimit = [0,1]; 
n=11; % how many tickmarks
ax1 = gca;
ytic = linspace(ylimit(1),ylimit(2),n); 
set(ax1,'ylim', ylimit, 'ytick', ytic);

if exist('saveplots')
    if saveplots % conditionally save the plot
        saveas(gcf, '../documentation/images/plots/openrocket_drag_mach_coefficients.png');
        export_fig openrocket_drag_mach_coefficients.png -m2
    end
end
