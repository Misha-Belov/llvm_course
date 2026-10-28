cmake_minimum_required(VERSION 3.16)

project(WaveIRGen LANGUAGES C CXX)

# LLVM
find_package(LLVM REQUIRED CONFIG)

message(STATUS "Using LLVM ${LLVM_PACKAGE_VERSION}")

list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")

# Zstandard dependency
find_package(zstd REQUIRED MODULE)

include_directories(SYSTEM ${LLVM_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Используем общую библиотеку LLVM вместо отдельных компонентов
find_library(LLVM_SHARED_LIB
    NAMES LLVM-18 LLVM
    PATHS ${LLVM_LIBRARY_DIRS}
)

if(NOT LLVM_SHARED_LIB)
    message(FATAL_ERROR "LLVM shared library not found")
endif()

message(STATUS "LLVM library: ${LLVM_SHARED_LIB}")

# IR Generator
add_executable(app_ir_gen app_ir_gen.cpp)

target_link_libraries(app_ir_gen PRIVATE
    ${LLVM_SHARED_LIB}
)

# ExecutionEngine без графики
add_executable(ir_runner_headless ir_runner.cpp)

target_compile_definitions(ir_runner_headless PRIVATE
    IRGEN_HEADLESS=1
)

target_link_libraries(ir_runner_headless PRIVATE
    ${LLVM_SHARED_LIB}
)

# ExecutionEngine с SDL2
find_package(PkgConfig REQUIRED)
pkg_check_modules(SDL2 QUIET IMPORTED_TARGET sdl2)

if(SDL2_FOUND)
    add_executable(ir_runner_sdl
        ir_runner.cpp
        ../sim.c
    )

    target_include_directories(ir_runner_sdl PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/..
    )

    target_link_libraries(ir_runner_sdl PRIVATE
        ${LLVM_SHARED_LIB}
        PkgConfig::SDL2
    )
endif()