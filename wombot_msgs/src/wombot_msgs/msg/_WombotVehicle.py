"""autogenerated by genmsg_py from WombotVehicle.msg. Do not edit."""
import roslib.message
import struct


class WombotVehicle(roslib.message.Message):
  _md5sum = "c20c5cfb6e2f3e9f2e675c3f745ad041"
  _type = "wombot_msgs/WombotVehicle"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """#  ART vehicle dimensions.
#  $Id: ArtVehicle.msg 1161 2011-03-26 02:10:49Z jack.oquin $

#  This class encapsulates constants for the dimensions of the ART
#  autonomous vehicle.  All units are meters or radians, except where
#  noted.  This is not a published message, it defines multi-language
#  constants.

# ROS frame ID
string frame_id = "vehicle"

float32 length = 0.55                   # overall length
float32 width = 0.44                    # overall width
float32 height = 0.3                    # overall height (TBD)
float32 halflength = 0.275                # length / 2
float32 halfwidth = 0.22                # width / 2
float32 halfheight = 0.15               # height / 2
float32 wheelbase = 0.41     	# wheelbase

# egocentric coordinates relative to vehicle origin at center of
# rear axle
float32 front_bumper_px = 0.47   	# (approximately)
float32 rear_bumper_px = -0.08           # front_bumper_px - length
float32 front_left_wheel_px = 0.41   # wheelbase
float32 front_left_wheel_py = 0.22       # halfwidth
float32 front_right_wheel_px = 0.41  # wheelbase
float32 front_right_wheel_py = -0.22    #-halfwidth
float32 rear_left_wheel_px = 0.0
float32 rear_left_wheel_py = 0.22       # halfwidth
float32 rear_right_wheel_px = 0.0
float32 rear_right_wheel_py = -0.22     #-halfwidth

# Player geometry, egocentric pose of robot base (the px really
# does need to be positive for some reason)
float32 geom_px = 0.195                   # front_bumper_px - halflength
float32 geom_py = 0.0
float32 geom_pa = 0.0

#float32 velodyne_px = 0.393             # (approximately)
#float32 velodyne_py = 0.278             # (approximately)
#float32 velodyne_pz = 2.4               # (calibrated)
#float32 velodyne_yaw=-0.0343           # (before remounting)
#float32 velodyne_yaw=-0.02155           # (approximately)
#float32 velodyne_pitch=0.016353735091186868 # (calculated)
#float32 velodyne_roll=0.0062133721370998124 # (calculated)

#float32 front_SICK_px = 3.178
#float32 front_SICK_py= 0.0		# (approximately)
#float32 front_SICK_pz = 0.941
#float32 front_SICK_roll = 0.0		# (approximately)
#float32 front_SICK_pitch = 0.0		# (approximately)
#float32 front_SICK_yaw = 0.027	        # (approximately)

#float32 rear_SICK_px = -1.140
#float32 rear_SICK_py = 0.0              # (approximately)
#float32 rear_SICK_pz = 0.943
#float32 rear_SICK_roll = 0.0		# (approximately)
#float32 rear_SICK_pitch = 0.0		# (approximately)
#float32 rear_SICK_yaw = 3.1415926535897931160  # (approximately PI)

#float32 right_front_camera_px = 0.52    # velodyne_px+0.127 (approx)
#float32 right_front_camera_py = 0.189   # velodyne_py-0.089 (approx)
#float32 right_front_camera_pz = 2.184   # velodyne_pz-0.216 (approx)
#float32 right_front_camera_yaw = -0.4974 # (approx -28.5 deg)
#float32 right_front_camera_pitch = 0.0  # (assumed)
#float32 right_front_camera_roll = 0.0   # (assumed)

#float32 left_front_camera_px = 0.52     # velodyne_px+0.127 (approx)
#float32 left_front_camera_py = 0.367    # velodyne_py+0.089 (approx)
#float32 left_front_camera_pz = 2.184    # velodyne_pz-0.216 (approx)
#float32 left_front_camera_yaw = 0.4974  # (approx +28.5 deg)
#float32 left_front_camera_pitch = 0.0   # (assumed)
#float32 left_front_camera_roll = 0.0    # (assumed)

# Compute vehicle turning radius.  This is the distance from the
# center of curvature to the vehicle origin in the middle of the
# rear axle.  The <art/steering.h> comments describe the steering
# geometry model.  Since max_steer_degrees is considerably less
# than 90 degrees, there is no problem taking its tangent.

float32 max_steer_degrees = 26.0        # maximum steering angle (degrees)
float32 max_steer_radians = 0.4537856   # maximum steering angle (radians)

# Due to limitations of the ROS message definition format, these
# values needed to be calculated by hand...

# ArtVehicle.wheelbase / math.tan(ArtVehicle.max_steer_radians)
float32 turn_radius = 0.829067763

# math.sqrt(math.pow(ArtVehicle.wheelbase,2)
#           + math.pow(ArtVehicle.turn_radius + ArtVehicle.halfwidth,2))
float32 front_outer_wheel_turn_radius = 1.510543171

# math.sqrt(math.pow(ArtVehicle.wheelbase,2)
#           + math.pow(ArtVehicle.turn_radius - ArtVehicle.halfwidth,2))
float32 front_inner_wheel_turn_radius = 0.78096354

# ArtVehicle.turn_radius + ArtVehicle.halfwidth
float32 rear_outer_wheel_turn_radius = 1.049067763

# ArtVehicle.turn_radius - ArtVehicle.halfwidth
float32 rear_inner_wheel_turn_radius = 0.609067763

# float32 front_outer_bumper_turn_radius = sqrtf(powf(front_bumper_px,2)+powf(turn_radius+halfwidth,2))
#  
# float32 front_inner_bumper_turn_radius = sqrtf(powf(front_bumper_px,2)+ powf(turn_radius-halfwidth,2))
#
# float32 rear_outer_bumper_turn_radius = sqrtf(powf(rear_bumper_px,2)+ powf(turn_radius+halfwidth,2))
#
# float32 rear_inner_bumper_turn_radius = sqrtf(powf(rear_bumper_px,2)+ powf(turn_radius-halfwidth,2))


"""
  # Pseudo-constants
  frame_id = r'"vehicle"'
  length = 0.55
  width = 0.44
  height = 0.3
  halflength = 0.275
  halfwidth = 0.22
  halfheight = 0.15
  wheelbase = 0.41
  front_bumper_px = 0.47
  rear_bumper_px = -0.08
  front_left_wheel_px = 0.41
  front_left_wheel_py = 0.22
  front_right_wheel_px = 0.41
  front_right_wheel_py = -0.22
  rear_left_wheel_px = 0.0
  rear_left_wheel_py = 0.22
  rear_right_wheel_px = 0.0
  rear_right_wheel_py = -0.22
  geom_px = 0.195
  geom_py = 0.0
  geom_pa = 0.0
  max_steer_degrees = 26.0
  max_steer_radians = 0.4537856
  turn_radius = 0.829067763
  front_outer_wheel_turn_radius = 1.510543171
  front_inner_wheel_turn_radius = 0.78096354
  rear_outer_wheel_turn_radius = 1.049067763
  rear_inner_wheel_turn_radius = 0.609067763

  __slots__ = []
  _slot_types = []

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.
    
    The available fields are:
       
    
    @param args: complete set of field values, in .msg order
    @param kwds: use keyword arguments corresponding to message field names
    to set specific fields. 
    """
    if args or kwds:
      super(WombotVehicle, self).__init__(*args, **kwds)

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    @param buff: buffer
    @type  buff: StringIO
    """
    try:
      pass
    except struct.error as se: self._check_types(se)
    except TypeError as te: self._check_types(te)

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    @param str: byte array of serialized message
    @type  str: str
    """
    try:
      end = 0
      return self
    except struct.error as e:
      raise roslib.message.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    @param buff: buffer
    @type  buff: StringIO
    @param numpy: numpy python module
    @type  numpy module
    """
    try:
      pass
    except struct.error as se: self._check_types(se)
    except TypeError as te: self._check_types(te)

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    @param str: byte array of serialized message
    @type  str: str
    @param numpy: numpy python module
    @type  numpy: module
    """
    try:
      end = 0
      return self
    except struct.error as e:
      raise roslib.message.DeserializationError(e) #most likely buffer underfill

_struct_I = roslib.message.struct_I
