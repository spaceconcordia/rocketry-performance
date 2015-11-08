function area_fin_wetted = AreaFinWetted(inputs)

%------------------------------------------------------------------------------
% This function calculates the wetted area of a single fin
%------------------------------------------------------------------------------

% area_fin_face  - the area of the face of the fins
% area fin front - the area of top of the fins

    area_fin_face        = inputs(1)
    area_fin_front       = inputs(2)

    area_fin_wetted      = (2 * area_fin_face) + area_fin_front
end
