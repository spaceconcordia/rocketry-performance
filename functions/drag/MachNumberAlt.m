function mach_number = MachNumber(inputs)

velocity    = inputs(1);
temperature = inputs(2);
R           = inputs(3);
gamma       = inputs(4);

mach_number = velocity / sqrt( gamma * R * temperature );

end
