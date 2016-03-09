%% Trim the array sizes to match the smallest set
arraysize       = size(tout,1);
openrocket_time = openrocket_VarName1(1:arraysize);

%% Set the x-axis
openrocket_xdata = {openrocket_time, openrocket_time, openrocket_time, openrocket_time, openrocket_time};
matlab_xdata     = {tout, tout, tout, tout, tout};

