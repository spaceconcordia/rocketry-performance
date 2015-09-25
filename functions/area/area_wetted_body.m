function A_wet_body = WAB(OD, L, h, t, N, l, A_surface_nose)
%#codegen
A_wet_body=3.14159*OD*(L-h)+A_surface_nose-t*l*N
end
