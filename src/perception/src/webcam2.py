import cv2
import time
import numpy as np

def main():
    # define a video capture object
    vid = cv2.VideoCapture(0)
    print("videoCapture defined")
    while(True):
        # Capture the video frame
        # by frame
        ret, frame = vid.read()
        printf("camera data read")
        #frame = detect_obstacles(frame)
        
        frame = detect_pedestrian_lane(frame)
        print("lane detection done")
        #frame = detect_obstacles(frame)
        #print("obstacle detection done")
        # Display the resulting frame
        # cv2.imshow('frame', frame)
        
        
        # the 'q' button is set as the
        # quitting button you may use any
        # desired button of your choice
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break
        # time.sleep(0.1)
    
    # After the loop release the cap object
    vid.release()
    # Destroy all the windows
    cv2.destroyAllWindows()
    
    
def region_of_interest(img, vertices):
    mask = np.zeros_like(img)
    
    match_mask_color = 255
    
    cv2.fillPoly(mask, vertices, match_mask_color)
    #masked_image = cv2.bitwise_and(img, mask)
    return mask

def detect_pedestrian_lane(image):
    height = image.shape[0]
    width = image.shape[1]
    
    hsv = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)
    
    # cloudy day, no shadows:
    #lower_pavement = np.array([0, 0, 160])
    #upper_pavement = np.array([90, 40, 210])
    
    # sunny day, minimal shadows:
    lower_pavement = np.array([0, 9, 60])
    upper_pavement = np.array([45, 30, 255])

    mask = cv2.inRange(hsv, lower_pavement, upper_pavement)
    
    #define kernel size  
    kernel = np.ones((7,7),np.uint8)

    # Remove unnecessary noise from mask
    mask = cv2.morphologyEx(mask, cv2.MORPH_CLOSE, kernel)
    mask = cv2.morphologyEx(mask, cv2.MORPH_OPEN, kernel)
    
    # only the pavement:
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
   # print("points lane: ", pts)
    #output = cv2.fillPoly(image, [pts.astype(int)], (0,0,255))
    output = cv2.rectangle(image, (x,y), (x+w, y+h), (0, 255, 0), 2)
    #print(contours)
    
    pts2 = np.float32([[0,0],[width,0],[0,height],[width,height]])
    M = cv2.getPerspectiveTransform(pts,pts2)
    dst = cv2.warpPerspective(image,M,(width,height))

    
    '''
    height = image.shape[0]
    width = image.shape[1]
    region_of_interest_vertices = [
        (0, height),
        (width/2, height/4),
        (width, height),
    ]
    
    mask_triangle = region_of_interest( image, np.array([region_of_interest_vertices], np.int32),)

    masked_image = cv2.bitwise_and(output, mask_triangle)
    #blur = cv2.GaussianBlur(gray, (5, 5), 0)
    #edges = cv2.Canny(blur, 50, 100)
    '''
    return output

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

if __name__ == '__main__':
    main()
