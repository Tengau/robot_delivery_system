#!/usr/bin/env python3

# required for ros
import rospy
from geometry_msgs.msg import Point

# required for UART communication 
import serial
import Adafruit_BBIO.UART as UART

if __name__ == '__main__':
    
    # setting up the ros node
    rospy.init_node('gps_node')
    gps_publisher = rospy.Publisher('gps', Point, queue_size=10)
    
    # setting up UART5
    UART.setup('UART1')
    gps = serial.Serial('/dev/ttyO1', 9600)
    
    # setting up an infinite loop
    rate = rospy.Rate(10) # 10Hz
    while not rospy.is_shutdown():
        
        # reading the gps info
        data = gps.readline().decode().split(',')

        # creating the Point message to be published
        point = Point()
        if data[0] == '$GPGGA' and data[6] == '1':
            
            lat_sign = 1
            if data[3] == "S":
                lat_sign = -1
            
            lon_sign = 1
            if data[5] == "W":
                lon_sign = -1
            
            lat_deg = int(data[2][:2])
            lat_min = float(data[2][2:]) / 60
            
            lon_deg = int(data[4][:3])
            lon_min = float(data[4][3:]) / 60
            
            point.x =  lat_sign * (lat_deg + lat_min)
            point.y =  lon_sign * (lon_deg + lon_min)
        else:
            point.z = -1
        
        gps_publisher.publish(point)
        rate.sleep()

#while gps.inWaiting()==0:
    # print("Waiting for Fix")
