% bmp - ArcturusFlightData(1)
% rocket - RocketFlightDataStrattoLogger
% strat - ArcturusFlightData(1)
% sim - arcturus_open_rocket

clear
load('apog.mat');

% interpolate each data set to make their timesteps equal
% smallest timestep corresponds to the simulated data set
bmp2 = interpolate(bmp,15);
rocket2 = interpolate(rocket,5);
strat2 = interpolate(strat,5);

% obtain index, time and max altitude from each data set
[bmp2_idx, bmp2_time, bmp2_max_alt] = find_max(bmp2(:,1),bmp2(:,2));
[rocket2_idx, rocket2_time, rocket2_max_alt] = find_max(rocket2(:,1),rocket2(:,2));
[strat2_idx, strat2_time, strat2_max_alt] = find_max(strat2(:,1),strat2(:,2));
[sim_idx, sim_time, sim_max_alt] = find_max(sim(:,1),sim(:,2));

fprintf('\nBMP : idx = %d; time = %d; max_alt = %d\n', bmp2_idx, bmp2_time, bmp2_max_alt)
fprintf('ROCKET : idx = %d; time = %d; max_alt = %d\n', rocket2_idx, rocket2_time, rocket2_max_alt)
fprintf('STRAT : idx = %d; time = %d; max_alt = %d\n', strat2_idx, strat2_time, strat2_max_alt)
fprintf('SIM : idx = %d; time = %d; max_alt = %d\n\n', sim_idx, sim_time, sim_max_alt)

% allocate matrix to accomodate each data set
% first dimension corresponds to largest data set - bmp2
apog = zeros(size(bmp2,1),5);
apog(:,1:2) = bmp2;

% combine all data sets and align their apogees
for i = 1 : size(rocket2,1)
    apog(i + 80,3) = rocket2(i,2);
end

for i = 1 : size(strat2,1)
    apog(i + 190,4) = strat2(i,2);
end

for i = 1 : size(sim,1)
    apog(i + 2612,5) = sim(i,2);
end

% convert data sets from meters to feet
apog(:,2:5) = apog(:,2:5) * 3.28084;
bmp2(:,2) = bmp2(:,2) * 3.28084;
rocket2(:,2) = rocket2(:,2) * 3.28084;
strat2(:,2) = strat2(:,2) * 3.28084;
sim(:,2) = sim(:,2) * 3.28084;

% figure 1: single plot for each data set
% figure 2: separate plots
figure(1)
plot(apog(:,1),apog(:,2:5)), legend('BMP','Rocket StrattoLogger','Strat','Sim')
title('Aligned Apogees'), xlabel('Time [s]'), ylabel('Altitude [ft]')


figure(2)
subplot(221), plot(bmp2(:,1),bmp2(:,2)), title('BMP'), xlabel('Time [s]'), ylabel('Alt [ft]')
subplot(222), plot(rocket2(:,1),rocket2(:,2)), title('Rocket StrattoLogger'), xlabel('Time [s]'), ylabel('Alt [ft]')
subplot(223), plot(strat2(:,1),strat2(:,2)), title('Strat'), xlabel('Time [s]'), ylabel('Alt [ft]')
subplot(224), plot(sim(:,1),sim(:,2)), title('Simulation'), xlabel('Time [s]'), ylabel('Alt [ft]')

% figure(3)
% subplot(221), plot(bmp(:,1),bmp(:,2))
% subplot(222), plot(rocket(:,1),rocket(:,2))
% subplot(223), plot(strat(:,1),strat(:,2))
% subplot(224), plot(sim(:,1),sim(:,2))
