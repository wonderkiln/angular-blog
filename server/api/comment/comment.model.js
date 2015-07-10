'use strict';

var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var CommentSchema = new Schema({
  postId: String,
  commentId: String,
  date: { type: Date, default: Date.now },
  user: {},
	content: String
});

module.exports = mongoose.model('Comment', CommentSchema);
