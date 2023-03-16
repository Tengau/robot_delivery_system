#!/usr/bin/env python3

# required for ros
import rospy
from geometry_msgs.msg import Point

# required for UART communication 
import serial
import Adafruit_BBIO.UART as UART

if __name__ == '__main__':
    
    # setting up the ros node
    rospy.init_node('gps')
    gps_publisher = rospy.Publisher('gps', Point, queue_size=10)
    
    # setting up UART5
    UART.setup('UART5')
    gps = serial.Serial('/dev/ttyO5', 9600)
    
    # setting up an infinite loop
    rate = rospy.Rate(10) # 10Hz
    while not rospy.is_shutdown():
        
        # reading the gps info
        data = gps.readline().decode().split(',')

        # creating the Point message to be published
        point = Point()
        if data[0] == '$GPGGA' and data[6] == '1':
            point.x =  float(data[2])/100.0
            point.y =  float(data[4])/100.0
            gps_publisher.publish(point)
        rate.sleep()

#while gps.inWaiting()==0:
    # print("Waiting for Fix")
