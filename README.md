# robot_delivery_system

This branch contains:
* the simulation package. Which contains:
  - (not yet) an rviz.launch file to launch RViz
  - (not yet) a python script to convert between (latitude,longitude) to (x,y)

The purpose of this branch is as follows:
* it contains a localization package 
  - which contains a gps.py script to publish the latitude and longitude from the gps-module
  - which contains a compass.cpp program to publish from the beaglebone blue's built-in compass

#### Hero controller code:
Please follow the [Hero Controller User Guide](https://store.ctr-electronics.com/content/user-manual/HERO%20User's%20Guide.pdf) for instructions on how to run the code on the Hero Controller board
