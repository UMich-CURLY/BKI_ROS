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

class PIQDInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.stamp = null;
      this.target = null;
      this.current = null;
      this.error = null;
      this.proportionalTerm = null;
      this.integralTerm = null;
      this.integralTermLowerLimit = null;
      this.integralTermUpperLimit = null;
      this.quadraticTerm = null;
      this.derivativeTerm = null;
      this.feedForwardTerm = null;
      this.piqdOutput = null;
      this.controlOutput = null;
      this.saturatedControlOutput = null;
      this.timeDifference = null;
    }
    else {
      if (initObj.hasOwnProperty('stamp')) {
        this.stamp = initObj.stamp
      }
      else {
        this.stamp = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('target')) {
        this.target = initObj.target
      }
      else {
        this.target = 0.0;
      }
      if (initObj.hasOwnProperty('current')) {
        this.current = initObj.current
      }
      else {
        this.current = 0.0;
      }
      if (initObj.hasOwnProperty('error')) {
        this.error = initObj.error
      }
      else {
        this.error = 0.0;
      }
      if (initObj.hasOwnProperty('proportionalTerm')) {
        this.proportionalTerm = initObj.proportionalTerm
      }
      else {
        this.proportionalTerm = 0.0;
      }
      if (initObj.hasOwnProperty('integralTerm')) {
        this.integralTerm = initObj.integralTerm
      }
      else {
        this.integralTerm = 0.0;
      }
      if (initObj.hasOwnProperty('integralTermLowerLimit')) {
        this.integralTermLowerLimit = initObj.integralTermLowerLimit
      }
      else {
        this.integralTermLowerLimit = 0.0;
      }
      if (initObj.hasOwnProperty('integralTermUpperLimit')) {
        this.integralTermUpperLimit = initObj.integralTermUpperLimit
      }
      else {
        this.integralTermUpperLimit = 0.0;
      }
      if (initObj.hasOwnProperty('quadraticTerm')) {
        this.quadraticTerm = initObj.quadraticTerm
      }
      else {
        this.quadraticTerm = 0.0;
      }
      if (initObj.hasOwnProperty('derivativeTerm')) {
        this.derivativeTerm = initObj.derivativeTerm
      }
      else {
        this.derivativeTerm = 0.0;
      }
      if (initObj.hasOwnProperty('feedForwardTerm')) {
        this.feedForwardTerm = initObj.feedForwardTerm
      }
      else {
        this.feedForwardTerm = 0.0;
      }
      if (initObj.hasOwnProperty('piqdOutput')) {
        this.piqdOutput = initObj.piqdOutput
      }
      else {
        this.piqdOutput = 0.0;
      }
      if (initObj.hasOwnProperty('controlOutput')) {
        this.controlOutput = initObj.controlOutput
      }
      else {
        this.controlOutput = 0.0;
      }
      if (initObj.hasOwnProperty('saturatedControlOutput')) {
        this.saturatedControlOutput = initObj.saturatedControlOutput
      }
      else {
        this.saturatedControlOutput = 0.0;
      }
      if (initObj.hasOwnProperty('timeDifference')) {
        this.timeDifference = initObj.timeDifference
      }
      else {
        this.timeDifference = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PIQDInfo
    // Serialize message field [stamp]
    bufferOffset = _serializer.time(obj.stamp, buffer, bufferOffset);
    // Serialize message field [target]
    bufferOffset = _serializer.float64(obj.target, buffer, bufferOffset);
    // Serialize message field [current]
    bufferOffset = _serializer.float64(obj.current, buffer, bufferOffset);
    // Serialize message field [error]
    bufferOffset = _serializer.float64(obj.error, buffer, bufferOffset);
    // Serialize message field [proportionalTerm]
    bufferOffset = _serializer.float64(obj.proportionalTerm, buffer, bufferOffset);
    // Serialize message field [integralTerm]
    bufferOffset = _serializer.float64(obj.integralTerm, buffer, bufferOffset);
    // Serialize message field [integralTermLowerLimit]
    bufferOffset = _serializer.float64(obj.integralTermLowerLimit, buffer, bufferOffset);
    // Serialize message field [integralTermUpperLimit]
    bufferOffset = _serializer.float64(obj.integralTermUpperLimit, buffer, bufferOffset);
    // Serialize message field [quadraticTerm]
    bufferOffset = _serializer.float64(obj.quadraticTerm, buffer, bufferOffset);
    // Serialize message field [derivativeTerm]
    bufferOffset = _serializer.float64(obj.derivativeTerm, buffer, bufferOffset);
    // Serialize message field [feedForwardTerm]
    bufferOffset = _serializer.float64(obj.feedForwardTerm, buffer, bufferOffset);
    // Serialize message field [piqdOutput]
    bufferOffset = _serializer.float64(obj.piqdOutput, buffer, bufferOffset);
    // Serialize message field [controlOutput]
    bufferOffset = _serializer.float64(obj.controlOutput, buffer, bufferOffset);
    // Serialize message field [saturatedControlOutput]
    bufferOffset = _serializer.float64(obj.saturatedControlOutput, buffer, bufferOffset);
    // Serialize message field [timeDifference]
    bufferOffset = _serializer.float64(obj.timeDifference, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PIQDInfo
    let len;
    let data = new PIQDInfo(null);
    // Deserialize message field [stamp]
    data.stamp = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [target]
    data.target = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [current]
    data.current = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [error]
    data.error = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [proportionalTerm]
    data.proportionalTerm = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [integralTerm]
    data.integralTerm = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [integralTermLowerLimit]
    data.integralTermLowerLimit = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [integralTermUpperLimit]
    data.integralTermUpperLimit = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [quadraticTerm]
    data.quadraticTerm = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [derivativeTerm]
    data.derivativeTerm = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [feedForwardTerm]
    data.feedForwardTerm = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [piqdOutput]
    data.piqdOutput = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [controlOutput]
    data.controlOutput = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [saturatedControlOutput]
    data.saturatedControlOutput = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [timeDifference]
    data.timeDifference = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 120;
  }

  static datatype() {
    // Returns string type for a message object
    return 'scene_understanding/PIQDInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '240bec481b74c3ece1f9f0cf6d2d3d49';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    time stamp
    
    float64 target
    float64 current
    float64 error
    float64 proportionalTerm
    float64 integralTerm
    float64 integralTermLowerLimit
    float64 integralTermUpperLimit
    float64 quadraticTerm
    float64 derivativeTerm
    float64 feedForwardTerm
    float64 piqdOutput
    float64 controlOutput
    float64 saturatedControlOutput
    float64 timeDifference
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PIQDInfo(null);
    if (msg.stamp !== undefined) {
      resolved.stamp = msg.stamp;
    }
    else {
      resolved.stamp = {secs: 0, nsecs: 0}
    }

    if (msg.target !== undefined) {
      resolved.target = msg.target;
    }
    else {
      resolved.target = 0.0
    }

    if (msg.current !== undefined) {
      resolved.current = msg.current;
    }
    else {
      resolved.current = 0.0
    }

    if (msg.error !== undefined) {
      resolved.error = msg.error;
    }
    else {
      resolved.error = 0.0
    }

    if (msg.proportionalTerm !== undefined) {
      resolved.proportionalTerm = msg.proportionalTerm;
    }
    else {
      resolved.proportionalTerm = 0.0
    }

    if (msg.integralTerm !== undefined) {
      resolved.integralTerm = msg.integralTerm;
    }
    else {
      resolved.integralTerm = 0.0
    }

    if (msg.integralTermLowerLimit !== undefined) {
      resolved.integralTermLowerLimit = msg.integralTermLowerLimit;
    }
    else {
      resolved.integralTermLowerLimit = 0.0
    }

    if (msg.integralTermUpperLimit !== undefined) {
      resolved.integralTermUpperLimit = msg.integralTermUpperLimit;
    }
    else {
      resolved.integralTermUpperLimit = 0.0
    }

    if (msg.quadraticTerm !== undefined) {
      resolved.quadraticTerm = msg.quadraticTerm;
    }
    else {
      resolved.quadraticTerm = 0.0
    }

    if (msg.derivativeTerm !== undefined) {
      resolved.derivativeTerm = msg.derivativeTerm;
    }
    else {
      resolved.derivativeTerm = 0.0
    }

    if (msg.feedForwardTerm !== undefined) {
      resolved.feedForwardTerm = msg.feedForwardTerm;
    }
    else {
      resolved.feedForwardTerm = 0.0
    }

    if (msg.piqdOutput !== undefined) {
      resolved.piqdOutput = msg.piqdOutput;
    }
    else {
      resolved.piqdOutput = 0.0
    }

    if (msg.controlOutput !== undefined) {
      resolved.controlOutput = msg.controlOutput;
    }
    else {
      resolved.controlOutput = 0.0
    }

    if (msg.saturatedControlOutput !== undefined) {
      resolved.saturatedControlOutput = msg.saturatedControlOutput;
    }
    else {
      resolved.saturatedControlOutput = 0.0
    }

    if (msg.timeDifference !== undefined) {
      resolved.timeDifference = msg.timeDifference;
    }
    else {
      resolved.timeDifference = 0.0
    }

    return resolved;
    }
};

module.exports = PIQDInfo;
