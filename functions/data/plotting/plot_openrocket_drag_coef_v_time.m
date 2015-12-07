arraysize = size(tout,1);

%% Plot Rocket Drag Coefficients
plot( tout , openrocket_drag_base_coef(1:arraysize) , 'm' );
hold on;
plot( tout , openrocket_drag_friction_coef(1:arraysize) , 'b' );
plot( tout , openrocket_drag_pressure_coef(1:arraysize) , 'g' );
plot( tout , openrocket_drag_axial_coef(1:arraysize) , 'c' );
plot( tout , openrocket_drag_coef(1:arraysize) , 'k' );
hold off;
title('OpenRocket - Drag Coefficient vs. Time');
xlabel('Time (s)');
legend ('Base','Friction','Pressure','Axial','Total');

if exist('saveplots')
    if saveplots % conditionally save the plot
        saveas(gcf, '../documentation/images/plots/openrocket_drag_coefficients.png');
        export_fig openrocket_drag_coefficients.pnd -m2
    end
end
