actual = COPFinSet([1,1,1,1]);
expected = 1.75;
assert( ...
    actual == expected, ...
    'COPFinSet() \n actual = %d \n expected = %d ', actual, expected ...
)

actual = COPNoseConeHaack([1]);
expected = 0.437;
assert( ...
     actual == expected, ...
    'COPNoseConeHaack() \n actual = %d \n expected = %d ', actual, expected ...
)

actual = COPNoseConeVonKarman([1]);
expected = 0.5;
assert( ...
    actual == expected, ...
    'COPNoseConVonKarman() \n actual = %d \n expected = %d ', actual, expected ...
)

actual = CoefFinBodyInterference([1,1]);
expected = 4/3;
assert( ...
    actual == expected, ...
    'CoefFinBodyInterference() \n actual = %d \n expected = %d ', actual, expected ...
)

actual = CoefMomentCorrective([1,1,1,1,1,0]);
expected = 0.5;
assert( ...
    actual == expected, ...
    'CoefMomentCorrective() \n actual = %d \n expected = %d ', actual, expected ...
)

actual = CoefMomentDampingAero([1,1,1,1,1,1]);
expected = 0;
assert( ...
    actual == expected, ...
    'CoefMomentDampingAero() \n actual = %d \n expected = %d ', actual, expected ...
)

actual = CoefMomentDampingJet([1,1,0,1,0]);
expected = 1;
assert( ...
    actual == expected, ...
    'CoefMomentDampingJet() Test 1 \n actual = %d \n expected = %d ', actual, expected ...
)

actual = CoefMomentDampingJet([1,1,0,1,1]);
expected = 0;
assert( ...
    actual == expected, ...
    'CoefMomentDampingJet() Test 2 \n actual = %d \n expected = %d ', actual, expected ...
)

actual = DynamicCenterGravity([1,1,1,1]);
expected = 1;
assert( ...
    actual == expected, ...
    'DampingCenterGravity() \n actual = %d \n expected = %d ', actual, expected ...
)

actual = DynamicMomentInertia([1,1,1,1,1,1,1]);
expected = 13/12;
assert( ...
    actual == expected, ...
    'DynamicMomentInertia() \n actual = %d \n expected = %d ', actual, expected ...
)

actual = StabilityDerivativeFinSet([1,1,1,1,1,1,1]);
expected = 1.656854;
assert( ...
    actual ~= expected, ...
    'StabilityDerivativeFinSet() \n actual = %d \n expected = %d ', actual, expected ...
)

actual = StaticStabilityMarginLong([1,1,1,1]);
expected = 0;
assert( ...
    actual == expected, ...
    'StaticStabilityMarginLong() \n actual = %d \n expected = %d ', actual, expected ...
)

actual = CoefNormalForceBodyLift([1,1,1]);
expected = 1;
assert( ...
    actual == expected, ...
    'CoefNormalForceBodyLift() \n actual = %d \n expected = %d ', actual, expected ...
)

actual = ForceNormal([1,1,1,1]);
expected = 0.5;
assert( ...
    actual == expected, ...
    'ForceNormal() \n actual = %d \n expected = %d ', actual, expected ...
)

actual = COPRocket([1,[1,1,1],[1,1,1],1]);
expected = 1;
assert( ...
    actual == expected, ...
    'COPRocket() \n actual = %d \n expected = %d ', actual, expected ...
)

% make sure that coef_normal_force == 0 is captured and handled
actual = COPRocket([1,[1,1,1],[1,1,1],0]);
expected = 1;
assert( ...
    actual == expected, ...
    'COPRocket() \n actual = %d \n expected = %d ', actual, expected ...
)

disp('ALL ANGULAR_FLIGHT_UNIT_TESTING.m TESTS PASSED!');
