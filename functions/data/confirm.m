function bool = confirm(question)

prompt = strcat(question, ' [y/N] ');
response = input(prompt,'s');

bool=1; %TRUE

switch response
    case 'Y'
    case 'y'
    case 'yes'
    case 'Yes'
    case 'YEAH'
    otherwise
        bool=0; %FALSE
end
