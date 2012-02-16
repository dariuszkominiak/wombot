# Wombot steering controller

# copied from art steering command but changed to Radians as per ROS std

Header header

# Request type
uint32 Radians = 0	# Set absolute angle in radians +left 0 center -right
uint32 Relative = 1	# change angle relative to current setting

uint32 request	# request type
float32 angle	# request angle
