%% Plot Rocket Drag Coefficients
figure;
plot( tout , coef_drag_base_normalized         , 'm' );
hold on;
plot( tout , coef_drag_fin_pressure_normalized , 'b' );
plot( tout , coef_drag_parasitic               , 'g' );
plot( tout , coef_drag_skin_friction           , 'r' );
plot( tout , drag_coefficient                  , 'k' );
hold off;
legend ('Base','Fin Pressure','Parasitic','Skin Friction','Total Drag Coefficient');

if saveplots % conditionally save the plot
    saveas(gcf, '../documentation/images/plots/drag_coefficients.png');
    export_fig drag_coefficients.pnd -m2
end

figure;
plot( mach_number , coef_drag_base_normalized         , 'm' );
hold on;
plot( mach_number , coef_drag_fin_pressure_normalized , 'b' );
plot( mach_number , coef_drag_parasitic               , 'g' );
plot( mach_number , coef_drag_skin_friction           , 'r' );
plot( mach_number , drag_coefficient                  , 'k' );
hold off;
legend ('Base','Fin Pressure','Parasitic','Skin Friction','Total Drag Coefficient');

if saveplots % conditionally save the plot
    saveas(gcf, '../documentation/images/plots/drag_mach_coefficients.png');
    export_fig drag_mach_coefficients.pnd -m2
end
