'''A function that login to a server and execute a set of instructions'''

import subprocess


def direction(destination):
    #new_terminal_cmd = 'osascript -e \'tell application "Terminal" to do script ""\'' #Macs terminal
    #new_terminal_cmd = 'wt.exe new-tab' #for windows terminal
    #new_terminal_cmd = 'gnome-terminal'
    login_cmd = 'sshpass -p temppwd ssh debian@192.168.8.1' 
    #roscore_cmd = 'cd robot_delivery_system && source devel_isolated/setup.bash && export ROS_IP=192.168.8.1 && roscore'
    roslaunch_cmd = 'cd robot_delivery_system && source devel_isolated/setup.bash && export ROS_IP=192.168.8.1 && roslaunch executive beaglebone.launch destination:=' + destination
    #run = "roslaunch navigation navigation.launch"
    #subprocess.call(new_terminal_cmd, shell=True)
    #subprocess.call(login_cmd + ' \'' + roscore_cmd + '\'', shell=True)
    subprocess.call(login_cmd + ' \'' + roslaunch_cmd + '\'' , shell=True)


    

direction("1")

