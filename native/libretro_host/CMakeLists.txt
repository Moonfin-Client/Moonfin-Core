# Portable libretro host, built into the Android app and each desktop runner.
# The platform glue links libretro_host and provides the texture, input, and
# audio sinks through lh_callbacks.
cmake_minimum_required(VERSION 3.14)
project(libretro_host C)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)

add_library(libretro_host STATIC libretro_host.c)
target_include_directories(libretro_host PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

# MSVC keeps C11 atomics behind an opt-in flag, so stdatomic.h errors out
# without it. The desktop runners are the only MSVC consumers.
if(MSVC)
  target_compile_options(libretro_host PRIVATE /experimental:c11atomics)
endif()

# The per-frame pixel conversion and audio mixing are far too slow at -O0, so
# debug builds still compile the host optimized. The flag lands after the
# toolchain's -O0 and the last -O wins.
set(LH_DEBUG_OPT "$<$<AND:$<CONFIG:Debug>,$<NOT:$<C_COMPILER_ID:MSVC>>>:-O2>")
target_compile_options(libretro_host PRIVATE ${LH_DEBUG_OPT})

# Warnings were not enabled here, so "warning-free" meant nothing: two unused
# symbols sat in the tree unnoticed. On by default; not -Werror, since the
# five platform builds that consume this file have not been swept yet.
#
# target_compile_options, NOT add_compile_options: the directory property is
# only inherited by targets created after the call, and libretro_host is
# declared above it -- so the directory form reached the test targets and left
# the one file this project actually maintains compiling without either flag.
if(CMAKE_C_COMPILER_ID MATCHES "GNU|Clang")
  target_compile_options(libretro_host PRIVATE -Wall -Wextra)
  add_compile_options(-Wall -Wextra)
endif()

find_package(Threads REQUIRED)
target_link_libraries(libretro_host PUBLIC Threads::Threads)
if(NOT WIN32)
  target_link_libraries(libretro_host PUBLIC ${CMAKE_DL_LIBS})
endif()

# Desktop audio sink (miniaudio). The desktop runners enable it. Android and
# the Apple platforms use their own audio, so it stays off by default.
option(LIBRETRO_HOST_AUDIO "Build the miniaudio desktop audio sink" OFF)
if(LIBRETRO_HOST_AUDIO)
  add_library(lh_audio STATIC lh_audio.c)
  target_include_directories(lh_audio PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
  target_compile_options(lh_audio PRIVATE ${LH_DEBUG_OPT})
  if(MSVC)
    target_compile_options(lh_audio PRIVATE /experimental:c11atomics)
  endif()
  target_link_libraries(lh_audio PUBLIC libretro_host)
  if(APPLE)
    target_link_libraries(lh_audio PUBLIC "-framework CoreAudio"
      "-framework AudioToolbox" "-framework CoreFoundation")
  elseif(WIN32)
    target_link_libraries(lh_audio PUBLIC ole32)
  else()
    target_link_libraries(lh_audio PUBLIC ${CMAKE_DL_LIBS} m)
  endif()
endif()

# Headless self-test: a stub core plus a harness that drives the host. Enable
# with -DLIBRETRO_HOST_TESTS=ON.
option(LIBRETRO_HOST_TESTS "Build the libretro host self-test" OFF)
if(LIBRETRO_HOST_TESTS)
  add_library(stub_core SHARED test/stub_core.c)
  set_target_properties(stub_core PROPERTIES PREFIX "" C_VISIBILITY_PRESET default)
  # The stub reads input from a second thread under stub_input_thread, to
  # exercise the host's cross-thread input detector.
  target_link_libraries(stub_core PRIVATE Threads::Threads)

  add_executable(libretro_host_test test/test_harness.c)
  target_link_libraries(libretro_host_test PRIVATE libretro_host)
  # The harness includes stdatomic.h too, so it needs the same opt-in the
  # library gets above; without it the test target is unbuildable on MSVC.
  if(MSVC)
    target_compile_options(libretro_host_test PRIVATE /experimental:c11atomics)
  endif()

  enable_testing()
  add_test(
    NAME libretro_host_test
    COMMAND libretro_host_test $<TARGET_FILE:stub_core> ${CMAKE_CURRENT_BINARY_DIR})
endif()
