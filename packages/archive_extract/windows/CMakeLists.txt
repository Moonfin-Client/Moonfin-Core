cmake_minimum_required(VERSION 3.14)
project(archive_extract LANGUAGES C CXX)

set(PLUGIN_NAME "archive_extract_plugin")

add_library(${PLUGIN_NAME} SHARED
  "archive_extract_plugin.cpp"
  "archive_extract_plugin_c_api.cpp"
  "../shared/libarchive_extract.c"
)

apply_standard_settings(${PLUGIN_NAME})

set_target_properties(${PLUGIN_NAME} PROPERTIES
  CXX_VISIBILITY_PRESET hidden
  C_VISIBILITY_PRESET hidden
)

target_compile_definitions(${PLUGIN_NAME} PRIVATE FLUTTER_PLUGIN_IMPL)

target_include_directories(${PLUGIN_NAME}
  INTERFACE
    "${CMAKE_CURRENT_SOURCE_DIR}/include"
  PRIVATE
    "${CMAKE_CURRENT_SOURCE_DIR}/../shared"
)

find_package(LibArchive CONFIG QUIET)

if (LibArchive_FOUND)
  target_link_libraries(${PLUGIN_NAME} PRIVATE LibArchive::LibArchive)
else()
  # Determine the vcpkg triplet from the architecture Flutter is *building for*.
  # Flutter passes the target arch to CMake via the Visual Studio generator
  # platform (-A ARM64 / -A x64 / -A Win32), so CMAKE_GENERATOR_PLATFORM is the
  # authoritative source of truth. Do NOT consult CMAKE_SYSTEM_PROCESSOR or
  # CMAKE_SIZEOF_VOID_P: on an arm64 host building an x64 app the host is still
  # ARM64, which would pick the arm64 libarchive and cause LNK4272/LNK1120
  # (machine type 'ARM64' conflicts with target machine type 'x64').
  if(CMAKE_GENERATOR_PLATFORM MATCHES "[Aa][Rr][Mm]64")
    set(_vcpkg_triplet "arm64-windows")
  elseif(CMAKE_GENERATOR_PLATFORM MATCHES "[Ww][Ii][Nn]32|[Xx]86")
    set(_vcpkg_triplet "x86-windows")
  else()
    set(_vcpkg_triplet "x64-windows")
  endif()

  find_path(LIBARCHIVE_INCLUDE_DIR
    NAMES archive.h
    PATHS
      "$ENV{VCPKG_ROOT}/installed/${_vcpkg_triplet}/include"
      "$ENV{VCPKG_INSTALLED_DIR}/${_vcpkg_triplet}/include"
  )

  find_library(LIBARCHIVE_LIBRARY
    NAMES archive libarchive
    PATHS
      "$ENV{VCPKG_ROOT}/installed/${_vcpkg_triplet}/lib"
      "$ENV{VCPKG_INSTALLED_DIR}/${_vcpkg_triplet}/lib"
  )

  if (NOT LIBARCHIVE_INCLUDE_DIR OR NOT LIBARCHIVE_LIBRARY)
    message(FATAL_ERROR "libarchive not found for Windows plugin. Install it with: vcpkg install libarchive:${_vcpkg_triplet}")
  endif()

  target_include_directories(${PLUGIN_NAME} PRIVATE ${LIBARCHIVE_INCLUDE_DIR})
  target_link_libraries(${PLUGIN_NAME} PRIVATE ${LIBARCHIVE_LIBRARY})
endif()

target_link_libraries(${PLUGIN_NAME} PRIVATE flutter flutter_wrapper_plugin)

set(archive_extract_bundled_libraries
  ""
  PARENT_SCOPE
)
