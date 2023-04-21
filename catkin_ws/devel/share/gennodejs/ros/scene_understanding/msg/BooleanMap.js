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

class BooleanMap {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.data_exists = null;
    }
    else {
      if (initObj.hasOwnProperty('data_exists')) {
        this.data_exists = initObj.data_exists
      }
      else {
        this.data_exists = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BooleanMap
    // Serialize message field [data_exists]
    bufferOffset = _arraySerializer.int8(obj.data_exists, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BooleanMap
    let len;
    let data = new BooleanMap(null);
    // Deserialize message field [data_exists]
    data.data_exists = _arrayDeserializer.int8(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.data_exists.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'scene_understanding/BooleanMap';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '87a3648defa41ca2572ff6541da77b0b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #MapHeader mapheader
    int8[] data_exists
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new BooleanMap(null);
    if (msg.data_exists !== undefined) {
      resolved.data_exists = msg.data_exists;
    }
    else {
      resolved.data_exists = []
    }

    return resolved;
    }
};

module.exports = BooleanMap;
