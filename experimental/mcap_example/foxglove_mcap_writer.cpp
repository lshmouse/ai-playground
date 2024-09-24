// Copyright 2023 AI-Playground
// Example code for writing Protobuf messages to an MCAP file. This executable
// writes a sequence of foxglove.PointCloud messages to an MCAP which should
// show an expanding sphere when viewed in Foxglove Studio.
#define MCAP_IMPLEMENTATION
#include <chrono>  // NOLINT [build/c++11]
#include <cmath>
#include <fstream>
#include <iostream>
#include <queue>
#include <random>
#include <sstream>
#include <unordered_set>

#include "foxglove/PointCloud.pb.h"
#include "gflags/gflags.h"
#include "glog/logging.h"
#include "google/protobuf/descriptor.h"
#include "google/protobuf/descriptor.pb.h"
#include "mcap/writer.hpp"

#define NS_PER_MS 1000000
#define NS_PER_S 1000000000
#define POINTS_PER_CLOUD 1000
#define FIELDS_PER_POINT 3

DEFINE_string(mcap_filename, "example-001.mcap",
              "The file name of the mcap file");

// PointGenerator generates random points on a sphere.
class PointGenerator {
 private:
  std::mt19937 generator_;
  std::uniform_real_distribution<float> distribution_;

 public:
  explicit PointGenerator(uint32_t seed = 0)
      : generator_(seed), distribution_(0.0, 1.0) {}

  // next produces a random point on the unit sphere, scaled by `scale`.
  std::tuple<float, float, float> next(float scale) {
    float theta = 2 * M_PI * distribution_(generator_);
    float phi = acos(1.0 - (2.0 * distribution_(generator_)));
    float x = static_cast<float>((std::sin(phi) * std::cos(theta)) * scale);
    float y = static_cast<float>((std::sin(phi) * std::sin(theta)) * scale);
    float z = static_cast<float>(std::cos(phi) * scale);
    return {x, y, z};
  }
};

namespace foxglove {
google::protobuf::FileDescriptorSet BuildFileDescriptorSet(
    const google::protobuf::Descriptor* toplevel_descriptor) {
  google::protobuf::FileDescriptorSet fd_set;
  std::queue<const google::protobuf::FileDescriptor*> to_add;
  to_add.push(toplevel_descriptor->file());
  std::unordered_set<std::string> seen_dependencies;
  while (!to_add.empty()) {
    const google::protobuf::FileDescriptor* next = to_add.front();
    to_add.pop();
    next->CopyTo(fd_set.add_file());
    for (int i = 0; i < next->dependency_count(); ++i) {
      const auto& dep = next->dependency(i);
      if (seen_dependencies.find(dep->name()) == seen_dependencies.end()) {
        seen_dependencies.insert(dep->name());
        to_add.push(dep);
      }
    }
  }
  return fd_set;
}
}  // namespace foxglove

int main(int argc, char** argv) {
  mcap::McapWriter writer;
  {
    auto options = mcap::McapWriterOptions("");
    const auto res = writer.open(FLAGS_mcap_filename, options);
    if (!res.ok()) {
      LOG(ERROR) << "Failed to open " << FLAGS_mcap_filename
                 << " for writing: " << res.message;
      return 1;
    }
  }

  // Create a channel and schema for our messages.
  // A message's channel informs the reader on the topic those messages were
  // published on. A channel's schema informs the reader on how to interpret the
  // messages' content. MCAP follows a relational model, where:
  // * messages have a many-to-one relationship with channels (indicated by
  // their channel_id)
  // * channels have a many-to-one relationship with schemas (indicated by their
  // schema_id)
  mcap::ChannelId channel_id;
  {
    // protobuf schemas in MCAP are represented as a serialized
    // FileDescriptorSet. You can use the method in BuildFileDescriptorSet to
    // generate this at runtime, or generate them ahead of time with protoc:
    //   protoc --include_imports --descriptor_set_out=filename your_type.proto
    mcap::Schema schema(
        "foxglove.PointCloud", "protobuf",
        foxglove::BuildFileDescriptorSet(foxglove::PointCloud::descriptor())
            .SerializeAsString());
    writer.addSchema(schema);

    // choose an arbitrary topic name.
    mcap::Channel channel("pointcloud", "protobuf", schema.id);
    writer.addChannel(channel);
    channel_id = channel.id;
  }

  foxglove::PointCloud pcl;
  {
    // Describe the data layout to the consumer of the pointcloud. There are 3
    // single-precision float fields per point.
    pcl.set_point_stride(sizeof(float) * FIELDS_PER_POINT);
    const char* const field_names[] = {"x", "y", "z"};
    int field_offset = 0;
    for (const auto& name : field_names) {
      auto field = pcl.add_fields();
      field->set_name(name);
      field->set_offset(field_offset);
      field->set_type(foxglove::PackedElementField_NumericType_FLOAT32);
      field_offset += sizeof(float);
    }
    // Reserve enough space for all of our points.
    pcl.mutable_data()->append(
        POINTS_PER_CLOUD * FIELDS_PER_POINT * sizeof(float), '\0');

    // Position the pointcloud in 3D space. the "frame_id" identifies the
    // coordinate frame of this pointcloud, and the "pose" determines the
    // pointcloud's position relative to that coordinate frame's center. Here
    // there is only one coordinate frame, so any frame_id string can be used.
    pcl.set_frame_id("pointcloud");

    // Position the pointclouds in the center of their coordinate frame.
    auto* pose = pcl.mutable_pose();
    auto* position = pose->mutable_position();
    position->set_x(0);
    position->set_y(0);
    position->set_z(0);
    auto* orientation = pose->mutable_orientation();
    orientation->set_x(0);
    orientation->set_y(0);
    orientation->set_z(0);
    orientation->set_w(1);
  }

  mcap::Timestamp start_time =
      std::chrono::duration_cast<std::chrono::nanoseconds>(
          std::chrono::system_clock::now().time_since_epoch())
          .count();
  PointGenerator point_generator;
  // write 100 pointcloud messages into the output MCAP file.
  for (uint64_t frame_index = 0; frame_index < 100; ++frame_index) {
    // Space these frames 100ms apart in time.
    mcap::Timestamp cloud_time = start_time + (frame_index * 100 * NS_PER_MS);
    // Slightly increase the size of the cloud on every frame.
    float cloud_scale = 1.0 + (static_cast<float>(frame_index) / 50.0);

    auto timestamp = pcl.mutable_timestamp();
    timestamp->set_seconds(cloud_time / NS_PER_S);
    timestamp->set_nanos(cloud_time % NS_PER_S);

    // write 1000 points into each pointcloud message.
    size_t offset = 0;
    for (int point_index = 0; point_index < POINTS_PER_CLOUD; ++point_index) {
      auto [x, y, z] = point_generator.next(cloud_scale);
      char* data = pcl.mutable_data()->data();
      std::memcpy(&data[offset], reinterpret_cast<const char*>(&x), sizeof(x));
      offset += sizeof(x);
      std::memcpy(&data[offset], reinterpret_cast<const char*>(&y), sizeof(y));
      offset += sizeof(y);
      std::memcpy(&data[offset], reinterpret_cast<const char*>(&z), sizeof(z));
      offset += sizeof(z);
    }
    std::string serialized = pcl.SerializeAsString();
    // Include the pointcloud data in a message, then write it into the MCAP
    // file.
    mcap::Message msg;
    msg.channelId = channel_id;
    msg.sequence = frame_index;
    msg.publishTime = cloud_time;
    msg.logTime = cloud_time;
    msg.data = reinterpret_cast<const std::byte*>(serialized.data());
    msg.dataSize = serialized.size();
    const auto res = writer.write(msg);
    if (!res.ok()) {
      LOG(ERROR) << "Failed to write message: " << res.message << "\n";
      writer.terminate();
      writer.close();
      return 1;
    }
  }
  // Write the index and footer to the file, then close it.
  writer.close();
  LOG(INFO) << "wrote 100 pointcloud messages to " << FLAGS_mcap_filename
            << std::endl;
  return 0;
}
