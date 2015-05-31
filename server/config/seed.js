/**
 * Populate DB with sample data on server start
 * to disable, edit config/environment/index.js, and set `seedDB: false`
 */

'use strict';

var Post = require('../api/post/post.model');
var User = require('../api/user/user.model');

Post.find({}).remove(function() {
  for(var i = 1; i <= 10; i++) {
    Post.create({
      title: 'Assassin\'s Creed II Mega Review no. ' + i,
      tags: ['tag1', 'tag2', 'tag3'],
      content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      cover: 'http://lorempixel.com/g/400/200/',
      gameCard: {
        enabled: true
      }
    });
  }
});

User.find({}).remove(function() {
  User.create({
    provider: 'local',
    name: 'Test User',
    email: 'test@test.com',
    password: 'test',
    photo: 'http://lorempixel.com/g/400/200/'
  }, {
    provider: 'local',
    name: 'Adrian Mateoaea',
    email: 'adrian@test.com',
    password: 'adrian',
    photo: 'http://lorempixel.com/g/400/200/'
  }, {
    provider: 'local',
    name: 'Austin Kettner',
    email: 'austin@test.com',
    password: 'austin',
    photo: 'http://lorempixel.com/g/400/200/'
  }, {
    provider: 'local',
    role: 'admin',
    name: 'Admin',
    email: 'admin@admin.com',
    password: 'admin',
    photo: 'http://lorempixel.com/g/400/200/'
  }, function() {
      console.log('finished populating users');
    }
  );
});