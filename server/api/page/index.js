'use strict';

var express = require('express');
var controller = require('./page.controller');
var auth = require('../../auth/auth.service');

var router = express.Router();

// Private
router.post('/', auth.hasRole('admin'), controller.create);
router.put('/:id', auth.hasRole('admin'), controller.update);
router.patch('/:id', auth.hasRole('admin'), controller.update);
router.delete('/:id', auth.hasRole('admin'), controller.destroy);

// Public
router.get('/', controller.index);
router.get('/:name', controller.show);
router.post('/upload', controller.upload);
router.get('/uploads/:name', controller.uploads);

module.exports = router;