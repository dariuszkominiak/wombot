FILE(REMOVE_RECURSE
  "../msg_gen"
  "../src/wombot_msgs/msg"
  "../msg_gen"
  "CMakeFiles/ROSBUILD_genmsg_py"
  "../src/wombot_msgs/msg/__init__.py"
  "../src/wombot_msgs/msg/_DrivetrainCommand.py"
  "../src/wombot_msgs/msg/_WombotVehicle.py"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
