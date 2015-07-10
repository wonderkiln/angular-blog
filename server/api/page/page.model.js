'use strict';

var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var PageSchema = new Schema({
	name: String,
	content: String
});

module.exports = mongoose.model('Page', PageSchema);