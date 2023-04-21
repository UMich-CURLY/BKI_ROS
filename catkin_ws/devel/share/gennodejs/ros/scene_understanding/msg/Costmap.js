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
let ConfidenceMap = require('./ConfidenceMap.js');

//-----------------------------------------------------------

class Costmap {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.mapheader = null;
      this.cost = null;
      this.updated_cells = null;
      this.confidence_map = null;
    }
    else {
      if (initObj.hasOwnProperty('mapheader')) {
        this.mapheader = initObj.mapheader
      }
      else {
        this.mapheader = new MapHeader();
      }
      if (initObj.hasOwnProperty('cost')) {
        this.cost = initObj.cost
      }
      else {
        this.cost = [];
      }
      if (initObj.hasOwnProperty('updated_cells')) {
        this.updated_cells = initObj.updated_cells
      }
      else {
        this.updated_cells = [];
      }
      if (initObj.hasOwnProperty('confidence_map')) {
        this.confidence_map = initObj.confidence_map
      }
      else {
        this.confidence_map = new ConfidenceMap();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Costmap
    // Serialize message field [mapheader]
    bufferOffset = MapHeader.serialize(obj.mapheader, buffer, bufferOffset);
    // Serialize message field [cost]
    bufferOffset = _arraySerializer.uint8(obj.cost, buffer, bufferOffset, null);
    // Serialize message field [updated_cells]
    bufferOffset = _arraySerializer.int8(obj.updated_cells, buffer, bufferOffset, null);
    // Serialize message field [confidence_map]
    bufferOffset = ConfidenceMap.serialize(obj.confidence_map, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Costmap
    let len;
    let data = new Costmap(null);
    // Deserialize message field [mapheader]
    data.mapheader = MapHeader.deserialize(buffer, bufferOffset);
    // Deserialize message field [cost]
    data.cost = _arrayDeserializer.uint8(buffer, bufferOffset, null)
    // Deserialize message field [updated_cells]
    data.updated_cells = _arrayDeserializer.int8(buffer, bufferOffset, null)
    // Deserialize message field [confidence_map]
    data.confidence_map = ConfidenceMap.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += MapHeader.getMessageSize(object.mapheader);
    length += object.cost.length;
    length += object.updated_cells.length;
    length += ConfidenceMap.getMessageSize(object.confidence_map);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'scene_understanding/Costmap';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9acced72310966aa2bc4a0a7a5019bf8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    MapHeader mapheader
    uint8[] cost
    
    #Enum for type of update
    int8 NO_CHANGE = 0
    int8 CHANGED   = 1
    int8[] updated_cells
    
    ConfidenceMap confidence_map
    
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
    MSG: scene_understanding/ConfidenceMap
    #MapHeader mapheader
    float32[] confidence
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Costmap(null);
    if (msg.mapheader !== undefined) {
      resolved.mapheader = MapHeader.Resolve(msg.mapheader)
    }
    else {
      resolved.mapheader = new MapHeader()
    }

    if (msg.cost !== undefined) {
      resolved.cost = msg.cost;
    }
    else {
      resolved.cost = []
    }

    if (msg.updated_cells !== undefined) {
      resolved.updated_cells = msg.updated_cells;
    }
    else {
      resolved.updated_cells = []
    }

    if (msg.confidence_map !== undefined) {
      resolved.confidence_map = ConfidenceMap.Resolve(msg.confidence_map)
    }
    else {
      resolved.confidence_map = new ConfidenceMap()
    }

    return resolved;
    }
};

// Constants for message
Costmap.Constants = {
  NO_CHANGE: 0,
  CHANGED: 1,
}

module.exports = Costmap;
