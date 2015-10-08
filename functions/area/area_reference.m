function A_ref = area_reference(OD, N, t, s)
    %#codegen
    A_ref=3.14159*OD^2/4+t*s*N
    %A_ref=0.0084949
end
