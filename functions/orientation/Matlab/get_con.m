function q_con = get_con(q)
   
    q_con(1) = q(1);

for i = 2:4
    q_con(i) = -q(i);
end
    
get_con = q_con;

end