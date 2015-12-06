plot( tout , coef_drag_base_normalized         , 'm' );
hold on;
plot( tout , coef_drag_fin_pressure_normalized , 'g' );
plot( tout , coef_drag_parasitic               , 'r' );
plot( tout , coef_drag_skin_friction           , 'b' );
plot( tout , drag_coefficient                  , 'k' );
hold off;
title('Matlab - Drag Coefficient vs. Time');
xlabel('Time (s)');
legend ('Base','Fin Pressure','Parasitic','Skin Friction','Total Drag Coefficient');

if saveplots % conditionally save the plot
    saveas(gcf, '../documentation/images/plots/drag_coefficients.png');
    export_fig drag_coefficients.pnd -m2
end