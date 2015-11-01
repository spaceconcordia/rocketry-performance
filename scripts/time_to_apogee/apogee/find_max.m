% Receives two arrays (x & y) of the same size
% and returns value of x for which y is maximum with its index.

function [idx,apog,max_alt] = find_max(time, alt)

idx = 0;
apog = 0;
max_alt = 0;

for i = 1 : size(alt)
    if (alt(i) > max_alt)
        idx = i;
        apog = time(i);
        max_alt = alt(i);
    end
end

end