# Builds the JNI shim for the Dolby Vision RPU converter. libdovi itself is
# dlopened at runtime, so nothing links against it here.
cmake_minimum_required(VERSION 3.22)
project(moonfin_dovi C)

add_library(moonfin_dovi SHARED dovi_jni.c)
target_link_libraries(moonfin_dovi ${CMAKE_DL_LIBS})
