'use strict';

var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var ReviewSchema = new Schema({
  title: String,
  description: String,
  cover: String,
  type: String,
  color: String,
  platforms: []
});

module.exports = mongoose.model('Review', ReviewSchema);