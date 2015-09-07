%--------------------------------------------------------------------------------
%
% TITLE
% DESCRIPTION
% THEORY
%
%--------------------------------------------------------------------------------
% References
% 
%--------------------------------------------------------------------------------

%--------------------------------------------------------------------------------
% Valid Constants
%--------------------------------------------------------------------------------


%--------------------------------------------------------------------------------
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
%--------------------------------------------------------------------------------
function [outputs] = function_name(inputs)

%--------------------------------------------------------------------------------
% Exceptions
%--------------------------------------------------------------------------------
exceptionInstance = MException('Identifier','String %d',inputs)

%--------------------------------------------------------------------------------
% Execution
%--------------------------------------------------------------------------------
    if something
        %do_stuff
    else
        msg = bad_C.identifier
    end
end
% END OF FUNCTION
