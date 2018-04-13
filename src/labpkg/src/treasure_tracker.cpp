#include <ros/ros.h>
#include <vector>
#include <string>
#include <logical_camera_plugin/logicalImage.h>

std::vector<logical_camera_plugin::logicalImage> storeTreasure;

void getScan(const logical_camera_plugin::logicalImage &scanMsg){

	bool readyToAdd = true;

	for(int i = 0; i < storeTreasure.size(); i++){

		if (scanMsg.pose_pos_x == storeTreasure[i].pose_pos_x && scanMsg.pose_pos_y == storeTreasure[i].pose_pos_y && scanMsg.pose_rot_x == storeTreasure[i].pose_rot_x){

			ROS_INFO_STREAM("Did not add repeat Treasure");
			readyToAdd = false;

		}

	}

	std::string tempMsg = scanMsg.modelName;

	if(readyToAdd == true){
	
		if(tempMsg[1] == 'r' && tempMsg[2] == 'e' && tempMsg[3] == 'a'){

			storeTreasure.push_back(scanMsg);
			ROS_INFO_STREAM("Added Treasure ");
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
