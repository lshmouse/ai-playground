#include <iostream>
#include <string>

#include "glog/logging.h"

#include "experimental/protoc_example/example.pb.h"

int main(int argc, char** argv) {
  Address address;
  address.set_city("Beijing");
  address.set_zip_code(110000);
  LOG(INFO) << "Address: " << address.ShortDebugString();
  return 0;
}