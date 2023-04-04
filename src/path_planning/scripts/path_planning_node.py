#!/usr/bin/env python3 
import time
import rospy
import math
import serial
import Adafruit_BBIO.UART as UART

from nav_msgs.msg import Path
from geometry_msgs.msg import PoseStamped
from std_msgs.msg import Float64
from localization.msg import Instructions


    #UART setup 
UART.setup("UART5")
serial = serial.Serial(port = '/dev/ttyO5', baudrate = 9600 )

list_of_waypoints = []

compass_readings = [0,0,0,0,0,0,0,0,0,0] 
compass = 0

gps_current = (0,0)

instructions = []

count = 0

def handle_compass(msg):
    global compass
    global count
    compass =  msg.data
    compass_readings[count] = compass
    count = count + 1
    count = count % 10

def handle_path(msg):
    global list_of_waypoints
    for pose in msg.poses:
        list_of_waypoints.append((pose.pose.position.x, pose.pose.position.y))

def handle_robot_pose(msg):
    global gps_current
    gps_current = (msg.pose.position.x, msg.pose.position.y)
    
def handle_instructions(msg):
    global instructions
    instructions = msg.instructions
    time.sleep(10)
    print(list_of_waypoints)
    movement(instructions)

def move(v, w):
    command = '!'+ v + '@' + w + '#'
    serial.write(command.encode('utf-8'))

#from gps_mapping_demo import list_of_waypoints
#Given a list of waypoints (x,y cordinates (x, north, y is west)), also have orientation and location of robot (at all times). Move to each next coordinate till end location.
def angledif(point1, point2):
    #angle between two points
    x1, y1 = point1
    x2, y2 = point2
    angle = math.atan2(y2 - y1, x2 - x1) * 180 / math.pi
    return angle
    
def distancedif(point1, point2):
    #distance between x and y
    x1, y1 = point1
    x2, y2 = point2
    return math.sqrt((x2 - x1)**2 + (y2 - y1)**2)

def movement(instructions):
    for i in instructions:
        #current_orientation = -1 * compass
        target_angle = angledif(list_of_waypoints[i.from_index], list_of_waypoints[i.to_index])
        angledifference = target_angle + sum(compass_readings)/len(compass_readings) 
        #angledifference = target_angle + compass
        
        while angledifference < -2 or angledifference > 2:
            
            print("angle diff:", angledifference)
            #print("compass:", compass)
            print("avg compass:", sum(compass_readings)/len(compass_readings))
            
            if angledifference < 0:
                move("0","0.2" ) #turn right ()

            else:
                move("0", "-0.2") #turn left ()
                
            while count != 0:
                continue
            angledifference = target_angle + sum(compass_readings)/len(compass_readings)      
            
            #angledifference = target_angle + compass      
            move("0","0")#stop()
        distance_to_go = distancedif(gps_current, list_of_waypoints[i.to_index])
        #if gps_current is in list of waypoints..
        while distance_to_go > 0.1:
            print("distance to go:", distance_to_go)
            move("0.2", "0") #move forward ()
            #think of sleep 
            distance_to_go = distancedif(gps_current, list_of_waypoints[i.to_index])
        move("0","0")#stop()


if __name__ == "__main__":
    rospy.init_node("motion_commands")
    rospy.Subscriber("path", Path, handle_path)
    rospy.Subscriber("robot_pose", PoseStamped, handle_robot_pose)
    rospy.Subscriber("compass", Float64, handle_compass)
    rospy.Subscriber("instructions", Instructions, handle_instructions)
   
    rospy.spin()
