#include <cuda.h>
#include <cuda_runtime.h>

#include "glog/logging.h"

#include "experimental/cuda_example/mat_add.h"
#include "experimental/cuda_example/vector_add.h"

namespace qcraft {

static void HandleError(cudaError_t err, const char* file, int line) {
  if (err != cudaSuccess) {
    printf("%s in %s at line %d\n", cudaGetErrorString(err), file, line);
    exit(EXIT_FAILURE);
  }
}

#define HANDLE_ERROR(err) (HandleError(err, __FILE__, __LINE__))

int Main(int argc, char* argv[]) {
  cudaDeviceProp dev_prop;
  int num_devices = 0;
  int driver_version;
  HANDLE_ERROR(cudaDriverGetVersion(&driver_version));
  LOG(INFO) << "Cuda driver version: " << driver_version;

  int runtime_version = 0;
  HANDLE_ERROR(cudaRuntimeGetVersion(&runtime_version));
  LOG(INFO) << "Cuda runtime version: " << runtime_version;

  HANDLE_ERROR(cudaGetDeviceCount(&num_devices));

  CHECK_GT(num_devices, 0);
  LOG(INFO) << "GPU dvice num: " << num_devices;

  for (uint32_t dev = 0; dev < num_devices; dev++) {
    HANDLE_ERROR(cudaGetDeviceProperties(&dev_prop, dev));
    LOG(INFO) << "dev: " << dev << ", name: " << dev_prop.name
              << ", totalGlobalMem: "
              << dev_prop.totalGlobalMem / 1024 / 1024 / 1024 << "GB"
              << ", sm: " << dev_prop.multiProcessorCount
              << ", block: " << dev_prop.sharedMemPerBlock
              << ", maxThreadsPerBlock: " << dev_prop.maxThreadsPerBlock
              << ", maxThreadsPerMultiProcessor: "
              << dev_prop.maxThreadsPerMultiProcessor;
  }
  // VectorAddDemo(1000);
  MatAddDemo(100);
  return 0;
}
}  // namespace qcraft

int main(int argc, char* argv[]) { return qcraft::Main(argc, argv); }
