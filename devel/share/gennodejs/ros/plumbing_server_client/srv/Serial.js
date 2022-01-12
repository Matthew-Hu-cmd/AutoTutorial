// Auto-generated. Do not edit!

// (in-package plumbing_server_client.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class SerialRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.InputData = null;
    }
    else {
      if (initObj.hasOwnProperty('InputData')) {
        this.InputData = initObj.InputData
      }
      else {
        this.InputData = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SerialRequest
    // Serialize message field [InputData]
    bufferOffset = _arraySerializer.string(obj.InputData, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SerialRequest
    let len;
    let data = new SerialRequest(null);
    // Deserialize message field [InputData]
    data.InputData = _arrayDeserializer.string(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.InputData.forEach((val) => {
      length += 4 + val.length;
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'plumbing_server_client/SerialRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e89ba793d64173265bf57d3300c00a82';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string[] InputData
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SerialRequest(null);
    if (msg.InputData !== undefined) {
      resolved.InputData = msg.InputData;
    }
    else {
      resolved.InputData = []
    }

    return resolved;
    }
};

class SerialResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.OutputData = null;
    }
    else {
      if (initObj.hasOwnProperty('OutputData')) {
        this.OutputData = initObj.OutputData
      }
      else {
        this.OutputData = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SerialResponse
    // Serialize message field [OutputData]
    bufferOffset = _arraySerializer.string(obj.OutputData, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SerialResponse
    let len;
    let data = new SerialResponse(null);
    // Deserialize message field [OutputData]
    data.OutputData = _arrayDeserializer.string(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.OutputData.forEach((val) => {
      length += 4 + val.length;
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'plumbing_server_client/SerialResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd9dc026d88d5c227f79b32bbb5ad0e23';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string[] OutputData
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SerialResponse(null);
    if (msg.OutputData !== undefined) {
      resolved.OutputData = msg.OutputData;
    }
    else {
      resolved.OutputData = []
    }

    return resolved;
    }
};

module.exports = {
  Request: SerialRequest,
  Response: SerialResponse,
  md5sum() { return 'a706874ecb124873b6727a0a5b02b832'; },
  datatype() { return 'plumbing_server_client/Serial'; }
};
