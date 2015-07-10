/**
 * Populate DB with sample data on server start
 * to disable, edit config/environment/index.js, and set `seedDB: false`
 */

'use strict';

var Post = require('../api/post/post.model');
var User = require('../api/user/user.model');

// Let's get posts from: googleblog.blogspot.com
Post.find({}).remove(function() {

  var http = require('http');
  var url = 'http://googleblog.blogspot.com/feeds/posts/default?alt=json';

  http.get(url, function(res) {
    var body = '';

    res.on('data', function(data) {
        body += data;
    });

    res.on('end', function() {
      var json = JSON.parse(body);
      var items = json.feed.entry;

      for(var i = 0; i < items.length; i++) {
        Post.create({
          title: items[i].title.$t,
          content: items[i].content.$t,
          cover: ('media$thumbnail' in items[i] ? items[i].media$thumbnail.url : 'http://lorempixel.com/400/200/'),
          date: ('published' in items[i] ? items[i].published.$t : new Date()),
          gameCard: {
            enabled: true
          }
        });
      }
    });
  });
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
