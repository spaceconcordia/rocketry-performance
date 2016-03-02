figure;
plot( openrocket_Machnumber , openrocket_Basedragcoefficient , 'm' );
hold on;
plot( openrocket_Machnumber , openrocket_Frictiondragcoefficient , 'b' );
plot( openrocket_Machnumber , openrocket_Pressuredragcoefficient , 'g' );
plot( openrocket_Machnumber , openrocket_Axialdragcoefficient , 'c' );
plot( openrocket_Machnumber , openrocket_Dragcoefficient  , 'k' );
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
