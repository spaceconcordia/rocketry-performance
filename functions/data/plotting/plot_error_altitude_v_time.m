%% Plot altitude error
plot(tout, altitude)
hold on
plot(tout, openrocket_altitude(1:arraysize))
hold off

%% fill region in between
%{
hold on
X=[tout,fliplr(tout)]; %#create continuous x value array for plotting
Y=[openrocket_altitude(1:arraysize),fliplr(altitude)]; %#create y values for out and then back
fill(X,Y,'g'); %#plot filled area
hold off
%}

%% Graph details
clear title xlabel ylabel
title('Altitude vs Time');
grid on;
xlabel('Time (s)');
ylabel('Altitude (m)');
legend('Matlab','OpenRocket')

%% provide imperial units on right vertical axis
meter2feet = 3.28; 
ylimit = [0,4000]; % ylimits in meters
n=9; % how many tickmarks
ytic = linspace(ylimit(1),ylimit(2),n); 
ax1 = gca;
set(ax1,'ylim', ylimit, 'ytick', ytic);
ylabel('in meters')
ax2 = axes('Position',get(ax1,'Position'),...
    'YAxisLocation','right','color','none');
set(ax2,'ylim',...
    ylimit*meter2feet, 'ytick',ytic*meter2feet,...
    'xtick',get(ax1,'xtick'), 'xticklabel',''...
    )
ylabel('in feet');

%% conditionally save the plot
if exist('saveplots')
    if saveplots
        saveas(gcf, '../documentation/images/plots/error_altitude_plot.png');
        export_fig error_altitude_plot.png -m2
    end
end
