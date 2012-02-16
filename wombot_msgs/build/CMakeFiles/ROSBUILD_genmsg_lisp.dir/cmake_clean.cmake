FILE(REMOVE_RECURSE
  "../msg_gen"
  "../src/wombot_msgs/msg"
  "../msg_gen"
  "CMakeFiles/ROSBUILD_genmsg_lisp"
  "../msg_gen/lisp/AckermannDriveStamped.lisp"
  "../msg_gen/lisp/_package.lisp"
  "../msg_gen/lisp/_package_AckermannDriveStamped.lisp"
  "../msg_gen/lisp/SteeringCommand.lisp"
  "../msg_gen/lisp/_package.lisp"
  "../msg_gen/lisp/_package_SteeringCommand.lisp"
  "../msg_gen/lisp/AckermannDrive.lisp"
  "../msg_gen/lisp/_package.lisp"
  "../msg_gen/lisp/_package_AckermannDrive.lisp"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_lisp.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
