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

#----AT.h
funs='["_AT_test_fun",'

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
funs+='"_AT_set_user_material_from_composition"'

#----AT_DataPartical.h
#funs+='"_",'


funs+=']'


"$emcc" libat.a -o libat.js -s EXPORTED_FUNCTIONS="$funs" \
-s EXTRA_EXPORTED_RUNTIME_METHODS='["ccall", "cwrap"]'

rm ../libat.js
rm ../libat.a
mv libat.a ..
mv libat.js ..