function y = nantozero(u)
if isnan(u)
    y = 0;
else
    y = u;
end;
