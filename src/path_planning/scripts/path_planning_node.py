import rospy
import math

from nav_masgs.msg import Path
from geometry_msgs.msg import PoseStamped

list_of_waypoints = []
compass = 0
gps_current = 

instructions

def handle_path(msg):
    for msg.poses

def handle_robot_pose(msg):
    pass


#Given a list of waypoints (x,y cordinates (x, north, y is west)), also have orientation and location of robot (at all times). Move to each next coordinate till end location.
def angledif(point1, point2):
    #angle between two points
    x1, y1 = point1
    x2, y2 = point2
    angle = math.atan2(y2 - y1, x2 - x1)
    return angle
    
def distancedif(point1, point2):
    #distance between x and y
    x1, y1 = point1
    x2, y2 = point2
    return math.sqrt((x2 - x1)**2 + (y2 - y1)**2)

def move(instructions):
    for i in instructions:
        #current_orientation = -1 * compass
        target_angle = angledif(list_of_waypoints[i.from_index], list_of_waypoints[i.to_index])
        angledif = target_angle + compass
        while angledif != 0:
            if angledif < 0:
                turn right ()

            else:
                turn left ()
            angledif = target_angle + compass
        stop()
        distance_to_go = distancedif(gps_current, list_of_waypoints[i.from_index])
        #if gps_current is in list of waypoints..
        while distance_to_go != 0:
            move forward ()
            #think of sleep 
            distance_to_go = distancedif(gps_current, list_of_waypoints[i.from_index])
        stop()

if __name__ == "__main__":
    rospy.init_node("motion_commands")
    rospy.Subscriber("path", Path, handle_path)
    rospy.Subscriber("robot_pose", PoseStamped, handle_robot_pose)

    

    rospy.spin()
