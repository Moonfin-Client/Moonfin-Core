# This file is a part of media_kit (https://github.com/media-kit/media-kit).
#
# Copyright © 2021 & onwards, Hitesh Kumar Saini <saini123hitesh@gmail.com>.
# All rights reserved.
# Use of this source code is governed by MIT license that can be found in the LICENSE file.

cmake_minimum_required(VERSION 3.14)

# This option is read by the other packages which are part of package:media_kit.
option(MEDIA_KIT_LIBS_AVAILABLE "package:media_kit libraries are available." ON)

set(PROJECT_NAME "media_kit_libs_windows_video")
project(${PROJECT_NAME} LANGUAGES CXX)

# Deal with MSVC incompatiblity
add_compile_definitions(_DISABLE_CONSTEXPR_MUTEX_CONSTRUCTOR)

# ------------------------------------------------------------------------------
function(download_and_verify url md5 locationForArchive)
  # Check if the archive exists.
  if(EXISTS "${locationForArchive}")
    file(MD5 "${locationForArchive}" ARCHIVE_MD5)

    # If MD5 doesn't match, delete the archive to download again.
    if(NOT md5 STREQUAL ARCHIVE_MD5)
      file(REMOVE "${locationForArchive}")
      message(STATUS "MD5 mismatch. File deleted.")
    endif()
  endif()

  # Download the archive if it doesn't exist.
  if(NOT EXISTS "${locationForArchive}")
    message(STATUS "Downloading archive from ${url}...")
    file(DOWNLOAD "${url}" "${locationForArchive}")
    message(STATUS "Downloaded archive to ${locationForArchive}.")

    # Verify MD5 of the newly downloaded file.
    file(MD5 "${locationForArchive}" ARCHIVE_MD5)

    if(md5 STREQUAL ARCHIVE_MD5)
      message(STATUS "${locationForArchive} Verification successful.")
    else()
      message(FATAL_ERROR "${locationForArchive} Integrity check failed, please try to re-build project again.")
    endif()
  endif()
endfunction()

function(check_directory_exists_and_not_empty dir result_var)
  # Check if the directory exists
  if(EXISTS "${dir}")
    # Check if the directory is not empty
    file(GLOB dir_contents "${dir}/*")

    if(dir_contents)
      set(${result_var} TRUE PARENT_SCOPE)
    else()
      set(${result_var} FALSE PARENT_SCOPE)
      message(STATUS "Directory ${dir} exists but is empty!")
    endif()
  else()
    set(${result_var} FALSE PARENT_SCOPE)
    message(STATUS "Directory ${dir} does not exist!")
  endif()
endfunction()

# Windows ARM64 support:
# Locate a real 7-Zip executable. The ARM64 native-lib archives are compressed
# with 7-Zip's ARM64 BCJ branch filter (codec 0x0a, added in 7-Zip 23.00), which
# the libarchive bundled inside the VS2022 CMake cannot decode -- `cmake -E tar`
# fails on them with "Unexpected codec ID: a". The windows-11-arm runner ships
# 7-Zip 26.00, which extracts them correctly.
find_program(SEVENZIP_EXECUTABLE
  NAMES 7z 7za 7zr
  HINTS "$ENV{ProgramW6432}/7-Zip" "$ENV{ProgramFiles}/7-Zip"
        "$ENV{ProgramFiles\(x86\)}/7-Zip" "C:/Program Files/7-Zip"
)

# libmpv archive containing the pre-built shared libraries & headers.
#
# MOONFIN PATCH (Windows ARM64 support):
# Flutter sets FLUTTER_TARGET_PLATFORM to "windows-x64" or "windows-arm64"
# (see windows/flutter/CMakeLists.txt). Select arch-matched native libs so the
# build links against ARM64 libmpv/ANGLE on the windows-11-arm runner instead of
# the upstream x64-only archives (which caused LNK4272 / unresolved mpv_* symbols).
# The x64 branch is kept byte-identical to upstream media_kit_libs_windows_video
# 1.0.11 so existing x64 builds are unaffected.
if(NOT DEFINED FLUTTER_TARGET_PLATFORM)
  set(FLUTTER_TARGET_PLATFORM "windows-x64")
endif()

if(FLUTTER_TARGET_PLATFORM STREQUAL "windows-arm64")
  # ARM64 libmpv (aarch64). Hosted on the media-kit-controlled mirror so the URL
  # is stable (shinchiro's daily releases get pruned within weeks).
  set(LIBMPV "mpv-dev-aarch64-20241021-git-0f78584.7z")
  set(LIBMPV_URL "https://github.com/media-kit/libmpv-win32-video-cmake/releases/download/20241021/${LIBMPV}")
  set(LIBMPV_MD5 "5b507a35db13eee6cb7eb21e8be7c83d")
else()
  # x64 (upstream default, unchanged).
  set(LIBMPV "mpv-dev-x86_64-20230924-git-652a1dd.7z")
  set(LIBMPV_URL "https://github.com/media-kit/libmpv-win32-video-build/releases/download/2023-09-24/${LIBMPV}")
  set(LIBMPV_MD5 "a832ef24b3a6ff97cd2560b5b9d04cd8")
endif()

# Download location of the libmpv archive.
set(LIBMPV_ARCHIVE "${CMAKE_BINARY_DIR}/${LIBMPV}")
set(LIBMPV_SRC "${CMAKE_BINARY_DIR}/libmpv")

download_and_verify(
  ${LIBMPV_URL}
  ${LIBMPV_MD5}
  ${LIBMPV_ARCHIVE}
)

check_directory_exists_and_not_empty(${LIBMPV_SRC} LIBMPV_SRC_VALID)

# Extract the libmpv archive.
if(NOT LIBMPV_SRC_VALID)
  message(STATUS "Extracting ${LIBMPV}...")
  make_directory("${LIBMPV_SRC}")
  add_custom_target("${PROJECT_NAME}_LIBMPV_EXTRACT" ALL)
  # extract the ARM64 archive with 7-Zip (see SEVENZIP_EXECUTABLE
  # note above); keep x64 on `cmake -E tar` (unchanged).
  if(FLUTTER_TARGET_PLATFORM STREQUAL "windows-arm64")
    if(NOT SEVENZIP_EXECUTABLE)
      message(FATAL_ERROR
        "7-Zip is required to extract the ARM64 libmpv archive (it may use the 7-Zip ARM64 BCJ "
        "filter, codec 0x0a, which 'cmake -E tar' cannot decode). Install 7-Zip >= 23.00.")
    endif()
    add_custom_command(
      TARGET "${PROJECT_NAME}_LIBMPV_EXTRACT"
      COMMAND "${SEVENZIP_EXECUTABLE}" x -y "-o${LIBMPV_SRC}" "\"${LIBMPV_ARCHIVE}\""
      COMMAND xcopy "\"${LIBMPV_SRC}/include/mpv\"" "\"${LIBMPV_SRC}/mpv\"" /E /H /C /I
      COMMAND rmdir "\"${LIBMPV_SRC}/include\"" /S /Q
      COMMAND ren "\"${LIBMPV_SRC}/mpv\"" "\"include\""
      WORKING_DIRECTORY "${LIBMPV_SRC}"
    )
  else()
    add_custom_command(
      TARGET "${PROJECT_NAME}_LIBMPV_EXTRACT"
      COMMAND "${CMAKE_COMMAND}" -E tar xzf "\"${LIBMPV_ARCHIVE}\""
      COMMAND xcopy "\"${LIBMPV_SRC}/include/mpv\"" "\"${LIBMPV_SRC}/mpv\"" /E /H /C /I
      COMMAND rmdir "\"${LIBMPV_SRC}/include\"" /S /Q
      COMMAND ren "\"${LIBMPV_SRC}/mpv\"" "\"include\""
      WORKING_DIRECTORY "${LIBMPV_SRC}"
    )
  endif()
endif()

# ------------------------------------------------------------------------------

# ANGLE archive containing the pre-built shared libraries & headers.
# MOONFIN PATCH (Windows ARM64 support): arch-matched ANGLE, see note above.
if(FLUTTER_TARGET_PLATFORM STREQUAL "windows-arm64")
  # ARM64 ANGLE build (libEGL/libGLESv2 compiled for aarch64) from the fork used
  # by media-kit's in-progress Windows-ARM64 PR (media-kit/media-kit#1381).
  set(ANGLE "ANGLE_WINARM64.7z")
  set(ANGLE_URL "https://github.com/talynone/flutter-windows-ANGLE-OpenGL-ES/releases/download/v1.0.1/ANGLE_WINARM64.7z")
  set(ANGLE_MD5 "b56aaae894ccf6c8ee90b59ee642a787")
else()
  # x64 (upstream default, unchanged).
  set(ANGLE "ANGLE.7z")
  set(ANGLE_URL "https://github.com/alexmercerind/flutter-windows-ANGLE-OpenGL-ES/releases/download/v1.0.1/ANGLE.7z")
  set(ANGLE_MD5 "e866f13e8d552348058afaafe869b1ed")
endif()

# Download location of the ANGLE archive.
set(ANGLE_ARCHIVE "${CMAKE_BINARY_DIR}/${ANGLE}")
set(ANGLE_SRC "${CMAKE_BINARY_DIR}/ANGLE")

download_and_verify(
  ${ANGLE_URL}
  ${ANGLE_MD5}
  ${ANGLE_ARCHIVE}
)

check_directory_exists_and_not_empty(${ANGLE_SRC} ANGLE_SRC_VALID)

# Extract the ANGLE archive.
if(NOT ANGLE_SRC_VALID)
  message(STATUS "Extracting ${ANGLE}...")
  make_directory("${ANGLE_SRC}")
  add_custom_target("${PROJECT_NAME}_ANGLE_EXTRACT" ALL)
  # the ARM64 ANGLE archive uses the 7-Zip ARM64 BCJ filter
  # (codec 0x0a) that `cmake -E tar` cannot decode, so extract it with 7-Zip;
  # keep x64 on `cmake -E tar` (unchanged).
  if(FLUTTER_TARGET_PLATFORM STREQUAL "windows-arm64")
    if(NOT SEVENZIP_EXECUTABLE)
      message(FATAL_ERROR
        "7-Zip is required to extract the ARM64 ANGLE archive (it uses the 7-Zip ARM64 BCJ "
        "filter, codec 0x0a, which 'cmake -E tar' cannot decode). Install 7-Zip >= 23.00.")
    endif()
    add_custom_command(
      TARGET "${PROJECT_NAME}_ANGLE_EXTRACT"
      COMMAND "${SEVENZIP_EXECUTABLE}" x -y "-o${ANGLE_SRC}" "\"${ANGLE_ARCHIVE}\""
      WORKING_DIRECTORY "${ANGLE_SRC}"
    )
  else()
    add_custom_command(
      TARGET "${PROJECT_NAME}_ANGLE_EXTRACT"
      COMMAND "${CMAKE_COMMAND}" -E tar xzf "\"${ANGLE_ARCHIVE}\""
      WORKING_DIRECTORY "${ANGLE_SRC}"
    )
  endif()
endif()

# ------------------------------------------------------------------------------
set(PLUGIN_NAME "media_kit_libs_windows_video_plugin")

add_library(
  ${PLUGIN_NAME} SHARED
  "include/media_kit_libs_windows_video/media_kit_libs_windows_video_plugin_c_api.h"
  "media_kit_libs_windows_video_plugin_c_api.cpp"
)

apply_standard_settings(${PLUGIN_NAME})

set_target_properties(
  ${PLUGIN_NAME}
  PROPERTIES
  CXX_VISIBILITY_PRESET
  hidden
)
target_compile_definitions(
  ${PLUGIN_NAME}
  PRIVATE
  FLUTTER_PLUGIN_IMPL
)

target_include_directories(
  ${PLUGIN_NAME} INTERFACE
  "${CMAKE_CURRENT_SOURCE_DIR}/include"
)
target_link_libraries(
  ${PLUGIN_NAME}
  PRIVATE
  flutter
  flutter_wrapper_plugin
)

set(
  media_kit_libs_windows_video_bundled_libraries
  "${LIBMPV_SRC}/libmpv-2.dll"
  "${ANGLE_SRC}/d3dcompiler_47.dll"
  "${ANGLE_SRC}/libEGL.dll"
  "${ANGLE_SRC}/libGLESv2.dll"
  "${ANGLE_SRC}/vk_swiftshader.dll"
  "${ANGLE_SRC}/vulkan-1.dll"
  "${ANGLE_SRC}/zlib.dll"
)

# the ARM64 ANGLE DLLs dynamically link libc++.dll (shipped in the
# ARM64 archive but absent from the upstream x64 archive), so bundle it for ARM64
# only -- listing it unconditionally would break x64 packaging (file not present).
if(FLUTTER_TARGET_PLATFORM STREQUAL "windows-arm64")
  list(APPEND media_kit_libs_windows_video_bundled_libraries "${ANGLE_SRC}/libc++.dll")
endif()

set(
  media_kit_libs_windows_video_bundled_libraries
  "${media_kit_libs_windows_video_bundled_libraries}"
  PARENT_SCOPE
)
