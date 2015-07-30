function R = ACTREN(v, L, T)
%#codegen

R=v*L/(-1E-14*T^3+1E-10*T^2+3E-8*T-3E-6);
end
