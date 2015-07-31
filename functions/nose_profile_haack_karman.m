function [theta, y] = nose_profile_haack_karman(x, L, R, C)

%--------------------------------------------------------------------------
%
% nose_profile_haack_karman.m
%
% Von Karman Nose Profile Haack Series
%
% This model computes the nose profile height and angle for a Von Karman
% Nose profile
%
% Haack nose cones are 
%   -   slightly rounded, they do not end in a sharp point
%   -   not perfectly tangent to the body at their base 
%   -   derived for the purpose of minimizing drag 
%
% LV - minimum drag for a given length and volume
% LD - minimum drag for a given length and diameter
%
%--------------------------------------------------------------------------
% References
% https://en.wikipedia.org/wiki/Nose_cone_design#Haack_series
% http://www.rimworld.com/nassarocketry/fabrication/nosecones/spreadsheet.html
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
% Input Parameters:
%   x       -   point along the length of the nose cone at which to provide 
%               radius 
%   L       -   Overall length of the nose cone
%   R       -   Radius of the base of the nose cone
%   C       - 1/3 for LV-Haack, 0 for LD-Haack
% Output Parameters:
%   theta   -   ?
%   y       -   radius and any point x
%   msg     -   message containing execution details
%--------------------------------------------------------------------------
    
%----------------------------------------------------------------------
% Valid Constants
%----------------------------------------------------------------------
%C_valid = [1/3, 0] % 1/3 for LV, 0 for LD

%--------------------------------------------------------------------------
% Exceptions
%-------------------------------------------------------------------------

%--------------------------------------------------------------------------
% Execution
%--------------------------------------------------------------------------
if is_member(C,C_valid)
    theta = arccos(1- 2*x / L)
    y = R / ( sqrt( pi()) ) * sqrt( theta - ( sin(2*theta) )/2 + C * sin(theta)^3 )
else
    error('Bad C value: %d',C)
end

% END OF FUNCTION
