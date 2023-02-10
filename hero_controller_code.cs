using CTRE.Phoenix;
using CTRE.Phoenix.Controller;
using CTRE.Phoenix.MotorControl;
using CTRE.Phoenix.MotorControl.CAN;
using Microsoft.SPOT;
using System;
using System.IO.Ports;
using System.Text;
using System.Threading;

namespace HERO_Arcade_Drive_Example3
{
    public class Program
    {
        /* create a talon */
        static TalonSRX rightSlave = new TalonSRX(4);
        static TalonSRX right = new TalonSRX(3);
        static TalonSRX leftSlave = new TalonSRX(2);
        static TalonSRX left = new TalonSRX(1);

        static StringBuilder stringBuilder = new StringBuilder();

        static CTRE.Phoenix.Controller.GameController _gamepad = null;

        
        public static void Main()
        {

            SerialPort _uart = new SerialPort(CTRE.HERO.IO.Port1.UART, 9600);
            byte[] data = new byte[32];
            _uart.Open();

            string angular_velocity_string = null;
            string linear_velocity = null;

            bool is_still_reading = false;

            int bytesReceived;
            while (true)
            {
                stringBuilder.Append("waiting to read...");
                Debug.Print(stringBuilder.ToString());
                stringBuilder.Clear();
                
                bytesReceived = _uart.Read(data, 0, data.Length);
          
                if (bytesReceived > 0)
                {

                    stringBuilder.Append("received ");
                    stringBuilder.Append(bytesReceived);
                    stringBuilder.Append(" characters");
                    Debug.Print(stringBuilder.ToString());
                    stringBuilder.Clear();

                    for (int i = 0; i < bytesReceived; i++)
                    {
                        if (data[i] == '$')
                        {
                            is_still_reading = true;
                        } 
                        else if (data[i] == '^')
                        {
                            is_still_reading = false;
                            try
                            {
                                float angular_velocity = (float)Convert.ToDouble(angular_velocity_string);
                                angular_velocity_string = null;

                                stringBuilder.Append(angular_velocity);
                                Debug.Print(stringBuilder.ToString());
                                stringBuilder.Clear();

                            }
                            catch (System.Exception e)
                            {
                                stringBuilder.Append("an exception occured");
                                Debug.Print(stringBuilder.ToString());
                                stringBuilder.Clear();
                            }
                        } 
                        else if (is_still_reading)
                        {
                            stringBuilder.Append("got character: ");
                            stringBuilder.Append(Convert.ToChar(data[i]));
                            Debug.Print(stringBuilder.ToString());
                            stringBuilder.Clear();

                            angular_velocity_string += Convert.ToChar(data[i]);
                        }
                    }

                }
                else
                {
                    stringBuilder.Append("no data received...");
                    Debug.Print(stringBuilder.ToString());
                    stringBuilder.Clear();
                } 
                Thread.Sleep(20);
            }
            /*
            // loop forever
            while (true)
            {
                // drive robot using gamepad
                Drive();
                // print whatever is in our string builder 
                Debug.Print(stringBuilder.ToString());
                stringBuilder.Clear();
                // feed watchdog to keep Talon's enabled 
                CTRE.Phoenix.Watchdog.Feed();
                // run this task every 20ms
                Thread.Sleep(20);
            }*/
        }
        /**
         * If value is within 10% of center, clear it.
         * @param value [out] floating point value to deadband.
         */
        static void Deadband(ref float value)
        {
            if (value < -0.10)
            {
                /* outside of deadband */
            }
            else if (value > +0.10)
            {
                /* outside of deadband */
            }
            else
            {
                /* within 10% so zero it */
                value = 0;
            }
        }
        static void Drive()
        {
            if (null == _gamepad)
                _gamepad = new GameController(UsbHostDevice.GetInstance());

            float x = _gamepad.GetAxis(0);
            float y = -1 * _gamepad.GetAxis(1);
            float twist = _gamepad.GetAxis(2);

            Deadband(ref x);
            Deadband(ref y);
            Deadband(ref twist);

            float leftThrot = y + twist;
            float rightThrot = y - twist;

            left.Set(ControlMode.PercentOutput, leftThrot);
            leftSlave.Set(ControlMode.PercentOutput, leftThrot);
            right.Set(ControlMode.PercentOutput, -rightThrot);
            rightSlave.Set(ControlMode.PercentOutput, -rightThrot);

            stringBuilder.Append("\t");
            stringBuilder.Append(x);
            stringBuilder.Append("\t");
            stringBuilder.Append(y);
            stringBuilder.Append("\t");
            stringBuilder.Append(twist);

        }
    }
