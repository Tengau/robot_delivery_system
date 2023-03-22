import cv2
import time
import numpy as np
import math

def main():
    # define a video capture object
    vid = cv2.VideoCapture(0)
    
    while(True):
        
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
        time.sleep(0)
    
    # After the loop release the cap object
    vid.release()
    # Destroy all the windows
    cv2.destroyAllWindows()

def detect_obstacles(image,min_area=500):
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    blur = cv2.GaussianBlur(gray, (5, 5), 0)
    edges = cv2.Canny(blur, 50, 150)
    contours, _ = cv2.findContours(edges, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    for cnt in contours:
        approx = cv2.approxPolyDP(cnt, 0.01*cv2.arcLength(cnt, True), True)
        if len(approx) > 3 and cv2.contourArea(cnt) > min_area:
            x, y, w, h = cv2.boundingRect(cnt)
            cv2.rectangle(image, (x, y), (x+w, y+h), (0, 0, 255), 2)
    return image

def region_of_interest(img, vertices):
    mask = np.zeros_like(img)
    
    match_mask_color = 255
    
    cv2.fillPoly(mask,vertices, match_mask_color)
    masked_image = cv2.bitwise_and(img, mask)
    return masked_image
    
    
def detect_pedestrian_lane(image):
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    blur = cv2.GaussianBlur(gray, (5, 5), 0)
    edges = cv2.Canny(blur, 50, 150)
    
    height = image.shape[0]
    width = image.shape[1]
    region_of_interest_vertices = [
        (0, height-200),
        (width/2, height/4),
        (width, height-200),
    ]
    
    cropped_image = region_of_interest(
        edges,
        np.array(
            [region_of_interest_vertices],
            np.int32
        ),
    )
    
    
    #lines = cv2.HoughLinesP(edges, rho=1, theta=np.pi/180, threshold=100, minLineLength=100, maxLineGap=50)
    lines = cv2.HoughLinesP(cropped_image, rho=1, theta=np.pi/180, threshold=100, minLineLength=10, maxLineGap=100)

    if lines is not None:
        for line in lines:
            x1, y1, x2, y2 = line[0]
            angle = math.degrees(math.atan2(y2-y1, x2-x1))
            #if angle < 40 and angle > 30:
            cv2.line(image, (x1, y1), (x2, y2), (0, 255, 0), 4)
            #elif angle > -40 and angle < -30:
             #   cv2.line(image, (x1, y1), (x2, y2), (0, 255, 0), 4)
    return image

'''
def grass_vs_road(image):
    # Convert image to HSV color space
    hsv = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)

    # Define range of grass color in HSV
    lower_grass = np.array([35, 50, 50])
    upper_grass = np.array([80, 255, 255])

    # Define range of road color in HSV
    lower_road = np.array([0, 0, 0])
    upper_road = np.array([180, 50, 50])

    # Threshold the HSV image to get binary masks for grass and road
    mask_grass = cv2.inRange(hsv, lower_grass, upper_grass)
    mask_road = cv2.inRange(hsv, lower_road, upper_road)

    # Apply morphology to remove noise
    kernel = np.ones((5, 5), np.uint8)
    mask_grass = cv2.morphologyEx(mask_grass, cv2.MORPH_OPEN, kernel)
    mask_road = cv2.morphologyEx(mask_road, cv2.MORPH_OPEN, kernel)

    # Calculate the percentage of grass and road in the image
    total_pixels = image.shape[0] * image.shape[1]
    grass_pixels = cv2.countNonZero(mask_grass)
    road_pixels = cv2.countNonZero(mask_road)
    grass_percent = grass_pixels / total_pixels * 100
    road_percent = road_pixels / total_pixels * 100

    # Determine which area (grass or road) has a higher percentage in the image
    if grass_percent > road_percent:
        return "grass"
    else:
        return "road"

def detect_road(image):
    # Convert the image to grayscale
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

    # Apply Gaussian blur to the grayscale image
    blur = cv2.GaussianBlur(gray, (5, 5), 0)

    # Apply Canny edge detection to the blurred image
    edges = cv2.Canny(blur, 50, 150)

    # Apply Hough transform to detect lines in the image
    lines = cv2.HoughLinesP(edges, rho=1, theta=np.pi/180, threshold=100, minLineLength=100, maxLineGap=50)

    # Create an empty mask with the same dimensions as the image
    mask = np.zeros_like(image)

    # Define the boundaries of the purple road boundary
    left_boundary = int(image.shape[1] * 0.4)
    right_boundary = int(image.shape[1] * 0.6)

    # Draw the purple boundary over the detected road
    if lines is not None:
        for line in lines:
            x1, y1, x2, y2 = line[0]
            if y1 > image.shape[0] * 0.6 and y2 > image.shape[0] * 0.6:
                if x1 > left_boundary and x1 < right_boundary:
                    cv2.line(mask, (x1, y1), (x2, y2), (255, 0, 255), 10)
                if x2 > left_boundary and x2 < right_boundary:
                    cv2.line(mask, (x1, y1), (x2, y2), (255, 0, 255), 10)

    # Apply a bitwise AND operation to the original image and the mask to keep the robot within the purple road boundary
    result = cv2.bitwise_and(image, mask)

    return result
'''



if __name__ == '__main__':
    main()
