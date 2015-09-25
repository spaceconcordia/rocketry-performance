function C_D_pressure = PRESS(fin_pressure_drag, N ,t ,s, A_ref)
%#codegen

C_D_pressure = fin_pressure_drag*N*t*s/A_ref;
end