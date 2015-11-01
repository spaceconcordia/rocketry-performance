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