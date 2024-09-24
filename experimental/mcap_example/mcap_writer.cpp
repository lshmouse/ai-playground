// Copyright 2023 AI-Playground
#define MCAP_IMPLEMENTATION  // Define this in exactly one .cpp file
#include <chrono> // NOLINT [build/c++11]
#include <cstring>
#include <iostream>

#include "gflags/gflags.h"
#include "glog/logging.h"
#include "mcap/errors.hpp"
#include "mcap/writer.hpp"

DEFINE_string(mcap_filename, "./example-001.mcap",
              "The file name of the mcap file");

// Returns the system time in nanoseconds. std::chrono is used here, but any
// high resolution clock API (such as clock_gettime) can be used.
mcap::Timestamp now() {
  return mcap::Timestamp(
      std::chrono::duration_cast<std::chrono::nanoseconds>(
          std::chrono::system_clock::now().time_since_epoch())
          .count());
}

int main(int argc, char** argv) {
  // Initialize an MCAP writer with the "ros1" profile and write the file header
  mcap::McapWriter writer;
  auto status =
      writer.open(FLAGS_mcap_filename, mcap::McapWriterOptions("ros1"));
  if (!status.ok()) {
    std::cerr << "Failed to open MCAP file for writing: " << status.message
              << "\n";
    return 1;
  }

  // Register a Schema
  mcap::Schema std_msgs_string("std_msgs/String", "ros1msg", "string data");
  writer.addSchema(std_msgs_string);

  // Register a Channel
  mcap::Channel chatter_publisher("/chatter", "ros1", std_msgs_string.id);
  writer.addChannel(chatter_publisher);

  // Create a message payload. This would typically be done by your own
  // serialiation library. In this example, we manually create ROS1 binary data
  std::array<std::byte, 4 + 13> payload;
  const uint32_t length = 13;
  std::memcpy(payload.data(), &length, 4);
  std::memcpy(payload.data() + 4, "Hello, world!", 13);

  // Write our message
  mcap::Message msg;
  msg.channelId = chatter_publisher.id;
  msg.sequence = 1;               // Optional
  msg.logTime = now();            // Required nanosecond timestamp
  msg.publishTime = msg.logTime;  // Set to logTime if not available
  msg.data = payload.data();
  msg.dataSize = payload.size();
  mcap::Status s = writer.write(msg);
  if (!s.ok()) {
    return 1;
  }
  // Finish writing the file
  writer.close();
}
