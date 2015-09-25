function parametric_data_object = data_parametric_model()
%--------------------------------------------------------------------------------
%
% data_parametric_model.m
%
% Data Access of Parametric Model
%
% Design Parameters for the Rocket are stored in a spreadsheet. 
% These parameters will be accessed and passed along into the simulation to 
% determine other parameters and ultimately to evaluate the performance of 
% those design values
%
%--------------------------------------------------------------------------------
% References
% http://www.mathworks.com/help/simulink/ug/how-to-import-data-from-an-excel-spreadsheet.html
% http://www.mathworks.com/help/matlab/matlab_external/example-reading-excel-spreadsheet-data.html
%--------------------------------------------------------------------------------

% Import the data from Excel
% data = xlsread('input_parameters.csv','B2:B23');
spreadsheet_data = xlsread('Parametric_Data.xlsm','Matlab_Data','B2:B23');

% set keyset to store keys which will map values for parametric parameters

keyset = {'area_fin_frontal', 'area_face_fin', 'width_fins_at_tube', 'fins_count', 'thickness_fins_at_tube', 'area_surface_nose', 'height_fins', 'diameter_outer', 'surface_roughness', 'length_total_rocket', 'pressure_ambient_ground', 'temperature_ambient_ground', 'edge_rounding', 'distance_tip_to_COG', 'distance_tip_to_COP', 'angle_leading_edge', 'fin_leading_edge_profile', 'fin_trailing_edge_profile', 'diameter_outer_launch_guide', 'diameter_inner_launch_guide', 'moment_inertia_rocket'};

valueset = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

% initialize map object to store parametric data
parametric_data_object = containers.Map(keyset,valueset)

% Extract parameters from the imported data file
parametric_data_object('area_fin_frontal')            = spreadsheet_data(1,1)
parametric_data_object('area_face_fin')               = spreadsheet_data(2,1)
parametric_data_object('width_fins_at_tube')          = spreadsheet_data(3,1)
parametric_data_object('fins_count')                  = spreadsheet_data(4,1)
parametric_data_object('thickness_fins_at_tube')      = spreadsheet_data(5,1)
parametric_data_object('area_surface_nose')           = spreadsheet_data(6,1)
parametric_data_object('height_fins')                 = spreadsheet_data(7,1)
parametric_data_object('diameter_outer')              = spreadsheet_data(8,1)
parametric_data_object('surface_roughness')           = spreadsheet_data(9,1)
parametric_data_object('length_total_rocket')         = spreadsheet_data(10,1)
parametric_data_object('pressure_ambient_ground')     = spreadsheet_data(11,1)
parametric_data_object('temperature_ambient_ground')  = spreadsheet_data(12,1)
parametric_data_object('edge_rounding')               = spreadsheet_data(13,1)
parametric_data_object('distance_tip_to_COG')         = spreadsheet_data(14,1)
parametric_data_object('distance_tip_to_COP')         = spreadsheet_data(15,1)
parametric_data_object('angle_leading_edge')          = spreadsheet_data(16,1)
parametric_data_object('fin_leading_edge_profile')    = spreadsheet_data(17,1)
parametric_data_object('fin_trailing_edge_profile')   = spreadsheet_data(18,1)
parametric_data_object('diameter_outer_launch_guide') = spreadsheet_data(19,1)
parametric_data_object('diameter_inner_launch_guide') = spreadsheet_data(20,1)
parametric_data_object('moment_inertia_rocket')       = spreadsheet_data(21,1)

end
