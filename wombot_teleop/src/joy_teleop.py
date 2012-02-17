#!/usr/bin/env python
import roslib; roslib.load_manifest('wombot_teleop')
import rospy


from art_msgs.msg import SteeringCommand
from art_msgs.msg import ThrottleCommand
from sensor_msgs.msg import Joy
from wombot_msgs.msg import WombotVehicle
from wombot_msgs.msg import DrivetrainCommand 


class JoyTeleop(object):
    def __init__(self):
        rospy.init_node('joy_teleop')
        rospy.Subscriber("joy",Joy, self._JoyCallback)
        self.steering_publisher = rospy.Publisher("steering/cmd",SteeringCommand)
        self.throttle_publisher = rospy.Publisher("throttle/cmd",ThrottleCommand)
        self.drivetrain_publisher = rospy.Publisher("drivetrain/cmd",DrivetrainCommand)
        
        rospy.loginfo("Starting")
        
        self.steering_axis = 0
        self.throttle_axis = 5
        self.brake_axis = 2
        self.rear_diff_lock_button = 2
        self.front_diff_lock_button = 3
        self.gear_shift_button = 0
        
        self.last_angle = 0.0;
        self.last_throttle_position = 1.0;
        
        self._current_gear = DrivetrainCommand.LowRange
        self._fdiff_state = DrivetrainCommand.Unlock
        self._rdiff_state = DrivetrainCommand.Unlock

        self._last_gear_button_state = 0;
        self._last_fdiff_button_state = 0;
        self._last_rdiff_button_state = 0;


    def _JoyCallback(self,joyMessage):

        # Steering
        angle = WombotVehicle.max_steer_degrees * joyMessage.axes[self.steering_axis]
        if angle != self.last_angle:
            rospy.loginfo("Publishing angle: "+str(angle))
            cmd = SteeringCommand()
            cmd.request = SteeringCommand.Degrees
            cmd.angle = angle            
            self.steering_publisher.publish(cmd)
            self.last_angle = angle

        #Throttle
        # The signal from the xbox goes from 1 being released to -1 being fully depressed
        # We need to adjust the range to 0.0-1.0 and invert to get the throttle position
        # of 0 = Off and 1 = Full
        position = 1-((joyMessage.axes[self.throttle_axis] + 1.0)/2.0)
        if position != self.last_throttle_position:
            rospy.loginfo("Publishing position: "+str(position))
            cmd = ThrottleCommand()
            cmd.request = ThrottleCommand.Absolute
            cmd.position = position
            self.throttle_publisher.publish(cmd)
            self.last_throttle_position = position

        drivetrain_cmd = DrivetrainCommand()
        drivetrain_cmd.gear = DrivetrainCommand.NoChange
        drivetrain_cmd.front_diff = DrivetrainCommand.NoChange
        drivetrain_cmd.rear_diff = DrivetrainCommand.NoChange

        # Gear        
        if (joyMessage.buttons[self.gear_shift_button] == 1) and (self._last_gear_button_state == 0):
            if self._current_gear == DrivetrainCommand.LowRange:
                drivetrain_cmd.gear = DrivetrainCommand.HighRange
                self._current_gear = DrivetrainCommand.HighRange
            else:
                drivetrain_cmd.gear = DrivetrainCommand.LowRange
                self._current_gear = DrivetrainCommand.LowRange                

        self._last_gear_button_state = joyMessage.buttons[self.gear_shift_button]

        
        # Rear Diff        
        if (joyMessage.buttons[self.rear_diff_lock_button] == 1) and (self._last_rdiff_button_state == 0):

            if self._rdiff_state == DrivetrainCommand.Unlock:
                drivetrain_cmd.rear_diff = DrivetrainCommand.Lock
                self._rdiff_state = DrivetrainCommand.Lock
            else:
                drivetrain_cmd.rear_diff = DrivetrainCommand.Unlock
                self._rdiff_state = DrivetrainCommand.Unlock                

        self._last_rdiff_button_state = joyMessage.buttons[self.rear_diff_lock_button]
        
        # Front Diff        
        if (joyMessage.buttons[self.front_diff_lock_button] == 1) and (self._last_fdiff_button_state == 0):

            if self._fdiff_state == DrivetrainCommand.Unlock:
                drivetrain_cmd.front_diff = DrivetrainCommand.Lock
                self._fdiff_state = DrivetrainCommand.Lock
            else:
                drivetrain_cmd.front_diff = DrivetrainCommand.Unlock
                self._fdiff_state = DrivetrainCommand.Unlock                

        self._last_fdiff_button_state = joyMessage.buttons[self.front_diff_lock_button]
        
        if drivetrain_cmd.gear != DrivetrainCommand.NoChange or drivetrain_cmd.rear_diff != DrivetrainCommand.NoChange or drivetrain_cmd.front_diff != DrivetrainCommand.NoChange:
            rospy.loginfo("Drivetrain Command:- gear: "+str(drivetrain_cmd.gear)+", rdiff: "+str(drivetrain_cmd.rear_diff)+", fdiff: "+str(drivetrain_cmd.front_diff))
            self.drivetrain_publisher.publish(drivetrain_cmd)  
            
#Init and run
if __name__ == '__main__':
    joy_teleop = JoyTeleop()
    rospy.spin()
