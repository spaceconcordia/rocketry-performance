function outputs = ISAModel(inputs)
%outputs=zeros(5);

%--------------------------------------------------------------------------
% Demux inputs
% inputs used:
%   T_in    = temperature at the launch site AGL (Kelvin)
%   P_in    = pressure at the launch site AGL (Pascals)
%   alt_in  = altitude of the launch site (meters)
%   alt_act = altitude of the rocket AGL (meters)
%--------------------------------------------------------------------------

T_in    = inputs(1);
P_in    = inputs(2);
alt_in  = inputs(3);
alt_act = inputs(4);

%--------------------------------------------------------------------------
% This model computes the gas characteristics of the atmosphere around the
% rocket based on temperature and pressure at launch and current altitude.
% It uses the International Standard Atmosphere (ISA) model. This model is 
% only effective BELOW the tropopause.
%
% Model is based on the following document:
%   http://home.anadolu.edu.tr/~mcavcar/common/ISAweb.pdf
%
% Define required constants for the model as per ISA mean sea-level
% conditions:
%   P_o     = standard pressure (Pascals)
%   T_o     = standard temperature (degrees K)
%   R       = gas Constants (m^2/K*s^2)
%--------------------------------------------------------------------------

P_o     = 101325;
T_o     = 288.15;
R       = 287.04;
    
%--------------------------------------------------------------------------
% The following calculates ISA deviation of the launch conditions assuming 
% a virtual launch site a sea level
% Variables used:
%   T_dev   = ISA deviation temperature (degrees C)
%   T_in    = ground temperature (degrees C)
%   alt_in  = Launch altitude (meters)
%--------------------------------------------------------------------------

T_dev   = T_in - T_o + 6.5*(alt_in/1000);
    
%--------------------------------------------------------------------------
% The following calculates the temperature at the current altitude.
% Variables used:
%   T_act   = Actual temperature at current altitude (degrees K)
%   alt_in  = Launch altitude (m)
%   alt_act = Altitude above ground level (m)
%--------------------------------------------------------------------------

T_act   = (T_o + T_dev) - (6.5/1000)*(alt_in + alt_act);
    
%--------------------------------------------------------------------------
% The following recalculates the pressure in terms of ISA deviation.
% Variables used:
%   P_dev   = ISA deviation pressure (Pascals)
%   P_in    = ground pressure (Pascals)
%   A       = placeholder for calculation
%--------------------------------------------------------------------------

A       = (1 - 0.0065*(alt_in/(T_o + T_dev)))^5.2561;

P_dev   = (P_in/A) - P_o;
    
%--------------------------------------------------------------------------
% The following calculates the ambient pressure at the current altitude.
% Variables used:
%   P_act   = actual pressure at current altitude (Pascals)
%--------------------------------------------------------------------------

P_act   = (P_o + P_dev)*((1-0.0065*((alt_in+alt_act)/(T_o+T_dev)))^5.2561);
    
%--------------------------------------------------------------------------
% The following calculates the air density at the current altitude.
% Variables used:
%   rho = air density at current altitude (Kg/m^3)
%--------------------------------------------------------------------------

rho = P_act/(R*T_act);

%--------------------------------------------------------------------------
% Define constants for Sutherland's law equation
% Variables used:
%   T_so    = reference temperature in kelvin
%   mu_so   = reference viscosity in kg/m-s
%   S       = Sutherland's constant in kelvin
%--------------------------------------------------------------------------

T_so  = 273.11;
mu_so = 1.716e-5;
S     = 110.56;

%--------------------------------------------------------------------------
% Calculate absolute viscosity (A_visc) using Sutherland's law
% Variables used:
%   A_visc  = Absolute viscosity in kg/m-s
%--------------------------------------------------------------------------

A_visc = mu_so*((T_act/T_so)^(3/2))*((T_so-S)/(T_act-S));

%--------------------------------------------------------------------------
% Calculate kinematic viscosity (K_visc)
% Variables used:
%   K_visc  = kinematic viscosity in m^2/s
%--------------------------------------------------------------------------

K_visc = A_visc/rho;

%--------------------------------------------------------------------------
% Mux output
%--------------------------------------------------------------------------

outputs = [T_act, P_act, rho, A_visc, K_visc];

%--------------------------------------------------------------------------
% END OF FUNCTION
%--------------------------------------------------------------------------
end
