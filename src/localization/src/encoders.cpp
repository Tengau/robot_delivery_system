#include "ros/ros.h"
#include "std_msgs/Float64.h"

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

	ros::Publisher estimated_pose_publisher = n.advertise<geometry_msgs::Pose>("estimated_pose", 1000);

	if (rc_encoder_eqep_init()){
		std::cout << "Failed to initialize encoders" << std::endl;
		return -1;
	}

	ros::Rate timer(20);
	while (ros::ok()) {
		int left_encoder = rc_encoder_eqep_read(2);
		int right_encoder = rc_encoder_eqep_read(3);

		std::cout << "left: " << left_encoder << " right: " << right_encoder << std::endl;  
		
		ros::spinOnce();
		timer.sleep();
	} rc_encoder_eqep_cleanup();
	return 0;
}
