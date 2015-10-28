function area_fin_wetted = AreaFinWetted(inputs)
    area_fin_face        = inputs(1)
    area_fin_front       = inputs(2)
    area_fin_wetted      = 2*area_fin_face+area_fin_front
end
