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

class FusedCostMapMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.mapheader = null;
      this.uuid = null;
      this.xc = null;
      this.yc = null;
      this.cost = null;
      this.weight = null;
      this.num_ground_points = null;
      this.num_obstacle_points = null;
      this.ground_elevation = null;
      this.ground_elevation_confidence = null;
      this.updated_cells = null;
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
      if (initObj.hasOwnProperty('weight')) {
        this.weight = initObj.weight
      }
      else {
        this.weight = [];
      }
      if (initObj.hasOwnProperty('num_ground_points')) {
        this.num_ground_points = initObj.num_ground_points
      }
      else {
        this.num_ground_points = [];
      }
      if (initObj.hasOwnProperty('num_obstacle_points')) {
        this.num_obstacle_points = initObj.num_obstacle_points
      }
      else {
        this.num_obstacle_points = [];
      }
      if (initObj.hasOwnProperty('ground_elevation')) {
        this.ground_elevation = initObj.ground_elevation
      }
      else {
        this.ground_elevation = [];
      }
      if (initObj.hasOwnProperty('ground_elevation_confidence')) {
        this.ground_elevation_confidence = initObj.ground_elevation_confidence
      }
      else {
        this.ground_elevation_confidence = [];
      }
      if (initObj.hasOwnProperty('updated_cells')) {
        this.updated_cells = initObj.updated_cells
      }
      else {
        this.updated_cells = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FusedCostMapMsg
    // Serialize message field [mapheader]
    bufferOffset = MapHeader.serialize(obj.mapheader, buffer, bufferOffset);
    // Serialize message field [uuid]
    bufferOffset = std_msgs.msg.String.serialize(obj.uuid, buffer, bufferOffset);
    // Serialize message field [xc]
    bufferOffset = _serializer.float64(obj.xc, buffer, bufferOffset);
    // Serialize message field [yc]
    bufferOffset = _serializer.float64(obj.yc, buffer, bufferOffset);
    // Serialize message field [cost]
    bufferOffset = _arraySerializer.float64(obj.cost, buffer, bufferOffset, null);
    // Serialize message field [weight]
    bufferOffset = _arraySerializer.float64(obj.weight, buffer, bufferOffset, null);
    // Serialize message field [num_ground_points]
    bufferOffset = _arraySerializer.float64(obj.num_ground_points, buffer, bufferOffset, null);
    // Serialize message field [num_obstacle_points]
    bufferOffset = _arraySerializer.float64(obj.num_obstacle_points, buffer, bufferOffset, null);
    // Serialize message field [ground_elevation]
    bufferOffset = _arraySerializer.float64(obj.ground_elevation, buffer, bufferOffset, null);
    // Serialize message field [ground_elevation_confidence]
    bufferOffset = _arraySerializer.float64(obj.ground_elevation_confidence, buffer, bufferOffset, null);
    // Serialize message field [updated_cells]
    bufferOffset = _arraySerializer.int8(obj.updated_cells, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FusedCostMapMsg
    let len;
    let data = new FusedCostMapMsg(null);
    // Deserialize message field [mapheader]
    data.mapheader = MapHeader.deserialize(buffer, bufferOffset);
    // Deserialize message field [uuid]
    data.uuid = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    // Deserialize message field [xc]
    data.xc = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [yc]
    data.yc = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [cost]
    data.cost = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [weight]
    data.weight = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [num_ground_points]
    data.num_ground_points = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [num_obstacle_points]
    data.num_obstacle_points = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [ground_elevation]
    data.ground_elevation = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [ground_elevation_confidence]
    data.ground_elevation_confidence = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [updated_cells]
    data.updated_cells = _arrayDeserializer.int8(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += MapHeader.getMessageSize(object.mapheader);
    length += std_msgs.msg.String.getMessageSize(object.uuid);
    length += 8 * object.cost.length;
    length += 8 * object.weight.length;
    length += 8 * object.num_ground_points.length;
    length += 8 * object.num_obstacle_points.length;
    length += 8 * object.ground_elevation.length;
    length += 8 * object.ground_elevation_confidence.length;
    length += object.updated_cells.length;
    return length + 44;
  }

  static datatype() {
    // Returns string type for a message object
    return 'scene_understanding/FusedCostMapMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7ecf15e3087d12c28ef312a1e88c8e1f';
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
    float64[] cost
    float64[] weight
    # guassian_weights is not included.
    float64[] num_ground_points
    float64[] num_obstacle_points
    float64[] ground_elevation
    float64[] ground_elevation_confidence
    int8[]    updated_cells
    
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
    const resolved = new FusedCostMapMsg(null);
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

    if (msg.weight !== undefined) {
      resolved.weight = msg.weight;
    }
    else {
      resolved.weight = []
    }

    if (msg.num_ground_points !== undefined) {
      resolved.num_ground_points = msg.num_ground_points;
    }
    else {
      resolved.num_ground_points = []
    }

    if (msg.num_obstacle_points !== undefined) {
      resolved.num_obstacle_points = msg.num_obstacle_points;
    }
    else {
      resolved.num_obstacle_points = []
    }

    if (msg.ground_elevation !== undefined) {
      resolved.ground_elevation = msg.ground_elevation;
    }
    else {
      resolved.ground_elevation = []
    }

    if (msg.ground_elevation_confidence !== undefined) {
      resolved.ground_elevation_confidence = msg.ground_elevation_confidence;
    }
    else {
      resolved.ground_elevation_confidence = []
    }

    if (msg.updated_cells !== undefined) {
      resolved.updated_cells = msg.updated_cells;
    }
    else {
      resolved.updated_cells = []
    }

    return resolved;
    }
};

module.exports = FusedCostMapMsg;
