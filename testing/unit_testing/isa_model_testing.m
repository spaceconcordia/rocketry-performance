%% Set initial conditions

ground_temp     = 288; % K ( 15 deg. C + 273 )
ground_pressure = 101325; % Pa
ground_altitude = 0; % m

local_pressure = zeros(3000,1);
local_temperature = zeros(3000,1);
local_kinematic_viscosity = zeros(3000,1);
local_absolute_viscosity = zeros(3000,1);

for i               = 1:3000
    inputs                       = [ ground_temp, ground_pressure, ground_altitude, i ];
    outputs                      = ISAModel(inputs);
    local_temperature(i)         = outputs(1);
    local_pressure(i)            = outputs(2);
    local_density(i)             = outputs(3);
    local_absolute_viscosity(i)  = outputs(4);
    local_kinematic_viscosity(i) = outputs(5);
end

plot(local_altitude, local_temperature);
plot(local_altitude, local_pressure);
    
