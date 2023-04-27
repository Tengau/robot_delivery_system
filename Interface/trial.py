'''A function that login to a server and execute a set of instructions'''

import subprocess
import time


def direction(destination):
    #new_terminal_cmd = 'osascript -e \'tell application "Terminal" to do script ""\'' #Macs terminal
    #new_terminal_cmd = 'wt.exe new-tab' #for windows terminal

    login_cmd = 'sshpass -p temppwd ssh debian@192.168.8.1'
    beaglebone_roslaunch_cmd = 'cd robot_delivery_system && source devel_isolated/setup.bash && export ROS_IP=192.168.8.1 && rosnode kill -a && roslaunch executive beaglebone.launch destination:=' + destination
    computer_roslaunch_cmd = 'cd ..; source devel/setup.bash; export ROS_IP=192.168.8.10; rosnode kill -a; export ROS_MASTER_URI=http://192.168.8.1:11311/; roslaunch executive computer.launch'
    

    #run = "roslaunch navigation navigation.launch"
    #subprocess.call(new_terminal_cmd, shell=True)
    
    subprocess.call(login_cmd + ' \'' + beaglebone_roslaunch_cmd + '\'', shell=True)

'''
    #subprocess.call(login_cmd + ' \'' + roscore_cmd + '\'', shell=True)
    cmd_1 = login_cmd  + '\'' + beaglebone_roslaunch_cmd + '\''
    cmd_2 = ['sleep 10', 'python3 b.py']
    cmd_2 = "python3 paterne; exec bash"
    t1 = subprocess.Popen(['gnome-terminal -- bash -c "' + login_cmd + beaglebone_roslaunch_cmd + '; exec bash"'], shell=True)
    #t2 = subprocess.call(computer_roslaunch_cmd + '\'', shell=True)
    t2 = subprocess.Popen(['gnome-terminal -- bash -c "' + computer_roslaunch_cmd + '; exec bash"'], shell=True)

    t1.wait()
    t2.wait()
''' 
direction("4")

