function C_f_c = CoefDragSkinCorrected(inputs)

C_f = inputs(1);
M = inputs(2);

double CC;

CC=C_f*(1-0.1*M^2);

if CC>C_f
  C_f_c=CC;
else
  C_f_c=C_f;
end
