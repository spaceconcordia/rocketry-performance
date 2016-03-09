%% Plot Rocket Drag Coefficients
plot( openrocket_VarName1 , openrocket_Basedragcoefficient , 'm' );
hold on;
plot( openrocket_VarName1 , openrocket_Frictiondragcoefficient, 'b' );
plot( openrocket_VarName1 , openrocket_Pressuredragcoefficient, 'g' );
plot( openrocket_VarName1 , openrocket_Axialdragcoefficient, 'c' );
plot( openrocket_VarName1 , openrocket_Dragcoefficient, 'k' );
hold off;
title('OpenRocket - Drag Coefficient vs. Time');
xlabel('Time (s)');
legend ('Base','Friction','Pressure','Axial','Total');

if exist('saveplots')
    if saveplots % conditionally save the plot
        saveas(gcf, '../documentation/images/plots/openrocket_drag_coefficients.png');
        export_fig openrocket_drag_coefficients.png -m2
    end
end
