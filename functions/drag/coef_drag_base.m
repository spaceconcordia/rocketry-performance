function C_base = BASEDRAG(M)
%#codegen
if M<1
    C_base=0.12+0.13*M^2
else
    C_base=0.25/M
end

end