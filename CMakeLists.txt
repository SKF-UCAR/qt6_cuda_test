cmake_minimum_required(VERSION 3.20)  # Minimum required version of CMake

# Specify the CUDA toolkit location
set(CUDAToolkit_ROOT "/usr/local/cuda")  # Adjust this path to your CUDA installation

# Set CUDA architectures to target
set(CMAKE_CUDA_ARCHITECTURES "70;75;80;86")  # Use the appropriate architecture number for your GPU

# Project name and enable CUDA language
project(qt6_cuda_test LANGUAGES CXX CUDA)


# Set the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Set the CUDA version to 12.6
set(CMAKE_CUDA_STANDARD 14)
set(CMAKE_CUDA_COMPILER_VERSION 12.6)


# Optionally, specify the GPU architectures you want to target
# set_property(TARGET ${PROJECT_NAME} PROPERTY CUDA_ARCHITECTURES 75)  # Adjust the architecture as needed

# Find the required Qt6 components
find_package(Qt6 REQUIRED COMPONENTS Widgets)

# Add UI files, headers, and sources
set(CMAKE_AUTOMOC ON)   # Enable automatic MOC (Meta Object Compiler) for Qt
set(CMAKE_AUTORCC ON)   # Enable automatic RCC (Resource Compiler) if you have Qt resource files
set(CMAKE_AUTOUIC ON)   # Enable automatic UIC for .ui files

# Add the sources and UI files
set(SOURCES
    main.cpp
    mainwindow.cpp
    dialog.cpp
)

set(HEADERS
    mainwindow.h
    dialog.h
)

set(UIS
    mainwindow.ui
    dialog.ui
)
set(CUDA_SOURCES
    cuda_test.cu
)

# Create the executable
add_executable(${PROJECT_NAME} ${SOURCES} ${UIS} ${HEADERS} ${CUDA_SOURCES})

# Link the Qt6 Widgets module
target_link_libraries(${PROJECT_NAME} Qt6::Widgets)

# Set the target properties to use the correct CUDA architecture and standard
set_target_properties(${PROJECT_NAME} PROPERTIES
    CUDA_SEPARABLE_COMPILATION ON   # Enable separable compilation
    CUDA_STANDARD 14                # Set CUDA C++ standard to C++14
)
