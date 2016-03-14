%% Import and Plot Arcturus Data

%% Import Arcturus Pressure Data
import_arcturus_pressure_sensor

%% Plot Pressure Data
plot_arcturus_pressure

%% Import Accelerometer Data
import_arcturus_accelerometer

%% Import Arcturus OpenRocket Data
openrocket_data_import('arcturus_openrocket.csv','arcturus')

%% Plot Accelerometer Data
plot_arcturus_accelerometer

%% Import Strattologger Data
import_arcturus_custom_avionics

%% Plot Strattologger Data
plot_arcturus_custom_avionics
