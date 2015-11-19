%% Plot Rocket Drag Coefficients
figure;
plot( tout , coef_drag_base_normalized         , 'y' );
hold on;
plot( tout , coef_drag_fin_pressure_normalized , 'b' );
plot( tout , coef_drag_parasitic               , 'g' );
plot( tout , coef_drag_skin_friction           , 'r' );
hold off;
legend ('Base','Fin Pressure','Parasitic','Skin Friction')
