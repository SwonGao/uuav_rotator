// Auto-generated. Do not edit!

// (in-package setvelplugin.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class rotateRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.degree = null;
    }
    else {
      if (initObj.hasOwnProperty('degree')) {
        this.degree = initObj.degree
      }
      else {
        this.degree = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type rotateRequest
    // Serialize message field [degree]
    bufferOffset = _serializer.float32(obj.degree, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type rotateRequest
    let len;
    let data = new rotateRequest(null);
    // Deserialize message field [degree]
    data.degree = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'setvelplugin/rotateRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '431b404e813e79a9f53659dd93110f14';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 degree
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new rotateRequest(null);
    if (msg.degree !== undefined) {
      resolved.degree = msg.degree;
    }
    else {
      resolved.degree = 0.0
    }

    return resolved;
    }
};

class rotateResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type rotateResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type rotateResponse
    let len;
    let data = new rotateResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'setvelplugin/rotateResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new rotateResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: rotateRequest,
  Response: rotateResponse,
  md5sum() { return '431b404e813e79a9f53659dd93110f14'; },
  datatype() { return 'setvelplugin/rotate'; }
};
