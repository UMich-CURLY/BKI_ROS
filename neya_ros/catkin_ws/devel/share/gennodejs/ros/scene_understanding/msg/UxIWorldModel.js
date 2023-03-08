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
let Costmap = require('./Costmap.js');
let ElevationMap = require('./ElevationMap.js');

//-----------------------------------------------------------

class UxIWorldModel {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.mapheader = null;
      this.costmap = null;
      this.ground_elevation_map = null;
    }
    else {
      if (initObj.hasOwnProperty('mapheader')) {
        this.mapheader = initObj.mapheader
      }
      else {
        this.mapheader = new MapHeader();
      }
      if (initObj.hasOwnProperty('costmap')) {
        this.costmap = initObj.costmap
      }
      else {
        this.costmap = new Costmap();
      }
      if (initObj.hasOwnProperty('ground_elevation_map')) {
        this.ground_elevation_map = initObj.ground_elevation_map
      }
      else {
        this.ground_elevation_map = new ElevationMap();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type UxIWorldModel
    // Serialize message field [mapheader]
    bufferOffset = MapHeader.serialize(obj.mapheader, buffer, bufferOffset);
    // Serialize message field [costmap]
    bufferOffset = Costmap.serialize(obj.costmap, buffer, bufferOffset);
    // Serialize message field [ground_elevation_map]
    bufferOffset = ElevationMap.serialize(obj.ground_elevation_map, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type UxIWorldModel
    let len;
    let data = new UxIWorldModel(null);
    // Deserialize message field [mapheader]
    data.mapheader = MapHeader.deserialize(buffer, bufferOffset);
    // Deserialize message field [costmap]
    data.costmap = Costmap.deserialize(buffer, bufferOffset);
    // Deserialize message field [ground_elevation_map]
    data.ground_elevation_map = ElevationMap.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += MapHeader.getMessageSize(object.mapheader);
    length += Costmap.getMessageSize(object.costmap);
    length += ElevationMap.getMessageSize(object.ground_elevation_map);
    return length;
  }

  static datatype() {
    // Returns string type for a message object
    return 'scene_understanding/UxIWorldModel';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cb62fd2200fd1ee960df6a33acdf4318';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    MapHeader mapheader
    Costmap costmap
    ElevationMap ground_elevation_map
    #ElevationMap max_elevation_map
    
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
    MSG: scene_understanding/Costmap
    MapHeader mapheader
    uint8[] cost
    
    #Enum for type of update
    int8 NO_CHANGE = 0
    int8 CHANGED   = 1
    int8[] updated_cells
    
    ConfidenceMap confidence_map
    
    ================================================================================
    MSG: scene_understanding/ConfidenceMap
    #MapHeader mapheader
    float32[] confidence
    
    ================================================================================
    MSG: scene_understanding/ElevationMap
    MapHeader mapheader
    float32[] elevation
    ConfidenceMap confidence_map
    BooleanMap bool_map
    
    ================================================================================
    MSG: scene_understanding/BooleanMap
    #MapHeader mapheader
    int8[] data_exists
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new UxIWorldModel(null);
    if (msg.mapheader !== undefined) {
      resolved.mapheader = MapHeader.Resolve(msg.mapheader)
    }
    else {
      resolved.mapheader = new MapHeader()
    }

    if (msg.costmap !== undefined) {
      resolved.costmap = Costmap.Resolve(msg.costmap)
    }
    else {
      resolved.costmap = new Costmap()
    }

    if (msg.ground_elevation_map !== undefined) {
      resolved.ground_elevation_map = ElevationMap.Resolve(msg.ground_elevation_map)
    }
    else {
      resolved.ground_elevation_map = new ElevationMap()
    }

    return resolved;
    }
};

module.exports = UxIWorldModel;
