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

class VoxelValue {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x = null;
      this.y = null;
      this.z = null;
      this.density = null;
      this.density_confidence = null;
      this.rgb = null;
      this.material = null;
    }
    else {
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0.0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0.0;
      }
      if (initObj.hasOwnProperty('z')) {
        this.z = initObj.z
      }
      else {
        this.z = 0.0;
      }
      if (initObj.hasOwnProperty('density')) {
        this.density = initObj.density
      }
      else {
        this.density = 0.0;
      }
      if (initObj.hasOwnProperty('density_confidence')) {
        this.density_confidence = initObj.density_confidence
      }
      else {
        this.density_confidence = 0.0;
      }
      if (initObj.hasOwnProperty('rgb')) {
        this.rgb = initObj.rgb
      }
      else {
        this.rgb = 0.0;
      }
      if (initObj.hasOwnProperty('material')) {
        this.material = initObj.material
      }
      else {
        this.material = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type VoxelValue
    // Serialize message field [x]
    bufferOffset = _serializer.float64(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.float64(obj.y, buffer, bufferOffset);
    // Serialize message field [z]
    bufferOffset = _serializer.float64(obj.z, buffer, bufferOffset);
    // Serialize message field [density]
    bufferOffset = _serializer.float32(obj.density, buffer, bufferOffset);
    // Serialize message field [density_confidence]
    bufferOffset = _serializer.float32(obj.density_confidence, buffer, bufferOffset);
    // Serialize message field [rgb]
    bufferOffset = _serializer.float32(obj.rgb, buffer, bufferOffset);
    // Serialize message field [material]
    bufferOffset = _serializer.uint8(obj.material, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type VoxelValue
    let len;
    let data = new VoxelValue(null);
    // Deserialize message field [x]
    data.x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [z]
    data.z = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [density]
    data.density = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [density_confidence]
    data.density_confidence = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [rgb]
    data.rgb = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [material]
    data.material = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 37;
  }

  static datatype() {
    // Returns string type for a message object
    return 'scene_understanding/VoxelValue';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '803ef880e1818e7bb7eb8eac0ff9f20b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 x
    float64 y
    float64 z
    
    float32 density
    float32 density_confidence
    
    float32 rgb
    
    uint8 material
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new VoxelValue(null);
    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0.0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0.0
    }

    if (msg.z !== undefined) {
      resolved.z = msg.z;
    }
    else {
      resolved.z = 0.0
    }

    if (msg.density !== undefined) {
      resolved.density = msg.density;
    }
    else {
      resolved.density = 0.0
    }

    if (msg.density_confidence !== undefined) {
      resolved.density_confidence = msg.density_confidence;
    }
    else {
      resolved.density_confidence = 0.0
    }

    if (msg.rgb !== undefined) {
      resolved.rgb = msg.rgb;
    }
    else {
      resolved.rgb = 0.0
    }

    if (msg.material !== undefined) {
      resolved.material = msg.material;
    }
    else {
      resolved.material = 0
    }

    return resolved;
    }
};

module.exports = VoxelValue;
