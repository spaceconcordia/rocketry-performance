%----------------------------------------------------------------------
% locate and plot maximum
%----------------------------------------------------------------------
indexmax = find(max(openrocket_Altitudem) == openrocket_Altitudem);
time_to_apogee_openrocket = simtime(indexmax);
openrocket_altitude_max = openrocket_Altitudem(indexmax);

fprintf( 'Apogee: %d m, %d ft \r\n', openrocket_altitude_max, openrocket_altitude_max*3.28);
fprintf( 'Time to apogee: %d s \r', time_to_apogee_openrocket );
