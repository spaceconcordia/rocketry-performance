function q_q_stag = FinProfile(mach_number)

if mach_number < 1
    q_q_stag = 1 + mach_number^2/4 + mach_number^4/20;
else if mach_number >= 1
    q_q_stag = 1.84 - 0.76/mach_number^2 + 0.166/mach_number^4 + 0.035/mach_number^6;
end

end
