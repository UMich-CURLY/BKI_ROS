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
let BooleanMap = require('./BooleanMap.js');

//-----------------------------------------------------------

class ElevationMap {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.mapheader = null;
      this.elevation = null;
      this.confidence_map = null;
      this.bool_map = null;
    }
    else {
      if (initObj.hasOwnProperty('mapheader')) {
        this.mapheader = initObj.mapheader
      }
      else {
        this.mapheader = new MapHeader();
      }
      if (initObj.hasOwnProperty('elevation')) {
        this.elevation = initObj.elevation
      }
      else {
        this.elevation = [];
      }
      if (initObj.hasOwnProperty('confidence_map')) {
        this.confidence_map = initObj.confidence_map
      }
      else {
        this.confidence_map = new ConfidenceMap();
      }
      if (initObj.hasOwnProperty('bool_map')) {
        this.bool_map = initObj.bool_map
      }
      else {
        this.bool_map = new BooleanMap();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ElevationMap
    // Serialize message field [mapheader]
    bufferOffset = MapHeader.serialize(obj.mapheader, buffer, bufferOffset);
    // Serialize message field [elevation]
    bufferOffset = _arraySerializer.float32(obj.elevation, buffer, bufferOffset, null);
    // Serialize message field [confidence_map]
    bufferOffset = ConfidenceMap.serialize(obj.confidence_map, buffer, bufferOffset);
    // Serialize message field [bool_map]
    bufferOffset = BooleanMap.serialize(obj.bool_map, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ElevationMap
    let len;
    let data = new ElevationMap(null);
    // Deserialize message field [mapheader]
    data.mapheader = MapHeader.deserialize(buffer, bufferOffset);
    // Deserialize message field [elevation]
    data.elevation = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [confidence_map]
    data.confidence_map = ConfidenceMap.deserialize(buffer, bufferOffset);
    // Deserialize message field [bool_map]
    data.bool_map = BooleanMap.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += MapHeader.getMessageSize(object.mapheader);
    length += 4 * object.elevation.length;
    length += ConfidenceMap.getMessageSize(object.confidence_map);
    length += BooleanMap.getMessageSize(object.bool_map);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'scene_understanding/ElevationMap';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3f681330e1ad68ab131ebe44e6c923fc';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    MapHeader mapheader
    float32[] elevation
    ConfidenceMap confidence_map
    BooleanMap bool_map
    
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
    const resolved = new ElevationMap(null);
    if (msg.mapheader !== undefined) {
      resolved.mapheader = MapHeader.Resolve(msg.mapheader)
    }
    else {
      resolved.mapheader = new MapHeader()
    }

    if (msg.elevation !== undefined) {
      resolved.elevation = msg.elevation;
    }
    else {
      resolved.elevation = []
    }

    if (msg.confidence_map !== undefined) {
      resolved.confidence_map = ConfidenceMap.Resolve(msg.confidence_map)
    }
    else {
      resolved.confidence_map = new ConfidenceMap()
    }

    if (msg.bool_map !== undefined) {
      resolved.bool_map = BooleanMap.Resolve(msg.bool_map)
    }
    else {
      resolved.bool_map = new BooleanMap()
    }

    return resolved;
    }
};

module.exports = ElevationMap;
