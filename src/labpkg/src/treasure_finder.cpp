#include <ros/ros.h>
#include <vector.h>
#include <ROSLogicalCameraPlugin.hh>

vector<logicalImage> storeTreasure;

void getScan(const logical_camera_plugin/logicalImage){

	bool readyToAdd = true;

	for(int i = 0; i < storeTreasure.size(); i++){

		if (scanMsg.pose_pose_x == storeTreasure[i].pose_pose_x && scanMsg.pose_pose_y == storeTreasure[i].pose_pose_y && scanMsg.pose_rot.x == storeTreasure[i].pose.rot.x){

			ROS_INFO_STREAM("Did not add repeat Treasure");
			readyToAdd = false;

		}

	}

	tempMsg = scanMsg.modelName;

	if(readyToAdd == true){
	
		if(tempMsg[1] == 'r' && tempMsg[2] == 'e' && tempMsg[3] == 'a'){

			storeTreasure.pushback(scanMsg);
			ROS_INFO_STREAM("Added Treasure " \0);
			ROS_INFO_STREAM(scanMsg);
			
		}

	}

		
}

void print(){

	//size_t i = 0 ??
	for(int i = 0; i < storeTreasure.size(); i++){

		ROS_INFO_STREAM(storeTreasure[i]);

	}

}

int main(int argc, char ** argv){

	ros::init(argc, argv, "treasure_finder");
	ros::NodeHandle nh;

	ros::Subscriber subSensor = nh.subscribe("/objectDetected", 1000, &getScan);
	
	//print();

	ros::spin();

}
