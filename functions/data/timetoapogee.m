%----------------------------------------------------------------------
% locate and plot maximum
%----------------------------------------------------------------------
indexmax = find(max(altitude) == altitude);
time_to_apogee = tout(indexmax);
altitude_max = altitude(indexmax);

strmax = ['Maximum = ',num2str(altitude_max)];
text(time_to_apogee,altitude_max,strmax,'HorizontalAlignment','right');

fprintf( 'Apogee: %d m, %d ft \r\n', altitude_max, altitude_max*3.28);
fprintf( 'Time to apogee: %d s \r', time_to_apogee );
