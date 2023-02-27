# import the opencv library
import cv2
import time
import numpy as np
  
def main():
    # define a video capture object
    vid = cv2.VideoCapture(0)
    
    while(True):
        # while not rospy.is_shutdown():
        
        # Capture the video frame
        # by frame
        ret, frame = vid.read()

        #frame = detect_obstacles(frame)
        frame = detect_pedestrian_lane(frame)
        frame = detect_obstacles(frame)
    
        # Display the resulting frame
        cv2.imshow('frame', frame)
        
        
        # the 'q' button is set as the
        # quitting button you may use any
        # desired button of your choice
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break
        time.sleep(1)
    
    # After the loop release the cap object
    vid.release()
    # Destroy all the windows
    cv2.destroyAllWindows()

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
            #cv2.putText(image, "Obstacle", (approx[0][0][0], approx[0][0][1]), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 255), 2)
            print("Obstacle detected!")
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

main()