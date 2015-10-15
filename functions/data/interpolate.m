% Author: Anatoly
% Interpolates an array, and increases its size by given factor.
% out = interpolate(in, mult)

function out = interpolate(in, mult)
    out = zeros(mult*size(in,1)-mult,size(in,2));
    for i = 1 : (size(in,1)-1)
        for j = (mult-1) : -1 : 0
            out(mult*i-j,:) = in(i,:) + (mult-j)*(in(i+1,:)-in(i,:))/mult;
        end
    end
end

%---------------------------------------------------------------------
% Author: Shawn
% Given an array with varying time-step, find the smallest time-step,
% expand 
%---------------------------------------------------------------------
function data = scrd_interpolate(in)
    % check if at least two columns

    % scan the first column for the smallest timestep

    % calculate the number of entries needed

    % expand the array to the number of entries

    % move data points to corresponding place in expanded array

    % interpolate, filling in all missing data points


end
