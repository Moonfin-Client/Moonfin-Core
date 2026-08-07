# Builds the JNI shim for the Dolby Vision RPU converter. libdovi itself is
# dlopened at runtime, so nothing links against it here.
cmake_minimum_required(VERSION 3.22)
project(moonfin_dovi C)

add_library(moonfin_dovi SHARED dovi_jni.c)
target_link_libraries(moonfin_dovi ${CMAKE_DL_LIBS})

# Use 16 KB page-size-compatible linker settings on Android.
if(ANDROID)
  target_link_options(moonfin_dovi PRIVATE
    -Wl,-z,max-page-size=16384
    -Wl,-z,common-page-size=16384
  )
endif()
