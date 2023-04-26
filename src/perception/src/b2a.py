import serial
import rospy
from perception.msg import FloatArray
    
def main():
    # Specify the serial port and baud rate
    serial_port = '/dev/ttyACM0'
    baud_rate = 9600

    # Open the serial port
    ser = serial.Serial(serial_port, baud_rate)
    print("Ultrasounds are connected successfully...")

    # num_us = 1
    us_pub = rospy.Publisher('ultrasound_publisher', FloatArray)
    rospy.init_node('ultrasound_node', anonymous=True)
    r = rospy.Rate(10)


    while not rospy.is_shutdown():
        print("Ultrasound loop is running...")
        # Read the distance measurement from the Arduino
        distance = ser.readline().strip()
        distance = str(distance) # Make it a string
        distance = distance.split(": ")[1].split(", ")



        '''
        Ultrasound loop is running...
        ['20.00', "16.00'"] 
        '''


        #print(distance)

       
        distance[1] = distance[1][:-1]
        
#        print(distance)
        # Object is  ['0.00', ['0.00']]  cm away.

        distance2 = [float(distance[0]),float(distance[1])]

        # Print the distance measurement
        # Left US(Motor 4) - distance2[1], Right US(Motor 2) - distance2[0]
        #print("Object is ",distance2," cm away.")
    

        # Print the distance measurement
        print("Object is ",distance2," cm away.")
       
        # distance = Object is  b'Distances: 0.00, 0.00'  cm away.
        # for future array implementation:
        # for i in range(num_us):
        #    arr[i] = distance
        

        msg = FloatArray()
        msg.data = [distance2]
        us_pub.publish(msg)

        r.sleep() # Wait for the next cycle
    

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException: pass
