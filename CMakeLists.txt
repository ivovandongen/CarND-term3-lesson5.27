cmake_minimum_required(VERSION 3.5)
project(TEMPLATE)

set(CMAKE_CXX_STANDARD 14)

# CMake modules
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/")

# Ensure git submodules are up to date
include(${CMAKE_MODULE_PATH}/git.cmake)

include(deps/eigen.cmake)

if (UNIX)
    # Silence warnings in Eigen
    add_compile_options(-Wno-deprecated-register)
endif()



add_executable(Template
    ${CMAKE_SOURCE_DIR}/src/main.cpp
)

target_link_libraries(Template Eigen)
