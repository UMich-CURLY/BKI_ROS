// Auto-generated. Do not edit!

// (in-package scene_understanding.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class AutonomyState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.state = null;
    }
    else {
      if (initObj.hasOwnProperty('state')) {
        this.state = initObj.state
      }
      else {
        this.state = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AutonomyState
    // Serialize message field [state]
    bufferOffset = _serializer.int8(obj.state, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AutonomyState
    let len;
    let data = new AutonomyState(null);
    // Deserialize message field [state]
    data.state = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a message object
    return 'scene_understanding/AutonomyState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '360e23629954382a9bc44f0eb38bc373';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Autonomy States
    # Note: This message is used to transition between autonomy states on the MRZR.
    # Note: Hybrid mode is not recommended in most cases.
    int8 DISABLE_AUTONOMY=0
    int8 ENABLE_AUTONOMY=1
    int8 ENABLE_AUTONOMY_HYBRID=2
    
    int8 state
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new AutonomyState(null);
    if (msg.state !== undefined) {
      resolved.state = msg.state;
    }
    else {
      resolved.state = 0
    }

    return resolved;
    }
};

// Constants for message
AutonomyState.Constants = {
  DISABLE_AUTONOMY: 0,
  ENABLE_AUTONOMY: 1,
  ENABLE_AUTONOMY_HYBRID: 2,
}

module.exports = AutonomyState;
