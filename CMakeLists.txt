cmake_minimum_required(VERSION 3.5)
project(TEMPLATE)

set(CMAKE_CXX_STANDARD 14)

include(deps/eigen.cmake)

if (UNIX)
    # Silence warnings in Eigen
    add_compile_options(-Wno-deprecated-register)
endif()



add_executable(Template
    ${CMAKE_SOURCE_DIR}/src/main.cpp
)

target_link_libraries(Template Eigen)
