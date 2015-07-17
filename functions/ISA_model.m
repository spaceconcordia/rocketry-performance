function rho = ISA_model(T_in, P_in, alt_in)

% This model computes the gas characteristics of the atmosphere around the
% rocket based on temperature and pressure at launch and current altitude.
% It uses the International Standard Atmosphere (ISA) model. This model is 
% only effective BELOW the tropopause.

% Model is based on the following document:
%   http://home.anadolu.edu.tr/~mcavcar/common/ISAweb.pdf

% Define required constants for the model as per ISA mean sea-level
% conditions:
%   P_o     = standard pressure (Pascals)
%   T_o     = standard temperature (degrees K)
%   R       = gas Constants (m^2/K*s^2)

    P_o     = 101325;
    T_o     = 288.15;
    R       = 287.04;
    
% The following recalculates the temperature in terms of ISA deviation.
% Variables used:
%   T_dev   = ISA deviation temperature (degrees C)
%   T_in    = ground temperature (degrees C)

    T_dev   = T_in - T_o + 273.15;
    
% The following calculates the temperature at the current altitude.
% Variables used:
%   T_act   = Actual temperature at current altitude (degrees K)
%   alt_in  = Actual altitude (m)

    T_act   = (T_o + T_dev) - (6.5/1000)*alt_in;
    
% The following recalculates the pressure in terms of ISA deviation.
% Variables used:
%   P_dev   = ISA deviation pressure (Pascals)
%   P_in    = ground pressure (Pascals)

    P_dev   = P_in - P_o;
    
% The following calculates the ambient pressure at the current altitude.
% Variables used:
%   P_act   = actual pressure at current altitude (Pascals)

    P_act   = (P_o + P_dev)*((1 - 0.0065*(alt_in/(T_o + T_dev)))^5.2561);
    
% The following calculates the air density at the current altitude.
% Variables used:
%   rho = air density at current altitude (Kg/m^3)

    rho = P_act/(R*T_act);
    
% END OF FUNCTION
