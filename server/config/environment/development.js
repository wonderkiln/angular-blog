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
    key: "AKIAJH4JBCHEUNK4FBMA",
    secret: "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"
  }
};
