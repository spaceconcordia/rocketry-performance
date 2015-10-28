function q_q_stag = FinProfile(mach_number)

if mach_number < 1
    q_q_stag = 1 + M^2/4 + M^4/20;
else if mach_number >= 1
    q_q_stag = 1.84 - 0.76/M^2 + 0.166/M^4 + 0.035/M^6;
end
