#include <cuda_runtime.h>
#include <iostream>
#include <sstream>

std::string detect_and_print() {
    // Create an ostringstream object
    std::ostringstream oss;
    int deviceCount = 0;
    cudaError_t error_id = cudaGetDeviceCount(&deviceCount);

    if (error_id != cudaSuccess) {
        oss << "Error: " << cudaGetErrorString(error_id) << std::endl;
        return oss.str();
    }

    if (deviceCount == 0) {
        oss << "No CUDA-capable devices detected." << std::endl;
        return oss.str();
    }

    oss << "Number of CUDA-capable devices: " << deviceCount << std::endl;

    for (int device = 0; device < deviceCount; ++device) {
        cudaDeviceProp deviceProp;
        cudaGetDeviceProperties(&deviceProp, device);

        oss << "\nDevice " << device << ": " << deviceProp.name << std::endl;
        oss << "  Compute Capability: " << deviceProp.major << "." << deviceProp.minor << std::endl;
        oss << "  Total Global Memory: " << deviceProp.totalGlobalMem / (1024 * 1024) << " MB" << std::endl;
        oss << "  Multiprocessors: " << deviceProp.multiProcessorCount << std::endl;
        oss << "  Maximum Threads per Block: " << deviceProp.maxThreadsPerBlock << std::endl;
        oss << "  Maximum Threads per Multiprocessor: " << deviceProp.maxThreadsPerMultiProcessor << std::endl;
        oss << "  Maximum Grid Size: [" 
                  << deviceProp.maxGridSize[0] << ", " 
                  << deviceProp.maxGridSize[1] << ", " 
                  << deviceProp.maxGridSize[2] << "]" << std::endl;
        oss << "  Maximum Threads Dimensions: [" 
                  << deviceProp.maxThreadsDim[0] << ", " 
                  << deviceProp.maxThreadsDim[1] << ", " 
                  << deviceProp.maxThreadsDim[2] << "]" << std::endl;
    }

    return oss.str();
}
