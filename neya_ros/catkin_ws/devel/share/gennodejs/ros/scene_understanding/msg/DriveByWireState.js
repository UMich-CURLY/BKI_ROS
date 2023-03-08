// Auto-generated. Do not edit!

// (in-package scene_understanding.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class DriveByWireState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.name = null;
      this.commanded_gear = null;
      this.measured_gear = null;
      this.mode = null;
      this.commanded_steering_perc = null;
      this.measured_steering_perc = null;
      this.commanded_gasbrake_perc = null;
      this.measured_gasbrake_perc = null;
      this.is_manual = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
      }
      if (initObj.hasOwnProperty('commanded_gear')) {
        this.commanded_gear = initObj.commanded_gear
      }
      else {
        this.commanded_gear = 0;
      }
      if (initObj.hasOwnProperty('measured_gear')) {
        this.measured_gear = initObj.measured_gear
      }
      else {
        this.measured_gear = 0;
      }
      if (initObj.hasOwnProperty('mode')) {
        this.mode = initObj.mode
      }
      else {
        this.mode = 0;
      }
      if (initObj.hasOwnProperty('commanded_steering_perc')) {
        this.commanded_steering_perc = initObj.commanded_steering_perc
      }
      else {
        this.commanded_steering_perc = 0.0;
      }
      if (initObj.hasOwnProperty('measured_steering_perc')) {
        this.measured_steering_perc = initObj.measured_steering_perc
      }
      else {
        this.measured_steering_perc = 0.0;
      }
      if (initObj.hasOwnProperty('commanded_gasbrake_perc')) {
        this.commanded_gasbrake_perc = initObj.commanded_gasbrake_perc
      }
      else {
        this.commanded_gasbrake_perc = 0.0;
      }
      if (initObj.hasOwnProperty('measured_gasbrake_perc')) {
        this.measured_gasbrake_perc = initObj.measured_gasbrake_perc
      }
      else {
        this.measured_gasbrake_perc = 0.0;
      }
      if (initObj.hasOwnProperty('is_manual')) {
        this.is_manual = initObj.is_manual
      }
      else {
        this.is_manual = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DriveByWireState
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    // Serialize message field [commanded_gear]
    bufferOffset = _serializer.int32(obj.commanded_gear, buffer, bufferOffset);
    // Serialize message field [measured_gear]
    bufferOffset = _serializer.int32(obj.measured_gear, buffer, bufferOffset);
    // Serialize message field [mode]
    bufferOffset = _serializer.int32(obj.mode, buffer, bufferOffset);
    // Serialize message field [commanded_steering_perc]
    bufferOffset = _serializer.float64(obj.commanded_steering_perc, buffer, bufferOffset);
    // Serialize message field [measured_steering_perc]
    bufferOffset = _serializer.float64(obj.measured_steering_perc, buffer, bufferOffset);
    // Serialize message field [commanded_gasbrake_perc]
    bufferOffset = _serializer.float64(obj.commanded_gasbrake_perc, buffer, bufferOffset);
    // Serialize message field [measured_gasbrake_perc]
    bufferOffset = _serializer.float64(obj.measured_gasbrake_perc, buffer, bufferOffset);
    // Serialize message field [is_manual]
    bufferOffset = _serializer.bool(obj.is_manual, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DriveByWireState
    let len;
    let data = new DriveByWireState(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [commanded_gear]
    data.commanded_gear = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [measured_gear]
    data.measured_gear = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [mode]
    data.mode = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [commanded_steering_perc]
    data.commanded_steering_perc = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [measured_steering_perc]
    data.measured_steering_perc = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [commanded_gasbrake_perc]
    data.commanded_gasbrake_perc = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [measured_gasbrake_perc]
    data.measured_gasbrake_perc = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [is_manual]
    data.is_manual = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.name);
    return length + 49;
  }

  static datatype() {
    // Returns string type for a message object
    return 'scene_understanding/DriveByWireState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0c127bccc7e2a0a354cd5647b95069bf';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    string name
    
    # These match what is in the uxi_controller/include/uxiController_Enumerations.h
    int32 REVERSE=0
    int32 NEUTRAL=1
    int32 HIGH_GEAR=2
    int32 LOW_GEAR=3
    int32 CUSTOM=4
    
    int32 commanded_gear
    int32 measured_gear
    
    int32 mode
    
    float64 commanded_steering_perc
    float64 measured_steering_perc
    
    float64 commanded_gasbrake_perc
    float64 measured_gasbrake_perc
    
    # Indicates the vehicle is ignoring planner commands due to being under manual operator control.
    bool is_manual
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DriveByWireState(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
    }

    if (msg.commanded_gear !== undefined) {
      resolved.commanded_gear = msg.commanded_gear;
    }
    else {
      resolved.commanded_gear = 0
    }

    if (msg.measured_gear !== undefined) {
      resolved.measured_gear = msg.measured_gear;
    }
    else {
      resolved.measured_gear = 0
    }

    if (msg.mode !== undefined) {
      resolved.mode = msg.mode;
    }
    else {
      resolved.mode = 0
    }

    if (msg.commanded_steering_perc !== undefined) {
      resolved.commanded_steering_perc = msg.commanded_steering_perc;
    }
    else {
      resolved.commanded_steering_perc = 0.0
    }

    if (msg.measured_steering_perc !== undefined) {
      resolved.measured_steering_perc = msg.measured_steering_perc;
    }
    else {
      resolved.measured_steering_perc = 0.0
    }

    if (msg.commanded_gasbrake_perc !== undefined) {
      resolved.commanded_gasbrake_perc = msg.commanded_gasbrake_perc;
    }
    else {
      resolved.commanded_gasbrake_perc = 0.0
    }

    if (msg.measured_gasbrake_perc !== undefined) {
      resolved.measured_gasbrake_perc = msg.measured_gasbrake_perc;
    }
    else {
      resolved.measured_gasbrake_perc = 0.0
    }

    if (msg.is_manual !== undefined) {
      resolved.is_manual = msg.is_manual;
    }
    else {
      resolved.is_manual = false
    }

    return resolved;
    }
};

// Constants for message
DriveByWireState.Constants = {
  REVERSE: 0,
  NEUTRAL: 1,
  HIGH_GEAR: 2,
  LOW_GEAR: 3,
  CUSTOM: 4,
}

module.exports = DriveByWireState;
