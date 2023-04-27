import serial
import rospy
from perception.msg import FloatArray
    
def main():
    # Specify the serial port and baud rate
    serial_port = '/dev/ttyACM0'
    baud_rate = 9600

    # Open the serial port
    ser = serial.Serial(serial_port, baud_rate)
    print("ultrasounds are connected...")

    # num_us = 1
    us_pub = rospy.Publisher('ultrasonic_info', FloatArray)
    rospy.init_node('ultrasonic_node', anonymous=True)
    r = rospy.Rate(10)


    while not rospy.is_shutdown():
        print("ultrasound loop is running...")
        # Read the distance measurement from the Arduino
        distance = ser.readline().strip()
        print(distance)
        distance = str(distance) # Make it a string
        distance = distance.split(": ")[1].split(", ")
        distance[1] = distance[:-1]
        
    
        # Object is  ['0.00', ['0.00']]  cm away.

        distance2 = [int(float(distance[0])),int(float(distance[1][0]))]

        # Print the distance measurement
        print("Object is ",distance2," cm away.")
        

        # Print the distance measurement
        # print("Object is ",distance," cm away.")
       
        # distance = Object is  b'Distances: 0.00, 0.00'  cm away.
        # for future array implementation:
        # for i in range(num_us):
        #    arr[i] = distance
        

        msg = FloatArray()
        msg.data = [distance]
        us_pub.publish(msg)

        r.sleep() # Wait for the next cycle
    

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException: pass
