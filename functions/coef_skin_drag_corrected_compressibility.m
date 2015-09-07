function C_f_c = SKNDRAGCOEFCORR(C_f, M)
%#codegen
double CC;
CC=C_f*(1-0.1*M^2);

if CC>C_f
  C_f_c=CC
else
  C_f_c=C_f
end

end