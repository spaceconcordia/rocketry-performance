x1 = [1 2 3 4 5 6];
y1 = x1;
y2 = x1+1;
x3 = [1.5 2 2.5 3 3.5 4];
y3 = 2*x3;
y4 = 4*ones(size(x3));
ha = shadedplot(x1, y1, y2, [1 0.7 0.7], 'r'); %first area is red
hold on
hb = shadedplot(x3, y3, y4, [0.7 0.7 1]); %second area is blue
hold off
