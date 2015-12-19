function coef_moment_damping_jet = CoefMomentDampingJet(inputs)

mass_flow_rate         = inputs(1);
distance_tip_to_nozzle = inputs(2);
cog                    = inputs(3);

coef_moment_damping_jet = ...
    mass_flow_rate ...
    * ( distance_tip_to_nozzle - cog )^2;
