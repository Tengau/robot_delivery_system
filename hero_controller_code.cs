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

            /*while (true)
            {
                if (null == _gamepad)
                    _gamepad = new GameController(UsbHostDevice.GetInstance());

                if (_gamepad.GetButton(5)) // manual control
                {
                    float v = -1 * _gamepad.GetAxis(1);
                    float w = _gamepad.GetAxis(2);
                    Drive(v, w);
                }
                else // automatic control
                {

                }
                // print whatever is in our string builder 
                Debug.Print(stringBuilder.ToString());
                stringBuilder.Clear();
                // feed watchdog to keep Talon's enabled 
                CTRE.Phoenix.Watchdog.Feed();
                // run this task every 20ms
                Thread.Sleep(20);
            }*/
                /*
                bool b1 = _gamepad.GetButton(1);
                bool b2 = _gamepad.GetButton(2);
                bool b3 = _gamepad.GetButton(3);
                bool b4 = _gamepad.GetButton(4);

                bool b5 = _gamepad.GetButton(5);
                bool b6 = _gamepad.GetButton(6);
                bool b7 = _gamepad.GetButton(7);
                bool b8 = _gamepad.GetButton(8);


                stringBuilder.Append("\t");
                stringBuilder.Append(b1);
                stringBuilder.Append("\t");
                stringBuilder.Append(b2);
                stringBuilder.Append("\t");
                stringBuilder.Append(b3);
                stringBuilder.Append("\t");
                stringBuilder.Append(b4);

                stringBuilder.Append("\t");
                stringBuilder.Append(b5);
                stringBuilder.Append("\t");
                stringBuilder.Append(b6);
                stringBuilder.Append("\t");
                stringBuilder.Append(b7);
                stringBuilder.Append("\t");
                stringBuilder.Append(b8);

                Debug.Print(stringBuilder.ToString());
                stringBuilder.Clear();
                Thread.Sleep(20); */
            

            SerialPort _uart = new SerialPort(CTRE.HERO.IO.Port1.UART, 9600);
            byte[] data = new byte[32];
            _uart.Open();

            string buffer = null;
            float v_uart = 0;
            float w_uart = 0;

            bool is_still_reading_v = false;
            bool is_still_reading_w = false;

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
                        if (data[i] == '!')
                        {
                            is_still_reading_v = true;
                        }
                        else if (data[i] == '@')
                        {
                            is_still_reading_v = false;
                            is_still_reading_w = true;
                            try
                            {
                                v_uart = (float)Convert.ToDouble(buffer);
                                buffer = null;

                                stringBuilder.Append(v_uart);
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
                        else if (data[i] == '#')
                        {
                            is_still_reading_w = false;
                            try
                            {
                                w_uart = (float)Convert.ToDouble(buffer);
                                buffer = null;

                                stringBuilder.Append(w_uart);
                                Debug.Print(stringBuilder.ToString());
                                stringBuilder.Clear();

                            }
                            catch (System.Exception e)
                            {
                                stringBuilder.Append("an exception occured");
                                Debug.Print(stringBuilder.ToString());
                                stringBuilder.Clear();
                            }
                            // we have read both value , lets check if manual or automatic control
                            if (null == _gamepad)
                                _gamepad = new GameController(UsbHostDevice.GetInstance());

                            if (_gamepad.GetButton(6)) // manual control
                            {
                                float dummy = -1 * _gamepad.GetAxis(0);
                                v_uart = -1 * _gamepad.GetAxis(1);
                                w_uart = _gamepad.GetAxis(2);
                            }
                            
                            Drive(v_uart, w_uart);
                            // print whatever is in our string builder 
                            Debug.Print(stringBuilder.ToString());
                            stringBuilder.Clear();
                            // feed watchdog to keep Talon's enabled 
                            CTRE.Phoenix.Watchdog.Feed();
                            // run this task every 20ms
                            Thread.Sleep(20);
                        }

                        else if (is_still_reading_v || is_still_reading_w)
                        {
                            stringBuilder.Append("got character: ");
                            stringBuilder.Append(Convert.ToChar(data[i]));
                            Debug.Print(stringBuilder.ToString());
                            stringBuilder.Clear();

                            buffer += Convert.ToChar(data[i]);
                        }
                    }

                }
                else
                {
                    stringBuilder.Append("no data received...");
                    Debug.Print(stringBuilder.ToString());
                    stringBuilder.Clear();
                }
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
        static void Drive(float v, float w)
        {
            float leftThrot = v + w;
            float rightThrot = v - w;

            left.Set(ControlMode.PercentOutput, leftThrot);
            leftSlave.Set(ControlMode.PercentOutput, leftThrot);
            right.Set(ControlMode.PercentOutput, -rightThrot);
            rightSlave.Set(ControlMode.PercentOutput, -rightThrot);

            stringBuilder.Append("\t");
            stringBuilder.Append(v);
            stringBuilder.Append("\t");
            stringBuilder.Append(w);

        }
        /*
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

        } */
    }
}
