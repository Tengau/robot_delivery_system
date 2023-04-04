import serial

# Specify the serial port and baud rate
serial_port = '/dev/ttyACM0'
baud_rate = 9600

# Open the serial port
ser = serial.Serial(serial_port, baud_rate)

while True:
    # Read the distance measurement from the Arduino
    distance = ser.readline().strip()
    
    # Print the distance measurement
    print("Object is ",distance," cm away.")

        


