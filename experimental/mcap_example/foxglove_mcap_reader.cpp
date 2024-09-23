// Copyright 2023 AI-Playground
#define MCAP_IMPLEMENTATION
#include <string.h>

#include "foxglove/PosesInFrame.pb.h"
#include "gflags/gflags.h"
#include "glog/logging.h"
#include "mcap/reader.hpp"

DEFINE_string(mcap_filename, "example-001.mcap",
              "The file name of the mcap file");

int main(int argc, char** argv) {
  mcap::McapReader reader;
  {
    const auto res = reader.open(FLAGS_mcap_filename);
    if (!res.ok()) {
      LOG(ERROR) << "Failed to open " << FLAGS_mcap_filename
                 << " for reading: " << res.message;
      return 1;
    }
  }

  auto message_view = reader.readMessages();
  for (auto it = message_view.begin(); it != message_view.end(); it++) {
    // skip messages that we can't use
    if ((it->schema->encoding != "protobuf") ||
        it->schema->name != "foxglove.PosesInFrame") {
      continue;
    }
    foxglove::PosesInFrame path;
    if (!path.ParseFromArray(static_cast<const void*>(it->message.data),
                             it->message.dataSize)) {
      LOG(ERROR) << "could not parse PosesInFrame";
      return 1;
    }
    LOG(INFO) << "Found message: " << path.ShortDebugString();
    // print out the message
  }

  reader.close();
}
