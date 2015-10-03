[pnum,ptxt,praw] = xlsread('Parametric_Data.xlsm','Matlab_Data');

% Note: Map Containers sort the key/value pair alphabetically by
%       key name, so to iterate through the Map Container we need
%       to grab the value by its associated key name from the 
%       raw spreadsheet data rather than through the Map Container

% this test uses the same method to grab the spreadsheet data (xlsread), 
% and simply tests whether the assignment to the Map Container behaved
% as expected

pmo = data_parametric_model();

% pnum and ptxt have different indicies because ptxt includes the
% column label and pnum does not
labels = praw(2:length(pmo),1);
values = cell2mat(praw(2:length(pmo),2));

for i = 2:(length(pmo)-1) % we start at two to skip the column label
    % check mapped values
    assert ( pmo(char(labels(i))) == values(i) )
end

