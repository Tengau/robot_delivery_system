import rospy
from sensor_msgs.msg import LaserScan

# double check how fast the lidar collects data
# try to collect only a portion of the rotation


# angle_min
# angle_max
# angle_increment
# time_increment
# scan_time
# range_min
# range_max
# ranges
# intensities



def callback(data):
    # print out time taken to send data
    print("received data:")
    for i in range(len(data.ranges)):
        print(i, ": ", data.ranges[i], data.intensities[i])


def listener():
    rospy.init_node('perception_node', anonymous=True)

    rospy.Subscriber("scan", LaserScan, callback)

    rospy.spin()

if __name__ == '__main__':
    listener()
