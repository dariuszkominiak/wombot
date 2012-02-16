#!/usr/bin/env python
import roslib; roslib.load_manifest('wombot_servo')
import rospy
from std_msgs.msg import String
from art_msgs.msg import SteeringCommand

def steering_test():
    pub = rospy.Publisher('steering/cmd', String)
    rospy.init_node('steering_test')
    
    cmd = SteeringCommand()
    while not rospy.is_shutdown():
        str = "hello world %s"%rospy.get_time()
        rospy.loginfo(str)
        pub.publish(String(str))
        rospy.sleep(1.0)
if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException: pass