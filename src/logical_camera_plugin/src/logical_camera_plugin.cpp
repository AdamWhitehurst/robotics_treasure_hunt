#include "logical_camera_plugin/logical_camera_plugin.hh"

#include <gazebo/physics/Link.hh>
#include <gazebo/physics/Model.hh>
#include <gazebo/physics/World.hh>
#include <gazebo/sensors/Sensor.hh>
#include <gazebo/sensors/SensorManager.hh>
#include "std_msgs/String.h"
#include "logical_camera_plugin/logicalImage.h"

#include <sstream>
#include <string>
#include <algorithm>

using namespace gazebo;

GZ_REGISTER_MODEL_PLUGIN(LogicalCameraPlugin);

LogicalCameraPlugin::LogicalCameraPlugin()
{
}

LogicalCameraPlugin::~LogicalCameraPlugin()
{
  this->rosnode->shutdown();
}

void LogicalCameraPlugin::Load(physics::ModelPtr _parent, sdf::ElementPtr _sdf)
{
  gzdbg << "Called Load!" << "\n";
  initTable();
  this->robotNamespace = "logical_camera";
  if(_sdf->HasElement("robotNamespace"))
  {
    this->robotNamespace = _sdf->GetElement("robotNamespace")->Get<std::string>() + "/";
  }

  this->world = _parent->GetWorld();
  this->name = _parent->GetName();

  if (!ros::isInitialized())
  {
    ROS_FATAL_STREAM("A ROS node for Gazebo has not been initialized,"
       << "unable to load plugin. Load the Gazebo system plugin "
       << "'libgazebo_ros_api_plugin.so' in the gazebo_ros package)");
    return;
  }


  this->modelFramePrefix = this->name + "_";
  if (_sdf->HasElement("model_frame_prefix"))
  {
    this->modelFramePrefix = _sdf->GetElement("model_frame_prefix")->Get<std::string>();
  }
  gzdbg << "Using model frame prefix of: " << this->modelFramePrefix << std::endl;

  this->model = _parent;
  this->node = transport::NodePtr(new transport::Node());
  this->node->Init(this->model->GetWorld()->GetName());
  this->rosnode = new ros::NodeHandle(this->robotNamespace);

  this->findLogicalCamera();
  if ( !this->sensor)
  {
    gzerr << "No logical camera found on any link\n";
    return;
  }


  for (int i=0;i<4;i++){
    this->joint[i] = this->model->GetJoints()[i];
    gzdbg << "Joints found are: " <<this->joint[i]->GetScopedName() << "\n";
  }



  std::string imageTopic_ros = this->name;
  if (_sdf->HasElement("image_topic_ros")) 
  {
    imageTopic_ros = _sdf->Get<std::string>("image_topic_ros");
  }

  this->imageSub = this->node->Subscribe(this->sensor->Topic(),
  	&LogicalCameraPlugin::onImage, this);
  gzdbg << "Subscribing to gazebo topic: "<< this->sensor->Topic() << "\n";

  imagePub = this->rosnode->advertise<logical_camera_plugin::logicalImage>("/objectsDetected", 1000);
  gzdbg << "Publishing to ROS topic: " << imagePub.getTopic() << "\n";

  transformBroadcaster = boost::shared_ptr<tf::TransformBroadcaster>(new tf::TransformBroadcaster());

}

void LogicalCameraPlugin::initTable()
{
  gzdbg << "Initializing hash table!" << "\n";

  this->matchModel.emplace("intersection_33","West_se101");
  this->matchModel.emplace("intersection_33_clone","West_se102");
  this->matchModel.emplace("intersection_33_clone_14","North_se104");
  this->matchModel.emplace("intersection_33_clone_13","West_se104");
  this->matchModel.emplace("intersection_33_clone_12","West_se105");
  this->matchModel.emplace("intersection_33_clone_11","East_se106");
  
  this->matchModel.emplace("intersection_33_clone_10","se110");
  this->matchModel.emplace("intersection_33_clone_9","se111");
  this->matchModel.emplace("intersection_33_clone_0","se112");
  this->matchModel.emplace("intersection_33_clone_8","se113");
  this->matchModel.emplace("intersection_33_clone_7","se114");
  this->matchModel.emplace("intersection_33_clone_1","se115");
  this->matchModel.emplace("intersection_33_clone_2","se116");
  this->matchModel.emplace("intersection_33_clone_6","se119");
  this->matchModel.emplace("intersection_33_clone_3","se117");
  this->matchModel.emplace("intersection_33_clone_4","se118");
  this->matchModel.emplace("intersection_33_clone_5","se118");
  


  this->matchModel.emplace("intersection_32","intersection_East_1a");
  this->matchModel.emplace("intersection_31","intersection_West_1b");
  this->matchModel.emplace("intersection_29","intersection_East_1b");
  this->matchModel.emplace("intersection_37","intersection_North_1b");
  this->matchModel.emplace("intersection_28","intersection_West_1c");
  this->matchModel.emplace("intersection_30","intersection_East_1c");
  this->matchModel.emplace("intersection_0","intersection_North_1c");
  this->matchModel.emplace("intersection_34","intersection_West_1d");
  this->matchModel.emplace("intersection_2","intersection_North_1d");

  this->matchModel.emplace("intersection_38","intersection_South_2a");
  this->matchModel.emplace("intersection_56","intersection_North_2a");
  this->matchModel.emplace("intersection_3","intersection_West_2a");
  this->matchModel.emplace("intersection_46","intersection_South_2c");
  this->matchModel.emplace("intersection_9","intersection_East_2c");
  this->matchModel.emplace("intersection_45","intersection_North_2c");
  this->matchModel.emplace("intersection_45_clone","intersection_South_2d");
  this->matchModel.emplace("intersection_4","intersection_North_2d");
  this->matchModel.emplace("intersection_8","intersection_West_2d");

  this->matchModel.emplace("intersection_58","intersection_East6_101");

  this->matchModel.emplace("intersection_40","intersection_South7_104");
  this->matchModel.emplace("intersection_41","intersection_East_104");

  this->matchModel.emplace("intersection_35","intersection_South__4i");
  this->matchModel.emplace("intersection_36","intersection_North__4i");
  this->matchModel.emplace("intersection_1","intersection_West__4i");
  this->matchModel.emplace("intersection_36_clone","intersection_South__4h");
  this->matchModel.emplace("intersection_39","intersection_North__4h");
  this->matchModel.emplace("intersection_10","intersection_West__4h");
 


  this->matchModel.emplace("corridor","corridor_1a");
  this->matchModel.emplace("corridor_0","corridor_1b");
  this->matchModel.emplace("corridor_1","corridor_1c");
  this->matchModel.emplace("corridor_2","corridor_1d");

  this->matchModel.emplace("corridor_22","corridor_2a");
  this->matchModel.emplace("corridor_23","corridor_2b");
  this->matchModel.emplace("corridor_19","corridor_2c");
  this->matchModel.emplace("corridor_18","corridor_2d");
  this->matchModel.emplace("corridor_13","corridor_2e");
  this->matchModel.emplace("corridor_11","corridor_2f");
  this->matchModel.emplace("corridor_10","corridor_2g");
  this->matchModel.emplace("corridor_6","corridor_2h");

  this->matchModel.emplace("corridor_4","corridor_3a");
  this->matchModel.emplace("corridor_3","corridor_3b");
  this->matchModel.emplace("corridor_5","corridor_3c");

  this->matchModel.emplace("corridor_9","corridor_4a");
  this->matchModel.emplace("corridor_8","corridor_4b");
  this->matchModel.emplace("corridor_7","corridor_4c");
  this->matchModel.emplace("corridor_14","corridor_4d");
  this->matchModel.emplace("corridor_15","corridor_4e");
  this->matchModel.emplace("corridor_16","corridor_4f");
  this->matchModel.emplace("corridor_17","corridor_4g");
  this->matchModel.emplace("corridor_20","corridor_4h");
  this->matchModel.emplace("corridor_21","corridor_4i");
}

string LogicalCameraPlugin::checkIfRoom(string modelName){
  unordered_map<string,string>::const_iterator map_find = this->matchModel.find(modelName);
  if ( map_find == this->matchModel.end() )
  {
	gzdbg << "This is not a model to identify room: " << modelName << "!\n";
	return modelName;
  } else {
	gzdbg << "Matched the model " << map_find->first << "for a room: " << map_find->second << "!\n";
	return map_find->second;
  }
}

void LogicalCameraPlugin::findLogicalCamera()
{
  sensors::SensorManager* sensorManager = sensors::SensorManager::Instance();

  for (physics::LinkPtr link : this->model->GetLinks())
  {
    for (unsigned int i =0; i < link->GetSensorCount(); ++i)
    {
      sensors::SensorPtr sensor = sensorManager->GetSensor(link->GetSensorName(i));

      if (sensor->Type() == "logical_camera")
      {
        this->sensor = sensor;
	break;
      }
    }

    if (this->sensor)
    {
      this->cameraLink = link;
      break;

    }
  }
}

void LogicalCameraPlugin::onImage(ConstLogicalCameraImagePtr &_msg)
{

  gazebo::msgs::LogicalCameraImage imageMsg;
  math::Vector3 modelPosition;
  math::Quaternion modelOrientation;
  math::Pose modelPose;

  for (int i = 0;i < _msg->model_size();++i)
  {
    modelPosition = math::Vector3(msgs::ConvertIgn(_msg->model(i).pose().position()));
    modelOrientation = math::Quaternion(msgs::ConvertIgn(_msg->model(i).pose().orientation()));
    modelPose = math::Pose(modelPosition, modelOrientation);
    
    std::string modelName = _msg->model(i).name();
    std::string modelFrameId = this->modelFramePrefix + modelName + "harsha";
    if ( modelName != "asphalt_plane" && modelName.find("jersey_barrier") ==string::npos && modelName != "ground_plane"  ) { 
      //if ( modelName != "se1f1" ) { 
        gzdbg << "Model detected: " << modelName << "with pose" << modelPose << "\n";
        //this->publishTF(modelPose, this->name,modelFrameId);
     

      logical_camera_plugin::logicalImage msg;
      string finModelName = checkIfRoom(modelName);
      msg.modelName = finModelName;
      msg.pose_pos_x = modelPose.pos.x;
      msg.pose_pos_y = modelPose.pos.y;
      msg.pose_pos_z = modelPose.pos.z;
      msg.pose_rot_x = modelPose.rot.x;
      msg.pose_rot_y = modelPose.rot.y;
      msg.pose_rot_z = modelPose.rot.z;
      msg.pose_rot_w = modelPose.rot.w;
      this->imagePub.publish(msg);
     }
  }

}

void LogicalCameraPlugin::publishTF(
  const math::Pose &pose, const std::string &parentFrame, const std::string &frame)
{
    ros::Time currentTime = ros::Time::now();

    tf::Quaternion qt(pose.rot.x, pose.rot.y, pose.rot.z, pose.rot.w);
    tf::Vector3 vt(pose.pos.x, pose.pos.y, pose.pos.z);

    tf::Transform transform(qt, vt);
    transformBroadcaster->sendTransform(tf::StampedTransform(transform, currentTime, parentFrame, frame));
}
