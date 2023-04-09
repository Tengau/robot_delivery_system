// Auto-generated. Do not edit!

// (in-package localization.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Instruction {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.from_index = null;
      this.to_index = null;
      this.distance = null;
    }
    else {
      if (initObj.hasOwnProperty('from_index')) {
        this.from_index = initObj.from_index
      }
      else {
        this.from_index = 0;
      }
      if (initObj.hasOwnProperty('to_index')) {
        this.to_index = initObj.to_index
      }
      else {
        this.to_index = 0;
      }
      if (initObj.hasOwnProperty('distance')) {
        this.distance = initObj.distance
      }
      else {
        this.distance = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Instruction
    // Serialize message field [from_index]
    bufferOffset = _serializer.int64(obj.from_index, buffer, bufferOffset);
    // Serialize message field [to_index]
    bufferOffset = _serializer.int64(obj.to_index, buffer, bufferOffset);
    // Serialize message field [distance]
    bufferOffset = _serializer.float64(obj.distance, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Instruction
    let len;
    let data = new Instruction(null);
    // Deserialize message field [from_index]
    data.from_index = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [to_index]
    data.to_index = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [distance]
    data.distance = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'localization/Instruction';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e367e05ce4cf725a4081bd527e66bfca';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 from_index
    int64 to_index
    float64 distance
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Instruction(null);
    if (msg.from_index !== undefined) {
      resolved.from_index = msg.from_index;
    }
    else {
      resolved.from_index = 0
    }

    if (msg.to_index !== undefined) {
      resolved.to_index = msg.to_index;
    }
    else {
      resolved.to_index = 0
    }

    if (msg.distance !== undefined) {
      resolved.distance = msg.distance;
    }
    else {
      resolved.distance = 0.0
    }

    return resolved;
    }
};

module.exports = Instruction;
