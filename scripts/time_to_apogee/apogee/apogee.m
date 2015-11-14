% bmp - ArcturusFlightData(1)
% strattologger - RocketFlightDataStrattoLogger
% custom_avionics - ArcturusFlightData(1)
% openrocket - arcturus_open_strattologger

openrocket_label      = 'OpenRocket Simulation Data';
custom_avionics_label = 'Custom Avionics Data';
strattologger_label   = 'Strattologger Flight Data';

clear
load('apog.mat');

%% map variables in apog.mat to more readable names
strattologger   = rocket;
custom_avionics = strat;
openrocket      = sim;

%% interpolate each data set to make their timesteps equal
% smallest timestep corresponds to the simulated data set
bmp2             = interpolate(bmp,15);
strattologger2   = interpolate(strattologger,5);
custom_avionics2 = interpolate(custom_avionics,5);

%% obtain index, time and max altitude from each data set
[bmp2_idx, bmp2_time, bmp2_max_alt]                                     = find_max(bmp2(:,1),bmp2(:,2));
[strattologger2_idx, strattologger2_time, strattologger2_max_alt]       = find_max(strattologger2(:,1),strattologger2(:,2));
[custom_avionics2_idx, custom_avionics2_time, custom_avionics2_max_alt] = find_max(custom_avionics2(:,1),custom_avionics2(:,2));
[openrocket_idx, openrocket_time, openrocket_max_alt]                   = find_max(openrocket(:,1),openrocket(:,2));

%% printout
fprintf('\nBMP : idx = %d; time = %d; max_alt = %d\n', bmp2_idx, bmp2_time, bmp2_max_alt)
fprintf('ROCKET : idx = %d; time = %d; max_alt = %d\n', strattologger2_idx, strattologger2_time, strattologger2_max_alt)
fprintf('STRAT : idx = %d; time = %d; max_alt = %d\n', custom_avionics2_idx, custom_avionics2_time, custom_avionics2_max_alt)
fprintf('SIM : idx = %d; time = %d; max_alt = %d\n\n', openrocket_idx, openrocket_time, openrocket_max_alt)

%% allocate matrix to accomodate each data set
% first dimension corresponds to largest data set - bmp2
apog = zeros(size(bmp2,1),5);
apog(:,1:2) = bmp2;

%% combine all data sets and align their apogees
for i = 1 : size(strattologger2,1)
    apog(i + 80,3) = strattologger2(i,2);
end

for i = 1 : size(custom_avionics2,1)
    apog(i + 190,4) = custom_avionics2(i,2);
end

for i = 1 : size(openrocket,1)
    apog(i + 2612,5) = openrocket(i,2);
end

%% convert data sets from meters to feet
apog(:,2:5) = apog(:,2:5) * 3.28084;
bmp2(:,2) = bmp2(:,2) * 3.28084;
strattologger2(:,2) = strattologger2(:,2) * 3.28084;
custom_avionics2(:,2) = custom_avionics2(:,2) * 3.28084;
openrocket(:,2) = openrocket(:,2) * 3.28084;

%% figure 1: single plot for each data set
figure(1);
plot( apog(:,1), apog(:,2:5) );
legend('BMP','Strattologger Flight Data','Custom Avionics Data','OpenRocket Simulation Data');
title('Aligned Apogees'); 
xlabel('Time [s]');
ylabel('Altitude [ft]');

%% figure 2: separate plots
figure(2);
subplot(221), plot(bmp2(:,1),bmp2(:,2)), title('BMP'), xlabel('Time [s]'), ylabel('Alt [ft]')
subplot(222), plot(strattologger2(:,1),strattologger2(:,2)), title('StrattoLogger'), xlabel('Time [s]'), ylabel('Alt [ft]')
subplot(223), plot(custom_avionics2(:,1),custom_avionics2(:,2)), title('Custom Avionics'), xlabel('Time [s]'), ylabel('Alt [ft]')
subplot(224), plot(openrocket(:,1),openrocket(:,2)), title('OpenRocket Simulation'), xlabel('Time [s]'), ylabel('Alt [ft]')

%% calculate relative errors
sample_size                          = size(custom_avionics2,1);
time                                 = zeros(sample_size,1);
custom_avionics_strattologger_error  = zeros(sample_size,1);
custom_avionics_trimmed              = zeros(sample_size,1);

for i = 1:sample_size
    time(i)                                 = strattologger2(i,1);
    custom_avionics_strattologger_error(i) = custom_avionics2(i,2) + (custom_avionics2(i,2) - strattologger2(i,2));
    strattologger2_trimmed(i)               = strattologger2(i,2);
end

%% figure 4 : plot errors
figure(3);
plot(time,strattologger2_trimmed);
hold on;
plot(time,custom_avionics2);
plot(time,custom_avionics_strattologger_error);
hold off;
legend('Custom Avionics','Strattologger','Error');
