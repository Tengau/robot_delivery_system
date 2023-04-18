#include "ros/ros.h"
#include "geometry_msgs/Point.h"

#include <iostream>
#include <robotcontrol.h> // includes ALL Robot Control subsystems

#include <rc/encoder_eqep.h>
#include <rc/time.h>
#include <signal.h>
#include <math.h>

int main(int argc, char **argv)
{
	ros::init(argc, argv, "encoders");
	ros::NodeHandle n;

	ros::Publisher estimated_pose_publisher = n.advertise<geometry_msgs::Point>("estimated_pose", 1000);

	if (rc_encoder_eqep_init()){
		std::cout << "Failed to initialize encoders" << std::endl;
		return -1;
	}

	int l_prev = 0;
	int r_prev = 0;

	double x = 0.0;
	double y = 0.0;
	double theta = 0.0;

	double wheel_radius = 0.0419;
	double robot_width = 0.6096;

	int freq = 20;
	ros::Rate timer(freq);
	while (ros::ok()) {
		int l= rc_encoder_eqep_read(2);
		int r = -1*rc_encoder_eqep_read(3);

		std::cout << "left: " << l << " right: " << r << std::endl;  
		
		int dl = l - l_prev;
		int dr = r - r_prev;

		double vl = dl * 2.0 * M_PI / 2200.0;
		double vr = dr * 2.0 * M_PI / 2200.0;

		double dx = wheel_radius * (vl + vr) * cos(theta) / 2.0; 
		double dy = wheel_radius * (vl + vr)  * sin(theta) / 2.0;
		double dtheta = wheel_radius * (vr - vl) / robot_width;

		//double dx = wheel_radius * vl * cos(theta); 
		//double dy = wheel_radius * vl * sin(theta);
		//double dtheta = -2.0 * wheel_radius * vl / robot_width;

		x += dx;
		y += dy;
		theta += dtheta; 	
		if (theta > M_PI)
			theta -= 2 * M_PI;
		else if (theta < -1*M_PI)	
			theta += 2 * M_PI;

		std::cout << "x: " << x << " y: " << y << " theta: " << theta * 180.0 / M_PI << std::endl;  
 
		l_prev = l;
		r_prev = r;

		ros::spinOnce();
		timer.sleep();
	} rc_encoder_eqep_cleanup();
	return 0;
}
