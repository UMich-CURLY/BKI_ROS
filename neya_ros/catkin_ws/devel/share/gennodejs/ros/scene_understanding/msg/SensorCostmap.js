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

//-----------------------------------------------------------

class SensorCostmap {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.mapheader = null;
      this.sigma_x = null;
      this.sigma_y = null;
      this.mean_x = null;
      this.mean_y = null;
      this.cost = null;
      this.height_avg = null;
      this.height_sum = null;
      this.height_count = null;
      this.num_ground_points = null;
      this.num_obstacle_points = null;
    }
    else {
      if (initObj.hasOwnProperty('mapheader')) {
        this.mapheader = initObj.mapheader
      }
      else {
        this.mapheader = new MapHeader();
      }
      if (initObj.hasOwnProperty('sigma_x')) {
        this.sigma_x = initObj.sigma_x
      }
      else {
        this.sigma_x = 0.0;
      }
      if (initObj.hasOwnProperty('sigma_y')) {
        this.sigma_y = initObj.sigma_y
      }
      else {
        this.sigma_y = 0.0;
      }
      if (initObj.hasOwnProperty('mean_x')) {
        this.mean_x = initObj.mean_x
      }
      else {
        this.mean_x = 0.0;
      }
      if (initObj.hasOwnProperty('mean_y')) {
        this.mean_y = initObj.mean_y
      }
      else {
        this.mean_y = 0.0;
      }
      if (initObj.hasOwnProperty('cost')) {
        this.cost = initObj.cost
      }
      else {
        this.cost = [];
      }
      if (initObj.hasOwnProperty('height_avg')) {
        this.height_avg = initObj.height_avg
      }
      else {
        this.height_avg = [];
      }
      if (initObj.hasOwnProperty('height_sum')) {
        this.height_sum = initObj.height_sum
      }
      else {
        this.height_sum = [];
      }
      if (initObj.hasOwnProperty('height_count')) {
        this.height_count = initObj.height_count
      }
      else {
        this.height_count = [];
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
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SensorCostmap
    // Serialize message field [mapheader]
    bufferOffset = MapHeader.serialize(obj.mapheader, buffer, bufferOffset);
    // Serialize message field [sigma_x]
    bufferOffset = _serializer.float64(obj.sigma_x, buffer, bufferOffset);
    // Serialize message field [sigma_y]
    bufferOffset = _serializer.float64(obj.sigma_y, buffer, bufferOffset);
    // Serialize message field [mean_x]
    bufferOffset = _serializer.float64(obj.mean_x, buffer, bufferOffset);
    // Serialize message field [mean_y]
    bufferOffset = _serializer.float64(obj.mean_y, buffer, bufferOffset);
    // Serialize message field [cost]
    bufferOffset = _arraySerializer.float64(obj.cost, buffer, bufferOffset, null);
    // Serialize message field [height_avg]
    bufferOffset = _arraySerializer.float64(obj.height_avg, buffer, bufferOffset, null);
    // Serialize message field [height_sum]
    bufferOffset = _arraySerializer.float64(obj.height_sum, buffer, bufferOffset, null);
    // Serialize message field [height_count]
    bufferOffset = _arraySerializer.float64(obj.height_count, buffer, bufferOffset, null);
    // Serialize message field [num_ground_points]
    bufferOffset = _arraySerializer.float64(obj.num_ground_points, buffer, bufferOffset, null);
    // Serialize message field [num_obstacle_points]
    bufferOffset = _arraySerializer.float64(obj.num_obstacle_points, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SensorCostmap
    let len;
    let data = new SensorCostmap(null);
    // Deserialize message field [mapheader]
    data.mapheader = MapHeader.deserialize(buffer, bufferOffset);
    // Deserialize message field [sigma_x]
    data.sigma_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [sigma_y]
    data.sigma_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [mean_x]
    data.mean_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [mean_y]
    data.mean_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [cost]
    data.cost = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [height_avg]
    data.height_avg = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [height_sum]
    data.height_sum = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [height_count]
    data.height_count = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [num_ground_points]
    data.num_ground_points = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [num_obstacle_points]
    data.num_obstacle_points = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += MapHeader.getMessageSize(object.mapheader);
    length += 8 * object.cost.length;
    length += 8 * object.height_avg.length;
    length += 8 * object.height_sum.length;
    length += 8 * object.height_count.length;
    length += 8 * object.num_ground_points.length;
    length += 8 * object.num_obstacle_points.length;
    return length + 56;
  }

  static datatype() {
    // Returns string type for a message object
    return 'scene_understanding/SensorCostmap';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '067947cf4710194efd3f47bce3fab1f9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This is the type that will transmit a costmap containing information from a sensor.
    #
    # This is used to send into the fusedCostmapGenerator, which will accumulate these costmaps into the fusedCostmap.
    
    # Header for this map.
    # The time is set from the original measurement time.
    scene_understanding/MapHeader mapheader
    
    # Costmap Params
    float64 sigma_x
    float64 sigma_y
    float64 mean_x
    float64 mean_y
    
    # Actual data
    float64[] cost
    float64[] height_avg
    float64[] height_sum
    float64[] height_count
    float64[] num_ground_points
    float64[] num_obstacle_points
    
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SensorCostmap(null);
    if (msg.mapheader !== undefined) {
      resolved.mapheader = MapHeader.Resolve(msg.mapheader)
    }
    else {
      resolved.mapheader = new MapHeader()
    }

    if (msg.sigma_x !== undefined) {
      resolved.sigma_x = msg.sigma_x;
    }
    else {
      resolved.sigma_x = 0.0
    }

    if (msg.sigma_y !== undefined) {
      resolved.sigma_y = msg.sigma_y;
    }
    else {
      resolved.sigma_y = 0.0
    }

    if (msg.mean_x !== undefined) {
      resolved.mean_x = msg.mean_x;
    }
    else {
      resolved.mean_x = 0.0
    }

    if (msg.mean_y !== undefined) {
      resolved.mean_y = msg.mean_y;
    }
    else {
      resolved.mean_y = 0.0
    }

    if (msg.cost !== undefined) {
      resolved.cost = msg.cost;
    }
    else {
      resolved.cost = []
    }

    if (msg.height_avg !== undefined) {
      resolved.height_avg = msg.height_avg;
    }
    else {
      resolved.height_avg = []
    }

    if (msg.height_sum !== undefined) {
      resolved.height_sum = msg.height_sum;
    }
    else {
      resolved.height_sum = []
    }

    if (msg.height_count !== undefined) {
      resolved.height_count = msg.height_count;
    }
    else {
      resolved.height_count = []
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

    return resolved;
    }
};

module.exports = SensorCostmap;
