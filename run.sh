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

#AT.h
funs='["_AT_test_fun",'

#AT_DataMaterial.h
funs+='"_AT_material_index_from_material_number"'
funs+=']'


"$emcc" libat.a -o libat.js -s EXPORTED_FUNCTIONS="$funs" \
-s EXTRA_EXPORTED_RUNTIME_METHODS='["ccall", "cwrap"]'

rm ../libat.js
rm ../libat.a
mv libat.a ..
mv libat.js ..