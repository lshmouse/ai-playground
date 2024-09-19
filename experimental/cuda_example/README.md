## Cuda

### Example
```
bazel run //experimental/cuda_example:cuda_example
```

### Usage
```
$ nvcc --version
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2017 NVIDIA Corporation
Built on Fri_Nov__3_21:07:56_CDT_2017
Cuda compilation tools, release 9.1, V9.1.85
```

```
watch -n 0.5 nvidia-smi
```

```
$ deviceQuery
deviceQuery Starting...

 CUDA Device Query (Runtime API) version (CUDART static linking)

Detected 1 CUDA Capable device(s)

Device 0: "NVIDIA GeForce RTX 3060"
  CUDA Driver Version / Runtime Version          12.1 / 11.3
  CUDA Capability Major/Minor version number:    8.6
  Total amount of global memory:                 12042 MBytes (12626493440 bytes)
  (028) Multiprocessors, (128) CUDA Cores/MP:    3584 CUDA Cores
  GPU Max Clock rate:                            1867 MHz (1.87 GHz)
  Memory Clock rate:                             7501 Mhz
  Memory Bus Width:                              192-bit
  L2 Cache Size:                                 2359296 bytes
  Maximum Texture Dimension Size (x,y,z)         1D=(131072), 2D=(131072, 65536), 3D=(16384, 16384, 16384)
  Maximum Layered 1D Texture Size, (num) layers  1D=(32768), 2048 layers
  Maximum Layered 2D Texture Size, (num) layers  2D=(32768, 32768), 2048 layers
  Total amount of constant memory:               65536 bytes
  Total amount of shared memory per block:       49152 bytes
  Total shared memory per multiprocessor:        102400 bytes
  Total number of registers available per block: 65536
  Warp size:                                     32
  Maximum number of threads per multiprocessor:  1536
  Maximum number of threads per block:           1024
  Max dimension size of a thread block (x,y,z): (1024, 1024, 64)
  Max dimension size of a grid size    (x,y,z): (2147483647, 65535, 65535)
  Maximum memory pitch:                          2147483647 bytes
  Texture alignment:                             512 bytes
  Concurrent copy and kernel execution:          Yes with 2 copy engine(s)
  Run time limit on kernels:                     Yes
  Integrated GPU sharing Host Memory:            No
  Support host page-locked memory mapping:       Yes
  Alignment requirement for Surfaces:            Yes
  Device has ECC support:                        Disabled
  Device supports Unified Addressing (UVA):      Yes
  Device supports Managed Memory:                Yes
  Device supports Compute Preemption:            Yes
  Supports Cooperative Kernel Launch:            Yes
```

### CUDA Samples
```
git clone git@github.com:NVIDIA/cuda-samples.git
cd cuda-samples
git checkout -b v9.2 tags/v9.2
make
```
See: https://github.com/NVIDIA/cuda-samples

### TODO
- https://developer.nvidia.com/nvidia-visual-profiler
- bandwidthTest

### References
- https://www.cs.cmu.edu/afs/cs/academic/class/15668-s11/www/cuda-doc/
- rules_cuda: https://github.com/bazel-contrib/rules_cuda