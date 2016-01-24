function static_stability_margin = StaticStabilityMarginLong(inputs)

cop            = inputs(1); % center of pressure
cog            = inputs(2); % center of gravity
outer_diameter = inputs(3); % outer diameter

static_stability_margin = ...
    ( cop - cog) ...
    / outer_diameter ...
;
