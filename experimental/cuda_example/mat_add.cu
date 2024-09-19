#include <cuda.h>
#include <cuda_runtime.h>

#include "glog/logging.h"

#include "experimental/cuda_example/mat_add.h"

namespace qcraft {

static void HandleError(cudaError_t err, const char* file, int line) {
  if (err != cudaSuccess) {
    printf("%s in %s at line %d\n", cudaGetErrorString(err), file, line);
    exit(EXIT_FAILURE);
  }
}

#define HANDLE_ERROR(err) (HandleError(err, __FILE__, __LINE__))

__global__ void MatAdd(int* a, int* b, int* c, int num) {
  int i = blockIdx.x * blockDim.x + threadIdx.x;
  int j = blockIdx.y * blockDim.y + threadIdx.y;
  if (i < num && j < num) {
    int idx = i * num + j;
    c[idx] = a[idx] + b[idx];
  }
}

void MatAddDemo(int num) {
  int m_a[num][num], m_b[num][num], m_c[num][num];
  for (int i = 0; i < num; i++) {
    for (int j = 0; j < num; j++) {
      m_a[i][j] = 1;
      m_b[i][j] = 2;
      m_c[i][j] = 0;
    }
  }

  int total = num * num;
  int *a_gpu, *b_gpu, *c_gpu;

  HANDLE_ERROR(cudaMalloc((void**)&a_gpu, total * sizeof(int)));
  HANDLE_ERROR(cudaMalloc((void**)&b_gpu, total * sizeof(int)));
  HANDLE_ERROR(cudaMalloc((void**)&c_gpu, total * sizeof(int)));

  HANDLE_ERROR(
      cudaMemcpy(a_gpu, m_a, total * sizeof(int), cudaMemcpyHostToDevice));
  HANDLE_ERROR(
      cudaMemcpy(b_gpu, m_b, total * sizeof(int), cudaMemcpyHostToDevice));

  dim3 grid_size(10, 10);
  dim3 block_size((num + grid_size.x - 1) / grid_size.x,
                  (num + grid_size.y - 1) / grid_size.y);

  MatAdd<<<grid_size, block_size>>>(a_gpu, b_gpu, c_gpu, num);
  HANDLE_ERROR(
      cudaMemcpy(m_c, c_gpu, total * sizeof(int), cudaMemcpyDeviceToHost));

  // Release device memory
  cudaFree(a_gpu);
  cudaFree(b_gpu);
  cudaFree(c_gpu);
  cudaDeviceReset();

  for (int i = 0; i < num; i++) {
    for (int j = 0; j < num; j++) {
      printf("%d ", m_c[i][j]);
    }
    printf("\n");
  }
  printf("\n");
}

}  // namespace qcraft
