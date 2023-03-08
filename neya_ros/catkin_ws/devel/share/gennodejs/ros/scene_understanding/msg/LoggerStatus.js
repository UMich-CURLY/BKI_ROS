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

class LoggerStatus {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.logging = null;
      this.status = null;
    }
    else {
      if (initObj.hasOwnProperty('logging')) {
        this.logging = initObj.logging
      }
      else {
        this.logging = false;
      }
      if (initObj.hasOwnProperty('status')) {
        this.status = initObj.status
      }
      else {
        this.status = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LoggerStatus
    // Serialize message field [logging]
    bufferOffset = _serializer.bool(obj.logging, buffer, bufferOffset);
    // Serialize message field [status]
    bufferOffset = _serializer.int8(obj.status, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LoggerStatus
    let len;
    let data = new LoggerStatus(null);
    // Deserialize message field [logging]
    data.logging = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [status]
    data.status = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a message object
    return 'scene_understanding/LoggerStatus';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b41f30f09dc0b31930675744564ab05c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Status enum
    int8 NOMINAL=0
    int8 CONSOLIDATING=1
    int8 PARAMETER_ERROR=2
    int8 DIRECTORY_ERROR=3
    int8 DISK_SPACE_ERROR=4
    int8 SYNC_ERROR=5
    
    # Logger Status
    bool logging
    int8 status
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LoggerStatus(null);
    if (msg.logging !== undefined) {
      resolved.logging = msg.logging;
    }
    else {
      resolved.logging = false
    }

    if (msg.status !== undefined) {
      resolved.status = msg.status;
    }
    else {
      resolved.status = 0
    }

    return resolved;
    }
};

// Constants for message
LoggerStatus.Constants = {
  NOMINAL: 0,
  CONSOLIDATING: 1,
  PARAMETER_ERROR: 2,
  DIRECTORY_ERROR: 3,
  DISK_SPACE_ERROR: 4,
  SYNC_ERROR: 5,
}

module.exports = LoggerStatus;
