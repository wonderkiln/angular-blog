/**
 * Using Rails-like standard naming convention for endpoints.
 * GET     /pages              ->  index
 * POST    /pages              ->  create
 * GET     /pages/:id          ->  show
 * PUT     /pages/:id          ->  update
 * DELETE  /pages/:id          ->  destroy
 */

'use strict';

var fs = require('fs');
var _ = require('lodash');
var Comment = require('./comment.model');

// Get list of pages
exports.index = function(req, res) {
  Comment.find({ 'postId': req.params.postId }, function (err, comments) {
    if(err) { return handleError(res, err); }
    return res.json(200, comments);
  });
};

// Creates a new comment in the DB.
exports.create = function(req, res) {
  Comment.create(req.body, function(err, comment) {
    if(err) { return handleError(res, err); }
    return res.json(201, comment);
  });
};

// Updates an existing comment in the DB.
exports.update = function(req, res) {
  if(req.body._id) { delete req.body._id; }
  Comment.findById(req.params.id, function (err, comment) {
    if (err) { return handleError(res, err); }
    if(!comment) { return res.send(404); }
    var updated = _.merge(comment, req.body, function(a, b) {
      if (_.isArray(a)) {
        return b;
      }
    });
    updated.save(function (err) {
      if (err) { return handleError(res, err); }
      return res.json(200, comment);
    });
  });
};

// Deletes a comment from the DB.
exports.destroy = function(req, res) {
  Comment.findById(req.params.id, function (err, comment) {
    if(err) { return handleError(res, err); }
    if(!comment) { return res.send(404); }
    comment.remove(function(err) {
      if(err) { return handleError(res, err); }
      return res.send(204);
    });
  });
};

function handleError(res, err) {
  return res.send(500, err);
}
