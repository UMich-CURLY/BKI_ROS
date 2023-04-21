// Auto-generated. Do not edit!

// (in-package scene_understanding.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let MapHeader = require('./MapHeader.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class FusedCostMapLossyMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.mapheader = null;
      this.uuid = null;
      this.xc = null;
      this.yc = null;
      this.cost = null;
    }
    else {
      if (initObj.hasOwnProperty('mapheader')) {
        this.mapheader = initObj.mapheader
      }
      else {
        this.mapheader = new MapHeader();
      }
      if (initObj.hasOwnProperty('uuid')) {
        this.uuid = initObj.uuid
      }
      else {
        this.uuid = new std_msgs.msg.String();
      }
      if (initObj.hasOwnProperty('xc')) {
        this.xc = initObj.xc
      }
      else {
        this.xc = 0.0;
      }
      if (initObj.hasOwnProperty('yc')) {
        this.yc = initObj.yc
      }
      else {
        this.yc = 0.0;
      }
      if (initObj.hasOwnProperty('cost')) {
        this.cost = initObj.cost
      }
      else {
        this.cost = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FusedCostMapLossyMsg
    // Serialize message field [mapheader]
    bufferOffset = MapHeader.serialize(obj.mapheader, buffer, bufferOffset);
    // Serialize message field [uuid]
    bufferOffset = std_msgs.msg.String.serialize(obj.uuid, buffer, bufferOffset);
    // Serialize message field [xc]
    bufferOffset = _serializer.float64(obj.xc, buffer, bufferOffset);
    // Serialize message field [yc]
    bufferOffset = _serializer.float64(obj.yc, buffer, bufferOffset);
    // Serialize message field [cost]
    bufferOffset = _arraySerializer.uint8(obj.cost, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FusedCostMapLossyMsg
    let len;
    let data = new FusedCostMapLossyMsg(null);
    // Deserialize message field [mapheader]
    data.mapheader = MapHeader.deserialize(buffer, bufferOffset);
    // Deserialize message field [uuid]
    data.uuid = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    // Deserialize message field [xc]
    data.xc = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [yc]
    data.yc = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [cost]
    data.cost = _arrayDeserializer.uint8(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += MapHeader.getMessageSize(object.mapheader);
    length += std_msgs.msg.String.getMessageSize(object.uuid);
    length += object.cost.length;
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'scene_understanding/FusedCostMapLossyMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0836f33df280efa4c6fdc7b6fafbcab2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This type is a DTO for the uxi_costmap/FusedCostmap type. The members here
    # should be able to exactly mimic the class's internal structure, without loss
    # of information
    
    scene_understanding/MapHeader mapheader
    std_msgs/String     uuid
    
    # Look at the FusedCostMap class for a definition on what this means
    float64 xc
    float64 yc
    
    # All of these maps are stored in column major format.
    uint8[] cost
    
    ================================================================================
    MSG: scene_understanding/MapHeader
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
    
    ================================================================================
    MSG: std_msgs/String
    string data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new FusedCostMapLossyMsg(null);
    if (msg.mapheader !== undefined) {
      resolved.mapheader = MapHeader.Resolve(msg.mapheader)
    }
    else {
      resolved.mapheader = new MapHeader()
    }

    if (msg.uuid !== undefined) {
      resolved.uuid = std_msgs.msg.String.Resolve(msg.uuid)
    }
    else {
      resolved.uuid = new std_msgs.msg.String()
    }

    if (msg.xc !== undefined) {
      resolved.xc = msg.xc;
    }
    else {
      resolved.xc = 0.0
    }

    if (msg.yc !== undefined) {
      resolved.yc = msg.yc;
    }
    else {
      resolved.yc = 0.0
    }

    if (msg.cost !== undefined) {
      resolved.cost = msg.cost;
    }
    else {
      resolved.cost = []
    }

    return resolved;
    }
};

module.exports = FusedCostMapLossyMsg;
