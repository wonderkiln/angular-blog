'use strict';

var express = require('express');
var controller = require('./post.controller');
var auth = require('../../auth/auth.service');

var router = express.Router();

// Private
router.post('/', auth.hasRole('admin'), controller.create);
router.put('/:id', auth.hasRole('admin'), controller.update);
router.patch('/:id', auth.hasRole('admin'), controller.update);
router.delete('/:id', auth.hasRole('admin'), controller.destroy);

// Public
router.get('/', controller.index);
router.get('/fields/:fields', controller.index);
// TODO: get '/gameCard = true' -> get all posts that have a game card...
router.get('/:id', controller.show);

module.exports = router;