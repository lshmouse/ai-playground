#include <cassert>
#include <cmath>
#include <cstdint>
#include <cstdio>
#include <vector>
// IWYU pragma: no_include <bits/std_abs.h>

#include "onnxruntime/onnxruntime_c_api.h"
#include "onnxruntime/onnxruntime_cxx_api.h"

int main(int argc, char* argv[]) {
  printf("Hello, world!\n");
  //*************************************************************************
  // initialize  enviroment...one enviroment per process
  // enviroment maintains thread pools and other state info
  Ort::Env env(ORT_LOGGING_LEVEL_WARNING, "test");

  // initialize session options if needed
  Ort::SessionOptions session_options;
  session_options.SetIntraOpNumThreads(1);

  // If onnxruntime.dll is built with CUDA enabled, we can uncomment out this
  // line to use CUDA for this session (we also need to include
  // cuda_provider_factory.h above which defines it) #include
  // "cuda_provider_factory.h"
  // OrtSessionOptionsAppendExecutionProvider_CUDA(session_options, 1);

  // Sets graph optimization level
  // Available levels are
  // ORT_DISABLE_ALL -> To disable all optimizations
  // ORT_ENABLE_BASIC -> To enable basic optimizations (Such as redundant node
  // removals) ORT_ENABLE_EXTENDED -> To enable extended optimizations (Includes
  // level 1 + more complex optimizations like node fusions) ORT_ENABLE_ALL ->
  // To Enable All possible opitmizations
  session_options.SetGraphOptimizationLevel(
      GraphOptimizationLevel::ORT_ENABLE_EXTENDED);

  //*************************************************************************
  // create session and load model into memory
  // using squeezenet version 1.3
  const char* model_path = "third_party/onnxruntime/f25_22.onnx";

  printf("Using Onnxruntime C++ API\n");
  Ort::Session session(env, model_path, session_options);

  //*************************************************************************
  // print model input layer (node names, types, shape etc.)
  Ort::AllocatorWithDefaultOptions allocator;

  // print number of model input nodes
  size_t num_input_nodes = session.GetInputCount();
  std::vector<const char*> input_node_names(num_input_nodes);
  std::vector<int64_t>
      input_node_dims;  // simplify... this model has only 1 input node {1, 3,
                        // 224, 224}. Otherwise need vector<vector<>>

  printf("Number of inputs = %zu\n", num_input_nodes);

  // iterate over all input nodes
  for (int i = 0; i < num_input_nodes; i++) {
    // print input node names
    char* input_name = session.GetInputName(i, allocator);
    printf("Input %d : name=%s\n", i, input_name);
    input_node_names[i] = input_name;

    // print input node types
    Ort::TypeInfo type_info = session.GetInputTypeInfo(i);
    auto tensor_info = type_info.GetTensorTypeAndShapeInfo();

    ONNXTensorElementDataType type = tensor_info.GetElementType();
    printf("Input %d : type=%d\n", i, type);

    // print input shapes/dims
    input_node_dims = tensor_info.GetShape();
    printf("Input %d : num_dims=%zu\n", i, input_node_dims.size());
    for (int j = 0; j < input_node_dims.size(); j++) {
      printf("Input %d : dim %d=%jd\n", i, j, input_node_dims[j]);
      input_node_dims[j] = std::abs(input_node_dims[j]);
    }
  }

  //
  // print number of model output nodes
  size_t num_output_nodes = session.GetOutputCount();
  std::vector<const char*> output_node_names(num_output_nodes);
  std::vector<int64_t>
      output_node_dims;  // simplify... this model has only 1 output node {1, 3,
                         // 224, 224}. Otherwise need vector<vector<>>

  printf("Number of outputs = %zu\n", num_output_nodes);

  // iterate over all output nodes
  for (int i = 0; i < num_output_nodes; i++) {
    // print output node names
    char* output_name = session.GetOutputName(i, allocator);
    printf("output %d : name=%s\n", i, output_name);
    output_node_names[i] = output_name;

    // print output node types
    Ort::TypeInfo type_info = session.GetOutputTypeInfo(i);
    auto tensor_info = type_info.GetTensorTypeAndShapeInfo();

    ONNXTensorElementDataType type = tensor_info.GetElementType();
    printf("output %d : type=%d\n", i, type);

    // print output shapes/dims
    output_node_dims = tensor_info.GetShape();
    printf("output %d : num_dims=%zu\n", i, output_node_dims.size());
    for (int j = 0; j < output_node_dims.size(); j++) {
      printf("output %d : dim %d=%jd\n", i, j, output_node_dims[j]);
    }
  }

  // Results should be...
  // Number of inputs = 1
  // Input 0 : name=image_point_39:0
  // Input 0 : type=1
  // Input 0 : num_dims=4
  // Input 0 : dim 0=-1
  // Input 0 : dim 1=128
  // Input 0 : dim 2=64
  // Input 0 : dim 3=10

  //*************************************************************************
  // Similar operations to get output node information.
  // Use OrtSessionGetOutputCount(), OrtSessionGetOutputName()
  // OrtSessionGetOutputTypeInfo() as shown above.

  //*************************************************************************
  // Score the model using sample data, and inspect values

  size_t input_tensor_size = 128 * 64 * 10;
  // simplify ... using known dim values to calculate size
  // use OrtGetTensorShapeElementCount() to get official size!

  //   std::vector<float> input_tensor_values(input_tensor_size);
  float* input_tensor_values = new float[input_tensor_size];
  //   std::vector<const char*> output_node_names = {"prob"};

  // initialize input data with values in [0.0, 1.0]
  for (unsigned int i = 0; i < input_tensor_size; i++) {
    input_tensor_values[i] = static_cast<float>(i / (input_tensor_size + 1));
  }

  // create input tensor object from data values
  auto memory_info =
      Ort::MemoryInfo::CreateCpu(OrtArenaAllocator, OrtMemTypeDefault);

  Ort::Value input_tensor = Ort::Value::CreateTensor<float>(
      memory_info, input_tensor_values, input_tensor_size,
      input_node_dims.data(), 4);
  assert(input_tensor.IsTensor());

  // score model & input tensor, get back output tensor
  //   printf("input_tensor_size: %d\n", input_tensor_size);
  auto output_tensors =
      session.Run(Ort::RunOptions{nullptr}, input_node_names.data(),
                  &input_tensor, 1, output_node_names.data(), 1);
  printf("output_tensors.size(): %zu\n", output_tensors.size());
  assert(output_tensors.size() == 1 && output_tensors.front().IsTensor());

  // Get pointer to output tensor float values
  float* floatarr = output_tensors.front().GetTensorMutableData<float>();
  assert(std::abs(floatarr[0] - 0.000045) < 1e-6);

  // score the model, and print scores for first 5 classes
  for (int i = 0; i < 2; i++) {
    printf("Score for class [%d] =  %f\n", i, floatarr[i]);
  }

  // Results should be as below...
  // Score for class [0] =  0.001610
  // Score for class [1] =  0.998390
  printf("Done!\n");
  return 0;
}
