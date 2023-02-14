# Import the necessary libraries
import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import cv2
import numpy as np

# Initialize the node and the image publisher
rospy.init_node('webcam_image_capture')
image_pub = rospy.Publisher('webcam_image', Image, queue_size=1)

# Create a CvBridge object for converting ROS messages to OpenCV images
bridge = CvBridge()

# Open a connection to the webcam
camera = cv2.VideoCapture(0)

# Set the webcam resolution
camera.set(3, 1920)
camera.set(4, 1080)


def detect_stairs(image):
    # Convert the image to grayscale
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    # Apply edge detection
    edges = cv2.Canny(gray, 50, 150)
    # Find contours in the image
    contours, _ = cv2.findContours(edges, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

    # Iterate over the contours
    for cnt in contours:
        # Approximate the contour with a polygon
        approx = cv2.approxPolyDP(cnt, 0.01*cv2.arcLength(cnt, True), True)
        # If the polygon has 4 sides, it is likely a stair
        if len(approx) == 4:
            cv2.drawContours(image, [approx], 0, (0, 255, 0), 2)
            cv2.putText(image, "Stair", (approx[0][0][0], approx[0][0][1]), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 255), 2)
            print("Stair detected!")
    return image

def detect_pedestrian_lane(image):
    # Convert the image to grayscale
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    # Apply Gaussian blur to reduce noise
    blur = cv2.GaussianBlur(gray, (5, 5), 0)
    # Apply Canny edge detection
    edges = cv2.Canny(blur, 50, 150)
    # Find lines in the image using HoughLinesP
    lines = cv2.HoughLinesP(edges, 1, np.pi/180, 100, minLineLength=20, maxLineGap=30)
    if lines is not None:
        for line in lines:
            x1, y1, x2, y2 = line[0]
            # Draw the line on the image
            cv2.line(image, (x1, y1), (x2, y2), (0, 255, 0), 2)
            print("Pedestrian lane detected!")
    return image

# function to detect obstacles in the image
def detect_obstacles(image):
    # Convert the image to grayscale
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    # Apply Gaussian blur to reduce noise
    blur = cv2.GaussianBlur(gray, (5, 5), 0)
    # Apply Canny edge detection
    edges = cv2.Canny(blur, 50, 150)
    # Find contours in the image
    contours, _ = cv2.findContours(edges, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    # Iterate over the contours
    for cnt in contours:
        # Approximate the contour with a polygon
        approx = cv2.approxPolyDP(cnt, 0.01*cv2.arcLength(cnt, True), True)
        # If the contour has more than 4 sides, it is likely an obstacle
        if len(approx) > 4:
            cv2.drawContours(image, [approx], 0, (0, 0, 255), 2)
            cv2.putText(image, "Obstacle", (approx[0][0][0], approx[0][0][1]), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 255), 2)
            print("Obstacle detected!")
    return image

while not rospy.is_shutdown():
    # Capture a frame from the webcam
    ret, frame = camera.read()

    # Process the image to detect stairs, pedestrian lane and obstacles
    #processed_image_stairs = detect_stairs(frame)
    #processed_image_lane = detect_pedestrian_lane(frame)
    #processed_image = detect_obstacles(frame)

    # Convert the frame to a ROS message
    try:
        print(type(frame))
        ros_image = bridge.cv2_to_imgmsg(frame, "bgr8")
    except CvBridgeError as e:
        print(e)
    # Publish the processed image
    image_pub.publish(ros_image)
    # Sleep for 1 second
    rospy.sleep(1.0)

# Release the webcam
camera.release()