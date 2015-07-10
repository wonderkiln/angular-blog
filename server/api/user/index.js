'use strict';

var express = require('express');
var controller = require('./user.controller');
var config = require('../../config/environment');
var auth = require('../../auth/auth.service');

var router = express.Router();

// Private
router.get('/', auth.hasRole('admin'), controller.index);
router.get('/fields/:fields', auth.hasRole('admin'), controller.index);
// TODO: get '/:role?' -> all users that have the role...
router.delete('/:id', auth.hasRole('admin'), controller.destroy);
router.put('/:id', auth.hasRole('admin'), controller.update);
router.post('/', auth.hasRole('admin'), controller.create);

// Public
router.get('/me', auth.isAuthenticated(), controller.me);
router.get('/:id', auth.isAuthenticated(), controller.show);
router.put('/:id/password', auth.isAuthenticated(), controller.changePassword);
router.post('/register', controller.register);

module.exports = router;
