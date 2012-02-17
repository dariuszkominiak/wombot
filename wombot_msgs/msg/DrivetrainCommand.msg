# Wombot driveline control message

# Used to select high range / low range and lock/unlock diffs

Header header		# Standard ROS message header

# Gears
uint8 NoChange = 0
uint8 LowRange = 1
uint8 HighRange = 2

# Diff
uint8 NoChange = 0
uint8 Unlock = 1
uint8 Lock = 2

uint8 gear		# requested gear number
uint8 front_diff	# request diff status
uint8 rear_diff		# requested diff status
