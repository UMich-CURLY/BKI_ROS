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

class MapHeader {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.originx = null;
      this.originy = null;
      this.num_rows = null;
      this.num_cols = null;
      this.cell_size = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('originx')) {
        this.originx = initObj.originx
      }
      else {
        this.originx = 0.0;
      }
      if (initObj.hasOwnProperty('originy')) {
        this.originy = initObj.originy
      }
      else {
        this.originy = 0.0;
      }
      if (initObj.hasOwnProperty('num_rows')) {
        this.num_rows = initObj.num_rows
      }
      else {
        this.num_rows = 0;
      }
      if (initObj.hasOwnProperty('num_cols')) {
        this.num_cols = initObj.num_cols
      }
      else {
        this.num_cols = 0;
      }
      if (initObj.hasOwnProperty('cell_size')) {
        this.cell_size = initObj.cell_size
      }
      else {
        this.cell_size = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MapHeader
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [originx]
    bufferOffset = _serializer.float64(obj.originx, buffer, bufferOffset);
    // Serialize message field [originy]
    bufferOffset = _serializer.float64(obj.originy, buffer, bufferOffset);
    // Serialize message field [num_rows]
    bufferOffset = _serializer.int32(obj.num_rows, buffer, bufferOffset);
    // Serialize message field [num_cols]
    bufferOffset = _serializer.int32(obj.num_cols, buffer, bufferOffset);
    // Serialize message field [cell_size]
    bufferOffset = _serializer.float64(obj.cell_size, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MapHeader
    let len;
    let data = new MapHeader(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [originx]
    data.originx = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [originy]
    data.originy = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [num_rows]
    data.num_rows = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [num_cols]
    data.num_cols = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [cell_size]
    data.cell_size = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'scene_understanding/MapHeader';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3f32797868801a9f5a26fc67434cd215';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    float64 originx
    float64 originy
    
    int32 num_rows
    int32 num_cols
    float64 cell_size
    
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
    const resolved = new MapHeader(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.originx !== undefined) {
      resolved.originx = msg.originx;
    }
    else {
      resolved.originx = 0.0
    }

    if (msg.originy !== undefined) {
      resolved.originy = msg.originy;
    }
    else {
      resolved.originy = 0.0
    }

    if (msg.num_rows !== undefined) {
      resolved.num_rows = msg.num_rows;
    }
    else {
      resolved.num_rows = 0
    }

    if (msg.num_cols !== undefined) {
      resolved.num_cols = msg.num_cols;
    }
    else {
      resolved.num_cols = 0
    }

    if (msg.cell_size !== undefined) {
      resolved.cell_size = msg.cell_size;
    }
    else {
      resolved.cell_size = 0.0
    }

    return resolved;
    }
};

module.exports = MapHeader;
