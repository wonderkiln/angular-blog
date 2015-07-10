'use strict';

var express = require('express');
var controller = require('./s3.controller');
var auth = require('../../auth/auth.service');

var router = express.Router();

router.get('/credentials', auth.hasRole('admin'), controller.credentials);
router.get('/generate/:folder/:prefix', controller.generate);

module.exports = router;
