#!/usr/bin/env python
import roslib; roslib.load_manifest('wombot_teleop')
import rospy


from art_msgs.msg import SteeringCommand
from art_msgs.msg import ThrottleCommand
from art_msgs.msg import BrakeCommand
from sensor_msgs.msg import Joy
from wombot_msgs.msg import WombotVehicle
from wombot_msgs.msg import DrivetrainCommand 


class JoyTeleop(object):
    def __init__(self):
        rospy.init_node('joy_teleop')
        rospy.Subscriber("joy",Joy, self._JoyCallback)
        self.throttle_publisher = rospy.Publisher("throttle/cmd",ThrottleCommand)
        
        rospy.loginfo("Starting")
        
        self._throttle_calib_axis = 1
        
        self.last_throttle_position = 1.0;


    # clamp value to within given values
    def _Clamp(self,value,minimum,maximum):
        return min(maximum,max(minimum,value))

    def _JoyCallback(self,joyMessage):


        #Throttle
        # The signal from the Xbox goes from 1 being released to -1 being fully depressed
        # We need to adjust the range to 0.0-1.0 and invert to get the throttle position
        # of 0 = Off and 1 = Full
        position = joyMessage.axes[self._throttle_calib_axis]
        if position >= -0.06 and position <= 0.05:
            position = 0.0
            
        if position != self.last_throttle_position:
            rospy.loginfo("Publishing throttle position: "+str(position))
            cmd = ThrottleCommand()
            cmd.request = ThrottleCommand.Absolute
            cmd.position = position
            self.throttle_publisher.publish(cmd)
            self.last_throttle_position = position


            
#Init and run
if __name__ == '__main__':
    joy_teleop = JoyTeleop()
    rospy.spin()
