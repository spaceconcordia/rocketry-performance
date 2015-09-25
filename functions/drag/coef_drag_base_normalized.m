function C_base_n = NORMBASEDRAG(C_base, A_ref, OD)
%#codegen

C_base_n=C_base*3.14159*(OD^2/4)/A_ref
end
