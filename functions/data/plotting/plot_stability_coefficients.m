%% RockSim
rightbound=32;
figure;

subplot(4,1,1);
plot(Rocksim_Time, Rocksim_Correctivemomentcoefficient);
title('Rocksim Corrective Moment Coefficient');
ylim([0,3000]);
xlim([0,rightbound]); 

subplot(4,1,2);
plot(Rocksim_Time, Rocksim_Dampingmomentcoefficient);
title('Rocksim Damping Moment Coefficient');
xlim([0,rightbound]); 

subplot(4,1,3);
plot(Rocksim_Time, Rocksim_CNanormalforcecoefficient);
title('Rocksim Normal Force Coefficient');
xlim([0,rightbound]); 

subplot(4,1,4);
plot( ...
    Rocksim_Time, Rocksim_DampingRatio);
title('Rocksim Dampingratio');
xlim([0,rightbound]); 
ylim([0,0.15]);

%% OpenRocket
figure;

subplot(4,1,1);
plot(openrocket_VarName1, openrocket_CorrectiveMomentCoefficient);
title('OpenRocket Corrective Moment Coefficient');
xlim([0,rightbound]); ylim([0,3000]);

subplot(4,1,2);
plot(openrocket_VarName1, openrocket_Dampingmomentcoefficient);
title('OpenRocket Damping Moment Coefficient');
xlim([0,rightbound]); 

subplot(4,1,3);
plot(openrocket_VarName1, openrocket_Normalforcecoefficient);
title('OpenRocket Normal Force Coefficient');
xlim([0,rightbound]); 

subplot(4,1,4);
plot(openrocket_VarName1, openrocket_DampingRatio);
title('OpenRocket Stability');
ylim([0,0.15]);
xlim([0,rightbound]); 

%% Matlab Stability Coefficients
figure;

subplot(4,1,1);
plot(tout, coef_moment_corrective);
title('Matlab Corrective Moment Coefficient');
ylim([0,3000]);

subplot(4,1,2);
plot(tout, coef_damping_moment);
title('Matlab Damping Moment Coefficient');

subplot(4,1,3);
plot(tout, coef_normal_force);
title('Matlab Normal Force Coefficient');

subplot(4,1,4);
plot( ...
    tout, rocket_damping_ratio);
title('Matlab Damping Ratio');
ylim([0,0.15]);

figure;
plot(tout, rocket_damping_ratio, 'm-*');
hold on;
plot(Rocksim_Time, Rocksim_DampingRatio,'k- .');
plot(openrocket_VarName1, openrocket_DampingRatio,'b-*');
legend('Matlab','Rocksim','OpenRocket');
title('Damping Ratio');
xlim([0,rightbound]);

%% Angular Frequency Vs. Natural Frequency
figure;
openrocket_Angularfrequency = ...
    sqrt(...
        openrocket_CorrectiveMomentCoefficient./openrocket_Longitudinalmomentofinertiakgm ...
        - openrocket_Dampingmomentcoefficient.^2./(4.*openrocket_Longitudinalmomentofinertiakgm) ...
    );
openrocket_Naturalfrequency = ...
    sqrt(...
        openrocket_CorrectiveMomentCoefficient./openrocket_Longitudinalmomentofinertiakgm ...
    );
Rocksim_frequency= ...
    sqrt(...
        Rocksim_Correctivemomentcoefficient./Rocksim_LongitudinalmomentofinertiaOuncesInches2 ...
        - Rocksim_Dampingmomentcoefficient.^2./(4.*Rocksim_LongitudinalmomentofinertiaOuncesInches2) ...
    );
Rocksim_Naturalfrequency = ...
    sqrt(...
        Rocksim_Correctivemomentcoefficient./Rocksim_LongitudinalmomentofinertiaOuncesInches2 ...
    );
hold on
plot(tout, angular_frequency, 'm-.');
plot(tout, frequency_natural,'m-*');
plot(openrocket_VarName1, openrocket_Angularfrequency,'b-.');
plot(openrocket_VarName1, openrocket_Naturalfrequency,'b-*');
plot(Rocksim_Time, Rocksim_frequency, 'k- .');
plot(Rocksim_Time, Rocksim_Naturalfrequency', 'k- o')
title('Natural Frequency');
legend(...
    'Matlab Natural Frequency','Matlab Angular Frequency', ...
    'OpenRocket Angular Frequency', 'OpenRocket Natural Frequency', ...
    'Rocksim Angular Frequency', 'Rocksim Natural Frequency' ...
    );
xlim([0,rightbound]);
