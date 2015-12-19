function static_stability_margin = StaticStabilityMarginLong(inputs)

aoa = inputs(1)*pi/180; % angle of attack
cop = inputs(2); % center of pressure
cog = inputs(3); % center of gravity
phi = inputs(4); % outer diameter

static_stability_margin = ...
    ( cop - cog) ...
    / phi ...
    * cos(aoa);
