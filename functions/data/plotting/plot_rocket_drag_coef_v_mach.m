figure;
plot( mach_number , coef_drag_base_normalized         , 'm' );
hold on;
plot( mach_number , coef_drag_fin_pressure_normalized , 'g' );
plot( mach_number , coef_drag_parasitic               , 'r' );
plot( mach_number , coef_drag_skin_friction           , 'b' );
plot( mach_number , drag_coefficient                  , 'k' );
hold off;

clear title xlabel ylabel
title('Matlab - Drag Coefficient vs. Mach Number');
xlabel('Mach Number');
legend ('Base','Fin Pressure','Parasitic','Skin Friction','Total Drag Coefficient');
ylimit = [0,1]; 
n=11; % how many tickmarks
ax1 = gca;
ytic = linspace(ylimit(1),ylimit(2),n); 
set(ax1,'ylim', ylimit, 'ytick', ytic);

if exist('saveplots')
    if saveplots % conditionally save the plot
        saveas(gcf, '../documentation/images/plots/drag_mach_coefficients.png');
        export_fig drag_mach_coefficients.png -m2
    end
end
