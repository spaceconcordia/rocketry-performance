function fin_section_ratio = FinSectionRatio(inputs)

total_fin_span = inputs(1); % Total fin span, tip-to-tip including OD_f
OD_f           = inputs(2); % Rocket body diameter at fin mount

fin_section_ratio = total_fin_span / OD_f;
