import math
import numpy as np
import matplotlib.pyplot as plt
from math import cos, sin, radians, pi
import rospy
from sensor_msgs.msg import LaserScan

ang = []
dist = []

def bresenham(start, end):
    """
    Implementation of Bresenham's line drawing algorithm
    See en.wikipedia.org/wiki/Bresenham's_line_algorithm
    Bresenham's Line Algorithm
    Produces a np.array from start and end (original from roguebasin.com)
    >>> points1 = bresenham((4, 4), (6, 10))
    >>> print(points1)
    np.array([[4,4], [4,5], [5,6], [5,7], [5,8], [6,9], [6,10]])
    """
    # setup initial conditions
    x1, y1 = start
    x2, y2 = end
    dx = x2 - x1
    dy = y2 - y1
    is_steep = abs(dy) > abs(dx)  # determine how steep the line is
    if is_steep:  # rotate line
        x1, y1 = y1, x1
        x2, y2 = y2, x2
    # swap start and end points if necessary and store swap state
    swapped = False
    if x1 > x2:
        x1, x2 = x2, x1
        y1, y2 = y2, y1
        swapped = True
    dx = x2 - x1  # recalculate differentials
    dy = y2 - y1  # recalculate differentials
    error = int(dx / 2.0)  # calculate error
    y_step = 1 if y1 < y2 else -1
    # iterate over bounding box generating points between start and end
    y = y1
    points = []
    for x in range(x1, x2 + 1):
        coord = [y, x] if is_steep else (x, y)
        points.append(coord)
        error -= abs(dy)
        if error < 0:
            y += y_step
            error += dx
    if swapped:  # reverse the list if the coordinates were swapped
        points.reverse()
    points = np.array(points)
    return points



def callback(data):
    # print out time taken to send data
    print("received data:")
    
    for i in range(len(data.ranges)):
        print(i, ": ", data.ranges[i], data.intensities[i])
        if(data.ranges > 0 && data.intensities > 50 && data.ranges[i] < 10):
            ang.append(i)
            dist.append(data.ranges[i])

    ox = np.sin(ang) * dist
    oy = np.cos(ang) * dist
    plt.figure(figsize=(6,10))
    plt.plot([oy, np.zeros(np.size(oy))], [ox, np.zeros(np.size(oy))], "ro-") # lines from 0,0 to the
    plt.axis("equal")
    bottom, top = plt.ylim()  # return the current ylim
    plt.ylim((top, bottom)) # rescale y axis, to match the grid orientation
    plt.grid(True)
    cplt.show()




def listener():
    rospy.init_node('perception_node', anonymous=True)

    rospy.Subscriber("scan", LaserScan, callback)

    rospy.spin()

if __name__ == '__main__':
    listener()




