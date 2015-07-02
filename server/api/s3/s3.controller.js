/**
 * Using Rails-like standard naming convention for endpoints.
 * GET     /:folder/:prefix    ->  index
 */

'use strict';

var config = require('../../config/environment');
var randomstring = require('randomstring');

// Gets the credentials
exports.credentials = function(req, res) {
  res.json(200, { // TODO: get keys from ENV
    region: 'us-east-1',
    accessKeyId: config.s3.key,
    secretAccessKey: config.s3.secret
  });
};

// Generates a random key
exports.generate = function(req, res) {
  var name = req.params.prefix + '-' + randomstring.generate(10);
  var key = config.s3.folder + '/' + req.params.folder + '/' + name;
  res.json(200, {
    Bucket: config.s3.bucket,
    Key: key
  });
};
