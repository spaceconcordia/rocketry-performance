%xdata = {1:20, linspace(-10,25,100), linspace(0,30,25)};
xdata = {1:20, linspace(-10,25,100), linspace(0,30,25)};
ydata = {2000 * rand(1,20) , rand(1,100) , 500 * rand(1,25)};
ylabel = {'1st Data','2nd Data','3rd Data'};
linespec = {'b-*','r:+','g'};
multiplot(xdata, ydata, 'YLabel', ylabel, ...
 'LineSpec', linespec, 'Title', 'Graph Title', 'XLabel', 'time');


xdata = {tout, tout, tout};
ydata = {mass, weight, thrust};
ylabel = {'Mass','Weight','Thrust'};
linespec = {'b-*','r:+','g'};
multiplot(xdata, ydata, 'YLabel', ylabel, ...
 'LineSpec', linespec, 'Title', 'Graph Title', 'XLabel', 'time');
