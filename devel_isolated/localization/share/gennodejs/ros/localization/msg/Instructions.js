// Auto-generated. Do not edit!

// (in-package localization.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Instruction = require('./Instruction.js');

//-----------------------------------------------------------

class Instructions {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.instructions = null;
    }
    else {
      if (initObj.hasOwnProperty('instructions')) {
        this.instructions = initObj.instructions
      }
      else {
        this.instructions = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Instructions
    // Serialize message field [instructions]
    // Serialize the length for message field [instructions]
    bufferOffset = _serializer.uint32(obj.instructions.length, buffer, bufferOffset);
    obj.instructions.forEach((val) => {
      bufferOffset = Instruction.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Instructions
    let len;
    let data = new Instructions(null);
    // Deserialize message field [instructions]
    // Deserialize array length for message field [instructions]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.instructions = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.instructions[i] = Instruction.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 24 * object.instructions.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'localization/Instructions';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f704a970ca19812bcb8e91d7be98e4b3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Instruction[] instructions
    
    ================================================================================
    MSG: localization/Instruction
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
    const resolved = new Instructions(null);
    if (msg.instructions !== undefined) {
      resolved.instructions = new Array(msg.instructions.length);
      for (let i = 0; i < resolved.instructions.length; ++i) {
        resolved.instructions[i] = Instruction.Resolve(msg.instructions[i]);
      }
    }
    else {
      resolved.instructions = []
    }

    return resolved;
    }
};

module.exports = Instructions;
