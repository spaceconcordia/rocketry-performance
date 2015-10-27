function D = BasicDrag(inputs)
% The following calculates the basic drag coefficient based on C.P. Hoult's
% "Drag Coefficient (rev 3.2)". The drag is divided into skin friction
% drag, pressure drag, wave drag and parasitic drag. Note that this
% calculation assumes a nose with a Karman profile is being used

% BASIC CONSTANTS DEFINITION
%   gamma_air   = the ratio of specific heats for air (ul)
%   R           = gas constant for air

% SKIN FRICTION
% Skin friction drag is caused by the shear of the air near the surface due
% to the roughness of the surface it is attempting to travel against.
% The following treatment of skin friction drag is broken into a
% calculation of the skin friction drag on the body and on the fins.

% Body Skin Friction

% The following uses the equation if total wetted area vs. body station to
% obtain the integral of the previously stated equation.
% The equation of the nose profile is known to be:

Cd = inputs(1)
v = inputs(2) 
rho = inputs(3)
A_ref = inputs(4)

D=0.5*Cd*v^2*A_ref*rho

end
