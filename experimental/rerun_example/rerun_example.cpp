#include <rerun.hpp>
#include <rerun/demo_utils.hpp>

#include "glog/logging.h"

using rerun::demo::grid3d;

int main() {
  LOG(INFO) << "Start a rerun example";
  auto rec = rerun::RecordingStream("rerun_example_cpp");

  rerun::spawn().exit_on_failure();

  // Create some data using the `grid` utility function.
  std::vector<rerun::Position3D> points =
      grid3d<rerun::Position3D, float>(-10.f, 10.f, 10);
  std::vector<rerun::Color> colors = grid3d<rerun::Color, uint8_t>(0, 255, 10);

  // Log the "my_points" entity with our data, using the `Points3D` archetype.
  rec.log("my_points",
          rerun::Points3D(points).with_colors(colors).with_radii({0.5f}));

  rec.save("example.rrd").exit_on_failure();
  return 0;
}
