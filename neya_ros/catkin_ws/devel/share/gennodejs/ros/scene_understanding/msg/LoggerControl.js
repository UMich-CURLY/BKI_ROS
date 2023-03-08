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

class LoggerControl {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.directory = null;
      this.experiment = null;
      this.log_data = null;
    }
    else {
      if (initObj.hasOwnProperty('directory')) {
        this.directory = initObj.directory
      }
      else {
        this.directory = '';
      }
      if (initObj.hasOwnProperty('experiment')) {
        this.experiment = initObj.experiment
      }
      else {
        this.experiment = '';
      }
      if (initObj.hasOwnProperty('log_data')) {
        this.log_data = initObj.log_data
      }
      else {
        this.log_data = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LoggerControl
    // Serialize message field [directory]
    bufferOffset = _serializer.string(obj.directory, buffer, bufferOffset);
    // Serialize message field [experiment]
    bufferOffset = _serializer.string(obj.experiment, buffer, bufferOffset);
    // Serialize message field [log_data]
    bufferOffset = _serializer.bool(obj.log_data, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LoggerControl
    let len;
    let data = new LoggerControl(null);
    // Deserialize message field [directory]
    data.directory = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [experiment]
    data.experiment = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [log_data]
    data.log_data = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.directory);
    length += _getByteLength(object.experiment);
    return length + 9;
  }

  static datatype() {
    // Returns string type for a message object
    return 'scene_understanding/LoggerControl';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c6ce9bb3e388aa19d3b944e0c92c892a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string directory
    string experiment
    bool log_data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LoggerControl(null);
    if (msg.directory !== undefined) {
      resolved.directory = msg.directory;
    }
    else {
      resolved.directory = ''
    }

    if (msg.experiment !== undefined) {
      resolved.experiment = msg.experiment;
    }
    else {
      resolved.experiment = ''
    }

    if (msg.log_data !== undefined) {
      resolved.log_data = msg.log_data;
    }
    else {
      resolved.log_data = false
    }

    return resolved;
    }
};

module.exports = LoggerControl;
