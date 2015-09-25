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
data = xlsread('input_parameters.csv','B2:B23');

% Extract parameters from the imported data file
area_fin_frontal            = data(1,1)
area_face_fin               = data(2,1)
width_fins_at_tube          = data(3,1)
fins_count                  = data(4,1)
thickness_fins_at_tube      = data(5,1)
area_surface_nose           = data(6,1)
height_fins                 = data(7,1)
diameter_outer              = data(8,1)
surface_roughness           = data(9,1)
length_total_rocket         = data(10,1)
pressure_ambient_ground     = data(11,1)
temperature_ambient_ground  = data(12,1)
edge_rounding               = data(13,1)
distance_tip_to_COG         = data(14,1)
distance_tip_to_COP         = data(15,1)
angle_leading_edge          = data(16,1)
fin_leading_edge_profile    = data(17,1)
fin_trailing_edge_profile   = data(18,1)
diameter_outer_launch_guide = data(19,1)
diameter_inner_launch_guide = data(20,1)
moment_inertia_rocket       = data(21,1)

