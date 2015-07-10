/**
 * Main application routes
 */

'use strict';

var errors = require('./components/errors');

module.exports = function(app) {

  // Insert routes below
  app.use('/api/posts', require('./api/post'));
  app.use('/api/users', require('./api/user'));
  app.use('/api/pages', require('./api/page'));
  app.use('/api/comments', require('./api/comment'));

  app.use('/api/s3', require('./api/s3'));

  app.use('/auth', require('./auth'));

  // All undefined asset or api routes should return a 404
  app.route('/:url(api|auth|components|app|bower_components|assets)/*')
   .get(errors[404]);

  // All other routes should redirect to the index.html
  app.route('/*')
    .get(function(req, res) {
      res.sendfile(app.get('appPath') + '/index.html');
    });
};
