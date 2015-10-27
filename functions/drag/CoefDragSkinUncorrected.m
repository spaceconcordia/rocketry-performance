function C_f = CoefSkinDragUncorrected(inputs)

R,     = inputs(1);
R_crit = inputs(2);
R_s    = inputs(3);
L      = inputs(4);

% TODO verify source, suspect OpenRocket tech doc
if R<1E4
  C_f=0.0148
elseif R<R_crit
  C_f=1/(1.5*log(R)-5.6)^2 
else
  C_f=0.032*(R_s/L)^(0.2)
end 

end
