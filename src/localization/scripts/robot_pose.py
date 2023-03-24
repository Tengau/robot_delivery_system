#!/usr/bin/env python3

import rospy
from std_msgs.msg import Float64
from geometry_msgs.msg import Point
from geometry_msgs.msg import PoseStamped
from geometry_msgs.msg import Orientation
from localization.srv import *

x = 0
y = 0
theta = 0 

def handle_compass(msg):
    theta = msg.data

def handle_gps(msg):
    rospy.wait_for_service('gps_converter')
    gps_converter = rospy.ServiceProxy('gps_converter', GpsConverter)
    req = GpsConverterRequest()
    req.gps.x = msg.x
    req.gps.y = msg.y
    res = gps_converter(req)
    x = res.position.x
    y = res.position.y

def get_orientation(theta):
    pass

if __name__ == '__main__':
    rospy.init_node("robot_pose")
    rospy.Subscriber("compass", Float64, handle_compass)
    rospy.Subscriber("gps", Point, handle_gps)
    robot_pose_publisher = rospy.Publisher("robot_pose", PoseStamped, queue_size=10)

    rate = rospy.Rate(10) # 10hz
    while not rospy.is_shutdown():
        
        pose = PoseStamped()
        pose.header.stamp = rospy.get_rostime()
        pose.header.frame_id = "world"

        pose.pose.position.x = 0 # change this
        pose.pose.position.y = 0 # change this 

        pose.pose.orientation = get_orientation(theta)
        
        robot_pose_publisher.publish(pose)
        rate.sleep()
