import cv2
import time
import numpy as np
import rospy
from std_msgs.msg import String

# Initialize ROS node and publisher
rospy.init_node('image_processing', anonymous=True)
pub = rospy.Publisher('image_info', String, queue_size=10)

def main():
    # Define a video capture object
    vid = cv2.VideoCapture(r'D:\Academics\SPRING 2023\ECE349\Senior-design\test-videos\2.MOV')
    print("VideoCapture defined successfully.")

    while not rospy.is_shutdown():
        # Capture the video frame
        ret, frame = vid.read()
        print("********* 1. Camera data read successfully *************")
        print("********* 2. Lane detection in progress ... **********")
        lane_info = detect_pedestrian_lane(frame)
        print("********* Lane detection done... **********")
        print("********* 3. Obstacle detection in progress ... ********")
        obstacle_info = detect_obstacles(frame)
        print("********* Obstacle detection done ********")

        # Publish image information
        pub.publish(lane_info + "\n" + obstacle_info)

        # Spin once to allow ROS to process incoming messages
        rospy.spinOnce()

        # Display the resulting frame
        cv2.imshow('frame', frame)

        # The 'q' button is set as the quitting button you may use any
        # desired button of your choice
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

    # After the loop release the cap object
    vid.release()

    # Destroy all the windows
    cv2.destroyAllWindows()

def detect_pedestrian_lane(image, pub):
    hsv = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)

    # Define lower and upper bounds for the pavement
    lower_pavement = np.array([0, 9, 60])
    upper_pavement = np.array([45, 30, 255])

    mask = cv2.inRange(hsv, lower_pavement, upper_pavement)

    # Define kernel size  
    kernel = np.ones((7, 7), np.uint8)

    # Remove unnecessary noise from mask
    mask = cv2.morphologyEx(mask, cv2.MORPH_CLOSE, kernel)
    mask = cv2.morphologyEx(mask, cv2.MORPH_OPEN, kernel)

    # Only the pavement:
    segmented_image = cv2.bitwise_and(image, image, mask=mask)

    # Find contours from the mask
    contours, hierarchy = cv2.findContours(mask.copy(), cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    max_contour = []

    max_area = 0
    for contour in contours:
        current_area = cv2.contourArea(contour)
        if (current_area > max_area):
            max_area = current_area
            max = contour
            x, y, w, h = cv2.boundingRect(max)

    max_contour.append(max)
    output = cv2.drawContours(image, max_contour, 0, (255, 0, 0), 2)
    pts = np.float32([[x+w*.45, y+h*.01],[x + w *.55, y + h*.01],[x + w, y + h],[x, y + h]])

    # Draw rectangle around the lane
    output = cv2.rectangle(image, (x, y), (x+w, y+h), (0, 255, 0), 2)
    # Draw green lane
    # output = cv2.fillPoly(image, [pts.astype(int)], (0, 255, 0))

    # Publish a ROS message to a topic with the lane position
    pub.publish("Lane position: ({}, {})".format(x, y))

    """
    pts2 = np.float32([[0,0],[width,0],[0,height],[width,height]])
    M = cv2.getPerspectiveTransform(pts,pts2)
    dst = cv2.warpPerspective(image,M,(width,height))
    """
    return output

def region_of_interest(img, vertices):
    mask = np.zeros_like(img)
    match_mask_color = 255
    cv2.fillPoly(mask, vertices, match_mask_color)
    return mask

def detect_obstacles(image,min_area=1000):
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    
    # Define area of interest triangle/lane
    height = image.shape[0]
    width = image.shape[1]
    region_of_interest_vertices = [
        (0, height),
        (width/2, height/4),
        (width, height),
    ]
    
    mask_triangle = region_of_interest(gray, np.array([region_of_interest_vertices], np.int32))

    masked_image = cv2.bitwise_and(gray, mask_triangle)
    cv2.imshow("frame2", masked_image)

    blur = cv2.GaussianBlur(masked_image, (5, 5), 0)
    edges = cv2.Canny(blur, 50, 150)

    # Flip the image vertically
    # gray = cv2.flip(gray, 1)

    contours, _ = cv2.findContours(edges, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    for cnt in contours:
        # Approximate the contour with a polygon
        epsilon = 0.1*cv2.arcLength(cnt,True)
        approx = cv2.approxPolyDP(cnt,epsilon,True)        
        if len(approx) > 3 and cv2.contourArea(cnt) > min_area:
            x, y, w, h = cv2.boundingRect(cnt)
            cv2.rectangle(image, (x, y), (x+w, y+h), (0, 0, 255), 2)
            rospy.loginfo("*** Obstacle detected!")
            # If obstacles are detected, publish "STOP" message
            pub.publish("STOP")

        # Detect stairs and ignore small contours
        # Check if the polygon is a rectangle with 4 vertices
        if len(approx) == 4 and cv2.contourArea(cnt) > 1000:
            x, y, w, h = cv2.boundingRect(cnt)
            aspect_ratio = float(w)/h
            #print(aspect_ratio)
            # Check if the rectangle is roughly the size and shape of stairs
            if aspect_ratio > 2 and aspect_ratio < 7:
                cv2.rectangle(image, (x, y), (x+w, y+h), (0, 255, 255), 2)
                # If stairs are detected, publish "STOP : STAIRS" message
                rospy.loginfo("*** Stairs detected!")
                pub.publish("STOP : STAIRS")

        else:
            rospy.loginfo("*** No obstacle detected!")
            # If no obstacle is detected, publish "CLEAR" message
            pub.publish("CLEAR")
            # Write "CLEAR" on the frame
            cv2.putText(image, "CLEAR", (50, 50), cv2.FONT_HERSHEY_SIMPLEX, 2, (0, 255, 0), 2)
        
    return image

