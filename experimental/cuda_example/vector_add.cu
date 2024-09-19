#include <cuda.h>
#include <cuda_runtime.h>

#include "glog/logging.h"

#include "experimental/cuda_example/vector_add.h"

namespace qcraft {

static void HandleError(cudaError_t err, const char* file, int line) {
  if (err != cudaSuccess) {
    printf("%s in %s at line %d\n", cudaGetErrorString(err), file, line);
    exit(EXIT_FAILURE);
  }
}

#define HANDLE_ERROR(err) (HandleError(err, __FILE__, __LINE__))

__global__ void VectorAdd(int* a, int* b, int* c, int num) {
  int i = threadIdx.x;
  if (i < num) {
    c[i] = a[i] + b[i];
  }
}

void VectorAddDemo(int num) {
  int a[num], b[num], c[num];
  for (int i = 0; i < num; i++) {
    a[i] = i;
    b[i] = i * i;
  }

  int block_num = (num + 100 - 1) / 100;
  int thread_num = 100;

  int *a_gpu, *b_gpu, *c_gpu;
  HANDLE_ERROR(cudaMalloc((void**)&a_gpu, num * sizeof(int)));
  HANDLE_ERROR(cudaMalloc((void**)&b_gpu, num * sizeof(int)));
  HANDLE_ERROR(cudaMalloc((void**)&c_gpu, num * sizeof(int)));

  HANDLE_ERROR(cudaMemcpy(a_gpu, a, num * sizeof(int), cudaMemcpyHostToDevice));
  HANDLE_ERROR(cudaMemcpy(b_gpu, b, num * sizeof(int), cudaMemcpyHostToDevice));

  VectorAdd<<<block_num, thread_num>>>(a_gpu, b_gpu, c_gpu, num);

  HANDLE_ERROR(cudaMemcpy(c, c_gpu, num * sizeof(int), cudaMemcpyDeviceToHost));

  for (int i = 0; i < num; i++) {
    printf("%d + %d = %d\n", a[i], b[i], c[i]);
  }

  // Release device memory
  cudaFree(a_gpu);
  cudaFree(b_gpu);
  cudaFree(c_gpu);
  cudaDeviceReset();
}

}  // namespace qcraft
