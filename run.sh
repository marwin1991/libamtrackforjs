#!/usr/bin/bash

emcc="/home/osboxes/emsdk/emscripten/1.37.36/./emcc"
emmake="/home/osboxes/emsdk/emscripten/1.37.36/./emmake"
emconf="/home/osboxes/emsdk/emscripten/1.37.36/./emconfigure"
emcmake="/home/osboxes/emsdk/emscripten/1.37.36/./emcmake"
emrun="/home/osboxes/emsdk/emscripten/1.37.36/./emrun"

mkdir _build
cd _build
"$emcmake" cmake ..
"$emmake" make

funs='['

#----AT_Error.h
funs+='"_AT_get_error_msg",' 
funs+='"_AT_check_energy_range_single_particle",' 
funs+='"_AT_check_energy_range_single_field",' 
funs+='"_AT_check_particle_no_single_particle",' 
funs+='"_AT_check_particle_no_single_field",' 

#----AT_StoppingPowerDataBethe.h
funs+='"_AT_Bethe_wrapper",' 
funs+='"_AT_el_energy_loss_leading_term_MeV_cm2_g",' 
funs+='"_AT_Bethe_Stopping_Number",' 
funs+='"_AT_Bethe_energy_loss_MeV_cm2_g_single",' 
funs+='"_AT_Bethe_energy_loss_MeV_cm2_g",' 

#----AT_Histograms.h
funs+='"_AT_histo_linear_left_limit",' 
funs+='"_AT_histo_logarithmic_left_limit",' 
funs+='"_AT_histo_left_lFimit",'
funs+='"_AT_histo_left_limits",' 
funs+='"_AT_histo_linear_bin_width",' 
funs+='"_AT_histo_logarithmic_bin_width",' 
funs+='"_AT_histo_bin_width",' 
funs+='"_AT_histo_bin_widths",' 
funs+='"_AT_histo_linear_midpoint",' 
funs+='"_AT_histo_logarithmic_midpoint",' 
funs+='"_AT_histo_midpoint",' 
funs+='"_AT_histo_midpoints",' 
funs+='"_AT_histo_linear_step",' 
funs+='"_AT_histo_logarithmic_step",' 
funs+='"_AT_histo_step",' 
funs+='"_AT_histo_linear_n_bins",' 
funs+='"_AT_histo_logarithmic_n_bins",' 
funs+='"_AT_histo_n_bins",' 
funs+='"_AT_histo_linear_bin_no",' 
funs+='"_AT_histo_logarithmic_bin_no",' 
funs+='"_AT_histo_bin_no",' 
funs+='"_AT_histo_add_single",' 
funs+='"_AT_histo_add_multi",' 
funs+='"_AT_histo_sum",' 
funs+='"_AT_histo_normalize",' 
funs+='"_AT_N2_to_step",' 
funs+='"_AT_step_to_N2",' 
funs+='"_AT_histoOld_log_bin_width",' 
funs+='"_AT_histoOld_lower_bin_limit",'
funs+='"_AT_histoOld_upper_bin_limit",'
funs+='"_AT_histoOld_get_bin_width",' 
funs+='"_AT_histoOld_get_bin_widths",' 
funs+='"_AT_histoOld_bin_no",' 

#----AT_StoppingPowerDataPSTAR.h
funs+='"_AT_PSTAR_wrapper",' 

#----AT_NumericalRoutines.h
funs+='"_AT_range_straggling_convolution",' 
funs+='"_AT_Dyx",' 
funs+='"_AT_gamma_",' 
funs+='"_AT_sum",' 
funs+='"_AT_normalize",' 
funs+='"_AT_get_interpolated_y_from_input_table",' 
funs+='"_AT_get_interpolated_y_from_input_2d_table",' 
funs+='"_AT_get_interpolated_x_from_input_2d_table",' 
funs+='"_AT_get_interpolated_y_from_interval",' 

#----AT_Constants.h

#----AT.h
funs+='"_AT_test_fun",' 

#----AT_StoppingPowerDataFromFile.h
funs+='"_AT_FromFile_wrapper",' 

#----AT_StoppingPower.h
funs+='"_AT_Mass_Stopping_Power",' 
funs+='"_AT_Stopping_Power",' 
funs+='"_AT_Mass_Stopping_Power_with_no",' 
funs+='"_AT_Stopping_Power_with_no",' 
funs+='"_AT_Energy_MeV_u_from_Stopping_Power_single",' 

#----AT_PhysicsRoutines.h
funs+='"_AT_beta_from_E_single",' 
funs+='"_AT_beta_from_E",' 
funs+='"_AT_E_from_beta_single",' 
funs+='"_AT_E_from_beta",' 
funs+='"_AT_E_from_gamma_single",' 
funs+='"_AT_E_from_gamma",' 
funs+='"_AT_E_MeV_u_from_momentum_single",' 
funs+='"_AT_E_MeV_u_from_momentum_MeV_c_u",' 
funs+='"_AT_gamma_from_E_single",' 
funs+='"_AT_gamma_from_E",' 
funs+='"_AT_effective_charge_from_beta_single",' 
funs+='"_AT_effective_charge_from_beta",' 
funs+='"_AT_energy_straggling_MeV2_cm2_g",' 
funs+='"_AT_energy_straggling_after_slab_E_MeV_u",' 
funs+='"_AT_effective_charge_from_E_MeV_u_single",' 
funs+='"_AT_effective_charge_from_E_MeV_u",' 
funs+='"_AT_mean_excitation_energy_eV_from_Z_single",' 
funs+='"_AT_mean_excitation_energy_eV_from_Z",' 
funs+='"_AT_mass_correction_terms_new",' 
funs+='"_AT_max_relativistic_E_transfer_MeV_new_single",' 
funs+='"_AT_max_classic_E_transfer_MeV_new_single",' 
funs+='"_AT_max_E_transfer_MeV_new_single",' 
funs+='"_AT_max_E_transfer_MeV_new",' 
funs+='"_AT_mass_correction_terms",' 
funs+='"_AT_max_relativistic_E_transfer_MeV_single",' 
funs+='"_AT_max_classic_E_transfer_MeV_single",' 
funs+='"_AT_max_E_transfer_MeV_single",' 
funs+='"_AT_max_E_transfer_MeV",' 
funs+='"_AT_momentum_from_E_MeV_c_u_single",' 
funs+='"_AT_momentum_MeV_c_u_from_E_MeV_u",' 
funs+='"_AT_dose_Gy_from_fluence_cm2_single",' 
funs+='"_AT_dose_Gy_from_fluence_cm2",' 
funs+='"_AT_fluence_cm2_from_dose_Gy_single",' 
funs+='"_AT_fluence_cm2_from_dose_Gy",' 
funs+='"_AT_beam_par_physical_to_technical",' 
funs+='"_AT_beam_par_technical_to_physical",' 
funs+='"_AT_interparticleDistance_m",' 
funs+='"_AT_inv_interparticleDistance_Gy",' 
funs+='"_AT_single_impact_fluence_cm2_single",' 
funs+='"_AT_single_impact_fluence_cm2",' 
funs+='"_AT_single_impact_dose_Gy_single",' 
funs+='"_AT_single_impact_dose_Gy",' 
funs+='"_AT_total_D_Gy",' 
funs+='"_AT_total_fluence_cm2",' 
funs+='"_AT_fluence_weighted_E_MeV_u",' 
funs+='"_AT_dose_weighted_E_MeV_u",' 
funs+='"_AT_fluence_weighted_LET_MeV_cm2_g",' 
funs+='"_AT_dose_weighted_LET_MeV_cm2_g",' 
funs+='"_AT_stopping_power_ratio",' 
funs+='"_AT_mean_number_of_tracks_contrib",' 
funs+='"_AT_kinetic_variable_single",' 
funs+='"_AT_Rutherford_SDCS",' 
funs+='"_AT_Rutherford_scatter_cross_section",' 
funs+='"_AT_gyroradius_m",' 

#----AT_DataMaterial.h
funs+='"_AT_material_index_from_material_number",' 
funs+='"_AT_material_name_from_number",' 
funs+='"_AT_material_number_from_name",' 
funs+='"_AT_density_g_cm3_from_material_no",' 
funs+='"_AT_I_eV_from_material_no",' 
funs+='"_AT_alpha_g_cm2_MeV_from_material_no",' 
funs+='"_AT_p_MeV_from_material_no",' 
funs+='"_AT_m_g_cm2_from_material_no",' 
funs+='"_AT_average_A_from_material_no",' 
funs+='"_AT_average_Z_from_material_no",' 
funs+='"_AT_phase_from_material_no",' 
funs+='"_AT_get_material_data",' 
funs+='"_AT_get_materials_data",' 
funs+='"_AT_electron_density_m3_from_material_no_single",' 
funs+='"_AT_electron_density_m3_from_material_no_multi",' 
funs+='"_AT_plasma_energy_J_from_material_no",' 
funs+='"_AT_electron_density_m3_single",' 
funs+='"_AT_electron_density_m3_multi",' 
funs+='"_AT_plasma_energy_J_single",' 
funs+='"_AT_electron_density_m3_from_composition",' 
funs+='"_AT_average_A_from_composition",' 
funs+='"_AT_average_Z_from_composition",' 
funs+='"_AT_effective_Z_from_composition",' 
funs+='"_AT_I_eV_from_composition",' 
funs+='"_AT_set_user_material",' 
funs+='"_AT_set_user_material_from_composition",' 

#----AT_SPC.h
funs+='"_AT_SPC_get_number_of_bytes_in_file",' 
funs+='"_AT_SPC_fast_read_buffer",' 
funs+='"_AT_SPC_decompose_size",' 
funs+='"_AT_SPC_decompose_header",' 
funs+='"_AT_SPC_decompose_data",' 
funs+='"_AT_SPC_get_number_of_bins_from_filename_fast",' 
funs+='"_AT_SPC_read_header_from_filename_fast",' 
funs+='"_AT_SPC_read_data_from_filename_fast",' 
funs+='"_AT_SPC_read_from_filename_fast",' 
funs+='"_AT_SPC_number_of_bins_at_range",' 
funs+='"_AT_SPC_spectrum_at_range",' 

#----AT_StoppingPowerData.h
funs+='"_AT_stopping_power_source_model_name_from_number",' 
funs+='"_AT_stopping_power_source_model_number_from_name",' 

#----AT_ElectronRange.h
funs+='"_AT_ER_ButtsKatz_range_g_cm2",' 
funs+='"_AT_ER_Waligorski_range_g_cm2",' 
funs+='"_AT_ER_Edmund_range_g_cm2",' 
funs+='"_AT_ER_Geiss_range_g_cm2",' 
funs+='"_AT_ER_Scholz_range_g_cm2",' 
funs+='"_AT_ER_Tabata_range_g_cm2",' 
funs+='"_AT_ER_PowerLaw_alpha",' 
funs+='"_AT_ER_Tabata_constants",' 
funs+='"_AT_ER_Scholz_new_range_g_cm2",' 
funs+='"_AT_max_electron_ranges_m",' 
funs+='"_AT_max_electron_range_m",' 

#----AT_StoppingPowerDataICRU.h
funs+='"_AT_ICRU_wrapper",' 

#----AT_DataParticle.h
funs+='"_AT_particle_no_from_Z_and_A_single",' 
funs+='"_AT_particle_no_from_Z_and_A",' 
funs+='"_AT_A_from_particle_no_single",' 
funs+='"_AT_A_from_particle_no",'
funs+='"_AT_particle_names",'
funs+='"_AT_atomic_weight_from_Z",' 
funs+='"_AT_Z_from_particle_no_single",' 
funs+='"_AT_Z_from_particle_no",' 
funs+='"_AT_atomic_weight_from_particle_no",' 
funs+='"_AT_I_eV_from_particle_no",' 
funs+='"_AT_nuclear_spin_from_particle_no_multi",' 
funs+='"_AT_nuclear_spin_from_particle_no_single",' 
funs+='"_AT_nuclear_spin_from_Z_and_A",' 
funs+='"_AT_particle_name_from_particle_no_single",' 
funs+='"_AT_particle_no_from_particle_name_single",' 
funs+='"_AT_particle_name_from_particle_no",' 
funs+='"_AT_particle_no_from_particle_name",' 
funs+='"_AT_Z_from_element_acronym_single",' 
funs+='"_AT_Z_from_element_acronym",' 
funs+='"_AT_element_acronym_from_Z_single",' 
funs+='"_AT_element_acronym_from_Z",' 
funs+='"_AT_atomic_weight_from_element_acronym_single",' 
funs+='"_AT_atomic_weight_from_element_acronym",' 
funs+='"_AT_density_g_cm3_from_element_acronym_single",' 
funs+='"_AT_density_g_cm3_from_element_acronym",' 
funs+='"_AT_I_eV_from_element_acronym_single",' 
funs+='"_AT_I_eV_from_element_acronym",' 
funs+='"_AT_electron_density_cm3_from_element_acronym_single",' 
funs+='"_AT_electron_density_cm3_from_element_acronym"'

funs+=']'

"$emcc" libat.a -o libat.html -s WASM=1 -s EXPORTED_FUNCTIONS="$funs" \
-s EXTRA_EXPORTED_RUNTIME_METHODS='["ccall", "cwrap"]'

rm ../libat.html
rm ../libat.a
rm ../libat.wasm
rm ../libat.js
mv libat.a ..
mv libat.html ..
mv libat.wasm ..
mv libat.js ..
