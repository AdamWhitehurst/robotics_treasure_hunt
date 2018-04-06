// Auto-generated. Do not edit!

// (in-package logical_camera_plugin.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class logicalImage {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.modelName = null;
      this.pose_pos_x = null;
      this.pose_pos_y = null;
      this.pose_pos_z = null;
      this.pose_rot_x = null;
      this.pose_rot_y = null;
      this.pose_rot_z = null;
      this.pose_rot_w = null;
    }
    else {
      if (initObj.hasOwnProperty('modelName')) {
        this.modelName = initObj.modelName
      }
      else {
        this.modelName = '';
      }
      if (initObj.hasOwnProperty('pose_pos_x')) {
        this.pose_pos_x = initObj.pose_pos_x
      }
      else {
        this.pose_pos_x = 0.0;
      }
      if (initObj.hasOwnProperty('pose_pos_y')) {
        this.pose_pos_y = initObj.pose_pos_y
      }
      else {
        this.pose_pos_y = 0.0;
      }
      if (initObj.hasOwnProperty('pose_pos_z')) {
        this.pose_pos_z = initObj.pose_pos_z
      }
      else {
        this.pose_pos_z = 0.0;
      }
      if (initObj.hasOwnProperty('pose_rot_x')) {
        this.pose_rot_x = initObj.pose_rot_x
      }
      else {
        this.pose_rot_x = 0.0;
      }
      if (initObj.hasOwnProperty('pose_rot_y')) {
        this.pose_rot_y = initObj.pose_rot_y
      }
      else {
        this.pose_rot_y = 0.0;
      }
      if (initObj.hasOwnProperty('pose_rot_z')) {
        this.pose_rot_z = initObj.pose_rot_z
      }
      else {
        this.pose_rot_z = 0.0;
      }
      if (initObj.hasOwnProperty('pose_rot_w')) {
        this.pose_rot_w = initObj.pose_rot_w
      }
      else {
        this.pose_rot_w = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type logicalImage
    // Serialize message field [modelName]
    bufferOffset = _serializer.string(obj.modelName, buffer, bufferOffset);
    // Serialize message field [pose_pos_x]
    bufferOffset = _serializer.float32(obj.pose_pos_x, buffer, bufferOffset);
    // Serialize message field [pose_pos_y]
    bufferOffset = _serializer.float32(obj.pose_pos_y, buffer, bufferOffset);
    // Serialize message field [pose_pos_z]
    bufferOffset = _serializer.float32(obj.pose_pos_z, buffer, bufferOffset);
    // Serialize message field [pose_rot_x]
    bufferOffset = _serializer.float32(obj.pose_rot_x, buffer, bufferOffset);
    // Serialize message field [pose_rot_y]
    bufferOffset = _serializer.float32(obj.pose_rot_y, buffer, bufferOffset);
    // Serialize message field [pose_rot_z]
    bufferOffset = _serializer.float32(obj.pose_rot_z, buffer, bufferOffset);
    // Serialize message field [pose_rot_w]
    bufferOffset = _serializer.float32(obj.pose_rot_w, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type logicalImage
    let len;
    let data = new logicalImage(null);
    // Deserialize message field [modelName]
    data.modelName = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [pose_pos_x]
    data.pose_pos_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pose_pos_y]
    data.pose_pos_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pose_pos_z]
    data.pose_pos_z = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pose_rot_x]
    data.pose_rot_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pose_rot_y]
    data.pose_rot_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pose_rot_z]
    data.pose_rot_z = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pose_rot_w]
    data.pose_rot_w = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.modelName.length;
    return length + 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'logical_camera_plugin/logicalImage';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c513e19b80cdf2effbda220ba2ebb388';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string modelName
    float32 pose_pos_x
    float32 pose_pos_y
    float32 pose_pos_z
    float32 pose_rot_x
    float32 pose_rot_y
    float32 pose_rot_z
    float32 pose_rot_w
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new logicalImage(null);
    if (msg.modelName !== undefined) {
      resolved.modelName = msg.modelName;
    }
    else {
      resolved.modelName = ''
    }

    if (msg.pose_pos_x !== undefined) {
      resolved.pose_pos_x = msg.pose_pos_x;
    }
    else {
      resolved.pose_pos_x = 0.0
    }

    if (msg.pose_pos_y !== undefined) {
      resolved.pose_pos_y = msg.pose_pos_y;
    }
    else {
      resolved.pose_pos_y = 0.0
    }

    if (msg.pose_pos_z !== undefined) {
      resolved.pose_pos_z = msg.pose_pos_z;
    }
    else {
      resolved.pose_pos_z = 0.0
    }

    if (msg.pose_rot_x !== undefined) {
      resolved.pose_rot_x = msg.pose_rot_x;
    }
    else {
      resolved.pose_rot_x = 0.0
    }

    if (msg.pose_rot_y !== undefined) {
      resolved.pose_rot_y = msg.pose_rot_y;
    }
    else {
      resolved.pose_rot_y = 0.0
    }

    if (msg.pose_rot_z !== undefined) {
      resolved.pose_rot_z = msg.pose_rot_z;
    }
    else {
      resolved.pose_rot_z = 0.0
    }

    if (msg.pose_rot_w !== undefined) {
      resolved.pose_rot_w = msg.pose_rot_w;
    }
    else {
      resolved.pose_rot_w = 0.0
    }

    return resolved;
    }
};

module.exports = logicalImage;
