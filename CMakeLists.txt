cmake_minimum_required(VERSION 3.10)
project(libamtrackforjs C)

set(CMAKE_C_STANDARD 99)
add_library(at STATIC src/AT.c src/AT_Constants.c src/AT_DataMaterial.c src/AT_DataParticle.c src/AT_Error.c src/AT_GammaResponse.c
        src/AT_Histograms.c src/AT_NumericalRoutines.c src/AT_SPC.c src/AT_StoppingPowerDataFromFile.c
        src/AT_StoppingPowerDataICRU.c)

include(${CMAKE_ROOT}/Modules/ExternalProject.cmake)

ExternalProject_Add(gsl
        GIT_REPOSITORY "https://github.com/ampl/gsl.git"
        UPDATE_COMMAND git pull "https://github.com/ampl/gsl.git"
        CONFIGURE_COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/gsl/./configure
        SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/gsl
        INSTALL_DIR ${CMAKE_CURRENT_BINARY_DIR}/lib
        BUILD_COMMAND "make"
        )
target_link_libraries(at -L./lib)

install(TARGETS at DESTINATION lib)
include_directories(${CMAKE_SOURCE_DIR}/inc)