include_guard_x(__JSON__)

add_library(json INTERFACE)
target_include_directories(json SYSTEM INTERFACE ${CMAKE_SOURCE_DIR}/deps/json/src)
