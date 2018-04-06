#include <ros/ros.h>
#include <iostream>
#include <geometry_msgs/Pose2D.h>
#include <geometry_msgs/Twist.h>
#include <geometry_msgs/Transform.h>
#include <tf/transform_datatypes.h>
#include <actionlib/client/simple_action_client.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <stdlib.h>
#include <sensor_msgs/Imu.h>
#include <geometry_msgs/PoseWithCovarianceStamped.h>

using namespace std;

float imuRot = 0;
float amclRot = 0;

void updateIMU(const sensor_msgs::Imu::ConstPtr& msg) {
	float yaw = tf::getYaw(msg->orientation);
	imuRot = ((int)(yaw * 180.0 / M_PI) + 360) % 360;
}
void updateAMCL(const geometry_msgs::PoseWithCovarianceStamped::ConstPtr& msg) {
	float yaw = tf::getYaw(msg->pose.pose.orientation);
	amclRot = ((int)(yaw * 180.0 / M_PI) + 360) % 360;
}

int main(int argc,char **argv) {
	ros::init(argc,argv,"detectdivergence");
    ros::NodeHandle nh;
	ros::Subscriber imuSub = nh.subscribe("/imu/data", 1000, &updateIMU);
	ros::Subscriber amclSub = nh.subscribe("/amcl_pose", 1000, &updateAMCL);
	
    actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> ac("move_base",true);
	
    while (!ac.waitForServer()) {
    }
    
    while(ros::ok()) {
		ros::spinOnce();
		
		float phi = (int)abs(imuRot - amclRot) % 360;
		int distance = phi > 180 ? 360 - phi : phi;
		ROS_INFO_STREAM("IMU: " << imuRot << " ; AMCL: " << amclRot << " ; Diff: " << distance);
		
		if (distance > 10) {
			ac.cancelAllGoals();
			// Sleep to allow bot to move and 'reset' discrepancy
			// prevents restart loops
			ros::Duration(0.3).sleep();
		}
		
		ros::Duration(0.05).sleep();
	}
	
	return 0; 
}
