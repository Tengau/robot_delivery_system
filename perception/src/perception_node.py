import rospy
from sensor_msgs.msg import LaserScan

def callback(data):
    print("received data")


def listener():
    rospy.init_node('perception_node', anonymous=True)

    rospy.Subscriber("scan", LaserScan, callback)

    rospy.spin()

if __name__ == '__main__':
    listener()
