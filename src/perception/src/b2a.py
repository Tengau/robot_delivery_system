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
    us_pub = rospy.Publisher('ultrasound_publisher', FloatArray)
    rospy.init_node('ultrasound_node', anonymous=True)
    r = rospy.Rate(0.2)

    while not rospy.is_shutdown():
        print("ultrasound loop is running...")
        # Read the distance measurement from the Arduino
        distance = ser.readline().strip()
        
        # Print the distance measurement
        print("Object is ",distance," cm away.")

        # for future array implementation:
        #for i in range(num_us):
        #    arr[i] = distance
        

        msg = FloatArray()
        msg.data = [distance]

        us_pub.publish(msg)
        r.sleep()

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException: pass