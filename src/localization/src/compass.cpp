/**
 * @file rc_project_template.c
 *
 * This is meant to be a skeleton program for Robot Control projects. Change
 * this description and file name before modifying for your own purpose.
 */

#include "ros/ros.h"
#include "std_msgs/Float64.h"

#include <stdio.h>
#include <robotcontrol.h> // includes ALL Robot Control subsystems

#include <rc/mpu.h>
#include <rc/time.h>
#include <signal.h>
#include <math.h>

#define I2C_BUS 2

int main(int argc, char **argv)
{
	ros::init(argc, argv, "talker");
	ros::NodeHandle n;

	ros::Publisher compass_publisher = n.advertise<std_msgs::Float64>("compass", 1000);

	rc_mpu_data_t data;

	rc_mpu_config_t conf = rc_mpu_default_config();
	conf.i2c_bus = I2C_BUS;
	conf.enable_magnetometer = 1;
	conf.show_warnings = 0;
	
	if (rc_mpu_initialize(&data,conf)) {
		printf("rc_mpu_initialize_failed\n");
		return -1;
	} 
	
	ros::Rate timer(10);
	while (ros::ok()) {
		if (rc_mpu_read_mag(&data))
			continue;
		
		double heading = atan2(data.mag[1],data.mag[0]) * 180 / M_PI;		
		//double heading = atan2(data.mag[1],data.mag[0]);		
		
		std_msgs::Float64 msg;
		msg.data = heading;
		compass_publisher.publish(msg);

		ros::spinOnce();
		timer.sleep();
	} rc_mpu_power_off();
	return 0;
}
