FILE(REMOVE_RECURSE
  "../msg_gen"
  "../src/wombot_msgs/msg"
  "../msg_gen"
  "CMakeFiles/ROSBUILD_genmsg_cpp"
  "../msg_gen/cpp/include/wombot_msgs/DrivetrainCommand.h"
  "../msg_gen/cpp/include/wombot_msgs/WombotVehicle.h"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_cpp.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
