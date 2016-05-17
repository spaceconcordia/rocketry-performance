%% Import Simulation Data
import_rasaero_data;
import_rocksim_data;

%% Plot Error for all available data
figure; plot_error_altitude_v_time;
figure; plot_error_mach_v_time;
figure; plot_error_stability_vs_aoa;
figure; plot_error_coeffrictiondrag_mach;
figure; plot_error_dragforce_v_mach;
figure; plot_error_dragcoef_v_mach;
figure; plot_rocket_flight_stability;
figure; plot_error_mass_v_time;
