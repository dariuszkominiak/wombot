#!/usr/bin/env python
import roslib; roslib.load_manifest('wombot_servo')
import rospy
import serial

from art_msgs.msg import SteeringCommand
from art_msgs.msg import SteeringState


class PololuDriver(object):
    def __init__(self):
        rospy.init_node('pololu_driver')
        rospy.on_shutdown(self.ShutdownCallback)
        rospy.Subscriber("steering/cmd",SteeringCommand, self.SteeringCallback)
        
        port = '/dev/ttyACM0'
        
        try:
            self.ser = serial.Serial(port)
            self.ser.open()
            self.ser.write(chr(0xAA))
            self.ser.flush()            
        except serial.serialutil.SerialException as e:
            rospy.logerr(rospy.get_name()+": Error opening or initialising port "+port)
            exit(1)
         
         
    def DegToTicks(self,degrees):
        #quick and dirty,   assume 30 is near-extent
        ticks = (max(-30,min(30,degrees))/30.0)*480
        return int(ticks + 1500)
        
      
    def run(self):
        rospy.spin()  
        
    def get_command(self, channel, target):
        target = target * 4
        serialBytes = chr(0x84)+chr(channel)+chr(target & 0x7F)+chr((target >> 7) & 0x7F)
        return serialBytes
    
    def ShutdownCallback(self):
    rospy.loginfo("Shutting down")
        if hasattr(self, 'ser'):
        self.ser.write(self.get_command(0,0))
        self.ser.write(self.get_command(1,0))
            self.ser.write(chr(0xA2))
            self.ser.close()
    
    def SteeringCallback(self,data):
    ticks = self.DegToTicks(data.angle)
        rospy.loginfo(rospy.get_name()+": Request Type="+str(data.request)+" Angle="+str(data.angle)+" Ticks="+str(ticks) )
    ticks = self.DegToTicks(data.angle)
        self.ser.write(self.get_command(0,ticks))
        self.ser.write(self.get_command(1,ticks))
        

        


#Init and run
PololuDriver().run()