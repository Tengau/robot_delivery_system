import serial
import Adafruit_BBIO.UART as UART

UART.setup('UART1')
GPS = serial.Serial("/dev/ttyO1", 9600)

while True:
    #while GPS.inWaiting()==0:
       # print("Waiting for Fix")
    NMEA = GPS.readline()
    print(NMEA)
    #NMEA_array = NMEA.split(",")
    #latitude = NMEA_array[2]
    #longitude = NMEA_array[3]


