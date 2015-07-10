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
var Page = require('./page.model');

// Get list of pages
exports.index = function(req, res) {
  Page.find({}, function (err, pages) {
    if(err) { return handleError(res, err); }
    return res.json(200, pages);
  });
};

// Upload a photo for a post
exports.upload = function(req, res) {
  return res.json(200, {
    filelink: '/api/pages/' + req.files.file.path
  });
};

// Upload a photo for a post
exports.uploads = function(req, res) {
  res.writeHead(200, {'Content-Type': 'image/jpeg'} );
  var path = './uploads/' + req.params.name;
  var fileStream = fs.createReadStream(path);
  fileStream.pipe(res);
};

// Get a single page
exports.show = function(req, res) {
  Page.findOne({ name: req.params.name }, function (err, page) {
    if(err) { return handleError(res, err); }
    if(!page) { // if page doesn't exist, create it and then return it
      Page.create({ name: req.params.name }, function(err, page) {
        if(err) { return handleError(res, err); }
        return res.json(201, page);
      });
    }
    return res.json(page);
  });
};

// Creates a new page in the DB.
exports.create = function(req, res) {
  Page.create(req.body, function(err, page) {
    if(err) { return handleError(res, err); }
    return res.json(201, page);
  });
};

// Updates an existing page in the DB.
exports.update = function(req, res) {
  if(req.body._id) { delete req.body._id; }
  Page.findById(req.params.id, function (err, page) {
    if (err) { return handleError(res, err); }
    if(!page) { return res.send(404); }
    var updated = _.merge(page, req.body, function(a, b) {
      if (_.isArray(a)) {
        return b;
      }
    });
    updated.save(function (err) {
      if (err) { return handleError(res, err); }
      return res.json(200, page);
    });
  });
};

// Deletes a page from the DB.
exports.destroy = function(req, res) {
  Page.findById(req.params.id, function (err, page) {
    if(err) { return handleError(res, err); }
    if(!page) { return res.send(404); }
    page.remove(function(err) {
      if(err) { return handleError(res, err); }
      return res.send(204);
    });
  });
};

function handleError(res, err) {
  return res.send(500, err);
}
