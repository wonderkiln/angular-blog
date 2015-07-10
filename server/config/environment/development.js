'use strict';

// Development specific configuration
// ==================================
module.exports = {
  // MongoDB connection options
  mongo: {
    uri: 'mongodb://localhost/beepboopwebsite-dev'
  },

  seedDB: true,

  s3: {
    folder: '',
    bucket: '',
    key: '',
    secret: ''
  }
};
