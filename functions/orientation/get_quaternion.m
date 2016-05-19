function q = get_quaternion(normR, theta)

q(1) = cos(theta/2);

for i = 1:3
    q(i+1) = sin(theta/2)*normR(i);
end

get_quaternion = q;

end