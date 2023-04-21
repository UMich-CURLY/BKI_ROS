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
let sensor_msgs = _finder('sensor_msgs');

//-----------------------------------------------------------

class StereoImagePair {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.leftImage = null;
      this.rightImage = null;
      this.focalLength = null;
      this.baseline = null;
      this.centerRow = null;
      this.centerCol = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('leftImage')) {
        this.leftImage = initObj.leftImage
      }
      else {
        this.leftImage = new sensor_msgs.msg.Image();
      }
      if (initObj.hasOwnProperty('rightImage')) {
        this.rightImage = initObj.rightImage
      }
      else {
        this.rightImage = new sensor_msgs.msg.Image();
      }
      if (initObj.hasOwnProperty('focalLength')) {
        this.focalLength = initObj.focalLength
      }
      else {
        this.focalLength = 0.0;
      }
      if (initObj.hasOwnProperty('baseline')) {
        this.baseline = initObj.baseline
      }
      else {
        this.baseline = 0.0;
      }
      if (initObj.hasOwnProperty('centerRow')) {
        this.centerRow = initObj.centerRow
      }
      else {
        this.centerRow = 0.0;
      }
      if (initObj.hasOwnProperty('centerCol')) {
        this.centerCol = initObj.centerCol
      }
      else {
        this.centerCol = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type StereoImagePair
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [leftImage]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.leftImage, buffer, bufferOffset);
    // Serialize message field [rightImage]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.rightImage, buffer, bufferOffset);
    // Serialize message field [focalLength]
    bufferOffset = _serializer.float32(obj.focalLength, buffer, bufferOffset);
    // Serialize message field [baseline]
    bufferOffset = _serializer.float32(obj.baseline, buffer, bufferOffset);
    // Serialize message field [centerRow]
    bufferOffset = _serializer.float32(obj.centerRow, buffer, bufferOffset);
    // Serialize message field [centerCol]
    bufferOffset = _serializer.float32(obj.centerCol, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type StereoImagePair
    let len;
    let data = new StereoImagePair(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [leftImage]
    data.leftImage = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    // Deserialize message field [rightImage]
    data.rightImage = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    // Deserialize message field [focalLength]
    data.focalLength = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [baseline]
    data.baseline = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [centerRow]
    data.centerRow = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [centerCol]
    data.centerCol = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += sensor_msgs.msg.Image.getMessageSize(object.leftImage);
    length += sensor_msgs.msg.Image.getMessageSize(object.rightImage);
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'scene_understanding/StereoImagePair';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b71ab9b442ba2143a8c747c61426fdc4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    sensor_msgs/Image leftImage
    sensor_msgs/Image rightImage
    
    # The camera intrinsics for the rectified camera
    float32 focalLength
    float32 baseline
    float32 centerRow
    float32 centerCol
    
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
    MSG: sensor_msgs/Image
    # This message contains an uncompressed image
    # (0, 0) is at top-left corner of image
    #
    
    Header header        # Header timestamp should be acquisition time of image
                         # Header frame_id should be optical frame of camera
                         # origin of frame should be optical center of camera
                         # +x should point to the right in the image
                         # +y should point down in the image
                         # +z should point into to plane of the image
                         # If the frame_id here and the frame_id of the CameraInfo
                         # message associated with the image conflict
                         # the behavior is undefined
    
    uint32 height         # image height, that is, number of rows
    uint32 width          # image width, that is, number of columns
    
    # The legal values for encoding are in file src/image_encodings.cpp
    # If you want to standardize a new string format, join
    # ros-users@lists.sourceforge.net and send an email proposing a new encoding.
    
    string encoding       # Encoding of pixels -- channel meaning, ordering, size
                          # taken from the list of strings in include/sensor_msgs/image_encodings.h
    
    uint8 is_bigendian    # is this data bigendian?
    uint32 step           # Full row length in bytes
    uint8[] data          # actual matrix data, size is (step * rows)
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new StereoImagePair(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.leftImage !== undefined) {
      resolved.leftImage = sensor_msgs.msg.Image.Resolve(msg.leftImage)
    }
    else {
      resolved.leftImage = new sensor_msgs.msg.Image()
    }

    if (msg.rightImage !== undefined) {
      resolved.rightImage = sensor_msgs.msg.Image.Resolve(msg.rightImage)
    }
    else {
      resolved.rightImage = new sensor_msgs.msg.Image()
    }

    if (msg.focalLength !== undefined) {
      resolved.focalLength = msg.focalLength;
    }
    else {
      resolved.focalLength = 0.0
    }

    if (msg.baseline !== undefined) {
      resolved.baseline = msg.baseline;
    }
    else {
      resolved.baseline = 0.0
    }

    if (msg.centerRow !== undefined) {
      resolved.centerRow = msg.centerRow;
    }
    else {
      resolved.centerRow = 0.0
    }

    if (msg.centerCol !== undefined) {
      resolved.centerCol = msg.centerCol;
    }
    else {
      resolved.centerCol = 0.0
    }

    return resolved;
    }
};

module.exports = StereoImagePair;
