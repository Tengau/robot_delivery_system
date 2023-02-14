import rospy
import math
import numpy as np
import matplotlib.pyplot as plt

from nav_msgs import OccupancyGrid

# width, height, resolution, data


class OccupancyMap:
    """
    create and edit occupancy grid
    """
    def __init__(self, width, height, resolution, angles, distances):
        self.resolution = resolution
        self.width = width
        self.height = height
        angles = np.array(angles)
        distances = np.array(distances)

        occupancy_map = np.zeros((height, width))



    def setHeight(self, height):
        self.height = height

    def setWidth(self, width):
        self.width = width

    def setResolution(self, resolution):
        self.resolution = resolution
    
    def update(self, angles, distances):
        
        pass()
    
    def calculate

    def __str__(self):
        print("Data: ")
        for i in angles:
            print(angles[i], ": ", distances[i])
        
    width = 0
    height = 0
    resolution = 1

int main():
    












