# Builds the Android JNI bridge and links the shared libretro host into it.
cmake_minimum_required(VERSION 3.22)
project(moonfin_libretro C)

# The portable host lives outside the android tree.
set(HOST_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../../../../native/libretro_host)
add_subdirectory(${HOST_DIR} libretro_host_build)

add_library(moonfin_libretro SHARED native_game_jni.c egl_backend.c)
target_include_directories(moonfin_libretro PRIVATE ${HOST_DIR})
# Keeps the per-frame blit optimized in debug builds, where the toolchain
# defaults to -O0 and the last -O wins.
target_compile_options(moonfin_libretro PRIVATE "$<$<CONFIG:Debug>:-O2>")
# EGL and GLESv2 back the hardware-render path. GLESv3 entry points are
# resolved through eglGetProcAddress instead of linked, so one binary runs on
# a GLES2-only device and a GLES3 one alike.
target_link_libraries(moonfin_libretro PRIVATE libretro_host android log EGL GLESv2)
