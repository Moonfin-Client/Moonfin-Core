cmake_minimum_required(VERSION 3.14)
project(runner_visibility_test LANGUAGES CXX)

if(NOT WIN32)
  message(FATAL_ERROR "This test requires Windows")
endif()

enable_testing()
add_executable(window_visibility_test
  window_visibility_test.cpp
  ../win32_window.cpp
)
target_compile_features(window_visibility_test PRIVATE cxx_std_17)
target_compile_definitions(window_visibility_test PRIVATE UNICODE _UNICODE)
target_include_directories(window_visibility_test PRIVATE stubs)
target_link_libraries(window_visibility_test PRIVATE user32 dwmapi advapi32)
add_test(NAME window_visibility COMMAND window_visibility_test)
