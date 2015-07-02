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
    folder: 'development-content',
    bucket: 'beepboop-website',
    key: "***REMOVED***",
    secret: "***REMOVED***"
  }
};
