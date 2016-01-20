%% provide degrees on right vertical axis
rad2deg = 180/pi; 
n=5; % how many tickmarks

subplot(3,1,1);
plot (tout, angular_position);
title ('Angular Position');
ylimit = [-0.05,0.05]; % ylimits in meters
ytic = linspace(ylimit(1),ylimit(2),n); 
ax1 = gca;
set(ax1,'ylim', ylimit, 'ytick', ytic);
ylabel('in radians')
ax2 = axes('Position',get(ax1,'Position'),...
    'YAxisLocation','right','color','none');
set(ax2,'ylim',...
    ylimit*rad2deg, 'ytick',ytic*rad2deg,...
    'xtick',get(ax1,'xtick'), 'xticklabel',''...
    )
ylabel('in degrees');

subplot(3,1,2);
plot (tout, angular_velocity);
title ('Angular Velocity');
ylimit = [-0.1,0.1]; % ylimits in meters
ytic = linspace(ylimit(1),ylimit(2),n); 
ax1 = gca;
set(ax1,'ylim', ylimit, 'ytick', ytic);
ylabel('rad/s')
ax2 = axes('Position',get(ax1,'Position'),...
    'YAxisLocation','right','color','none');
set(ax2,'ylim',...
    ylimit*rad2deg, 'ytick',ytic*rad2deg,...
    'xtick',get(ax1,'xtick'), 'xticklabel',''...
    )
ylabel('deg/s');

subplot(3,1,3);
plot (tout, angular_acceleration);
title ('Angular Acceleration');
xlabel ('Time (s)');
ylimit = [-0.5,0.5]; % ylimits in meters
ytic = linspace(ylimit(1),ylimit(2),n); 
ax1 = gca;
set(ax1,'ylim', ylimit, 'ytick', ytic);
ylabel('rad/s^2')
ax2 = axes('Position',get(ax1,'Position'),...
    'YAxisLocation','right','color','none');
set(ax2,'ylim',...
    ylimit*rad2deg, 'ytick',ytic*rad2deg,...
    'xtick',get(ax1,'xtick'), 'xticklabel',''...
    )
ylabel('deg/s^2');

%% conditionally save the plot
if exist('saveplots')
    if saveplots
        saveas(gcf, '../documentation/images/plots/rocket_angular_kinematics.png');
        export_fig rocket_angular_kinematics.png -m2
    end
end

plot_angular_nf_lf
%% conditionally save the plot
if exist('saveplots')
    if saveplots
        saveas(gcf, '../documentation/images/plots/rocket_nf_lf.png');
        export_fig rocket_nf_lf.png -m2
    end
end

plot_rocket_damping_ratio
%% conditionally save the plot
if exist('saveplots')
    if saveplots
        saveas(gcf, '../documentation/images/plots/rocket_damping_ratio.png');
        export_fig rocket_damping_ratio.png -m2
    end
end

figure; plot(angular_position, cop_rocket,'b');
hold on; plot(angular_position, cog_rocket,'r');
hold off;
legend ('Rocket COP','Rocket COG');
%% conditionally save the plot
if exist('saveplots')
    if saveplots
        saveas(gcf, '../documentation/images/plots/rocket_cop_cog.png');
        export_fig rocket_cog_cop.png -m2
    end
end
