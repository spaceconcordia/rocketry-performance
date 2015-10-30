function mach_number = MachNumber(inputs)

velocity   = inputs(1);
pressure   = inputs(2);
density    = inputs(3);
gamma      = inputs(4);

mach_number = velocity / sqrt( gamma * pressure/density );

end
