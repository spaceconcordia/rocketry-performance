% Import the data from Excel for a lookup table
data = xlsread('Parametric_Model','Sheet1');
% Row indices for lookup table
breakpoints1 = data(2:end,1)';
% Column indices for lookup table
breakpoints2 = data(1,2:end);
% Output values for lookup table
table_data = data(2:end,2:end);
