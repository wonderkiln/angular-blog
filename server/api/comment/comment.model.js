'use strict';

var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var CommentSchema = new Schema({
  postId: String,
  date: { type: Date, default: Date.now },
  name: String,
	content: String
});

module.exports = mongoose.model('Comment', CommentSchema);
