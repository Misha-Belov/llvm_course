cmake_minimum_required(VERSION 3.16)
project(TraceEdges LANGUAGES CXX)

find_package(LLVM REQUIRED CONFIG)

message(STATUS "Using LLVM ${LLVM_PACKAGE_VERSION} at ${LLVM_DIR}")

# Заголовочные файлы и определения LLVM
include_directories(SYSTEM ${LLVM_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})

# Стандарт C++
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
include(AddLLVM)

# Runtime компилируется отдельно
set(LLVM_OPTIONAL_SOURCES trace_runtime.c)

# Сборка LLVM Pass
add_llvm_pass_plugin(TracePass TracePass.cpp)