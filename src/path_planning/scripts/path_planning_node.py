def callback(data):
    rospy.loginfo(rospy.get_caller_id() + "I heard %s", data.data)
    
def listener():

    # In ROS, nodes are uniquely named. If two nodes with the same
    # name are launched, the previous one is kicked off. The
    # anonymous=True flag means that rospy will choose a unique
    # name for our 'listener' node so that multiple listeners can
    # run simultaneously.
    rospy.init_node('listener', anonymous=True)

    rospy.Subscriber("chatter", String, callback)
import math
from gps_mapping_demo import list_of_waypoints
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
    rospy
