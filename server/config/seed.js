/**
 * Populate DB with sample data on server start
 * to disable, edit config/environment/index.js, and set `seedDB: false`
 */

'use strict';

var Review = require('../api/review/review.model');
var Thing = require('../api/thing/thing.model');
var User = require('../api/user/user.model');

Review.find({}).remove(function() {
  var a = ['tile-50', 'tile-50', 'tile-25', 'tile-75'];
  Review.create({
    title: 'Review big header',
    description: 'Bacon ipsum dolor amet spare ribs bacon andouille drumstick alcatra. Kielbasa andouille turkey jowl filet mignon porchetta spare ribs flank meatball tenderloin strip steak turducken pancetta pork chop chuck. T-bone ground round pig strip steak. Filet mignon tongue hamburger, sirloin jerky pastrami strip steak short ribs pig turkey pork loin jowl drumstick kevin. Spare ribs venison andouille brisket beef ribs turkey ham rump meatball bresaola ham hock pork chop kevin shank. Meatloaf short loin andouille tenderloin, beef ribs ribeye pork picanha kevin. Filet mignon beef shoulder picanha cupim. Corned beef spare ribs turkey shank shankle. Cow meatloaf tail pork boudin pork chop ham hock pork belly pork loin. Alcatra pork chop pastrami chicken meatloaf tri-tip chuck shank, brisket salami beef ground round sausage. Picanha ground round beef, cupim pig corned beef shank short ribs. Bacon strip steak beef, swine salami ball tip pork chop meatloaf fatback hamburger alcatra doner. Landjaeger strip steak meatloaf capicola porchetta rump cupim sausage picanha bacon leberkas. Beef ribs venison andouille tri-tip jowl. Beef filet mignon cupim sausage turkey cow shankle venison leberkas t-bone. T-bone pork ham, bacon kevin shank rump doner sausage beef short ribs. Tenderloin ham hock leberkas spare ribs tri-tip chuck drumstick shankle hamburger bacon meatloaf shoulder pork loin pig. Tenderloin meatball bresaola cupim tri-tip, tail pork chop short loin shoulder boudin porchetta t-bone ham hock filet mignon. Pork belly picanha cupim spare ribs. Venison chuck tenderloin kevin jerky shoulder. Chuck cow short loin porchetta, shoulder capicola frankfurter. Capicola kielbasa turkey spare ribs salami turducken pork belly t-bone drumstick beef ribs. Andouille tri-tip salami t-bone kevin pancetta ham rump alcatra bresaola strip steak. Hamburger filet mignon ham, pork chop fatback ribeye sirloin turkey rump kevin brisket boudin short loin. Beef ribs kielbasa short loin, swine biltong meatball porchetta kevin. Does your lorem ipsum text long for something a little meatier? Give our generator a try… it’s tasty!',
    cover: 'http://downloadgamestorrents.com/wp-content/uploads/2013/07/Grand-Theft-Auto-5-XBOX-360.jpg',
    type: 'tile-100',
    platforms: ['apple', 'android', 'windows']
  });
  for(var i = 1; i <= 10; i++) {
    Review.create({
      title: 'Review number #' + i,
      description: 'Bacon ipsum dolor amet spare ribs bacon andouille drumstick alcatra. Kielbasa andouille turkey jowl filet mignon porchetta spare ribs flank meatball tenderloin strip steak turducken pancetta pork chop chuck. T-bone ground round pig strip steak. Filet mignon tongue hamburger, sirloin jerky pastrami strip steak short ribs pig turkey pork loin jowl drumstick kevin. Spare ribs venison andouille brisket beef ribs turkey ham rump meatball bresaola ham hock pork chop kevin shank. Meatloaf short loin andouille tenderloin, beef ribs ribeye pork picanha kevin. Filet mignon beef shoulder picanha cupim. Corned beef spare ribs turkey shank shankle. Cow meatloaf tail pork boudin pork chop ham hock pork belly pork loin. Alcatra pork chop pastrami chicken meatloaf tri-tip chuck shank, brisket salami beef ground round sausage. Picanha ground round beef, cupim pig corned beef shank short ribs. Bacon strip steak beef, swine salami ball tip pork chop meatloaf fatback hamburger alcatra doner. Landjaeger strip steak meatloaf capicola porchetta rump cupim sausage picanha bacon leberkas. Beef ribs venison andouille tri-tip jowl. Beef filet mignon cupim sausage turkey cow shankle venison leberkas t-bone. T-bone pork ham, bacon kevin shank rump doner sausage beef short ribs. Tenderloin ham hock leberkas spare ribs tri-tip chuck drumstick shankle hamburger bacon meatloaf shoulder pork loin pig. Tenderloin meatball bresaola cupim tri-tip, tail pork chop short loin shoulder boudin porchetta t-bone ham hock filet mignon. Pork belly picanha cupim spare ribs. Venison chuck tenderloin kevin jerky shoulder. Chuck cow short loin porchetta, shoulder capicola frankfurter. Capicola kielbasa turkey spare ribs salami turducken pork belly t-bone drumstick beef ribs. Andouille tri-tip salami t-bone kevin pancetta ham rump alcatra bresaola strip steak. Hamburger filet mignon ham, pork chop fatback ribeye sirloin turkey rump kevin brisket boudin short loin. Beef ribs kielbasa short loin, swine biltong meatball porchetta kevin. Does your lorem ipsum text long for something a little meatier? Give our generator a try… it’s tasty!',
      cover: 'http://downloadgamestorrents.com/wp-content/uploads/2013/07/Grand-Theft-Auto-5-XBOX-360.jpg',
      type: a[(i - 1) % a.length],
      platforms: ['apple', 'android', 'windows']
    });
  }
});

Thing.find({}).remove(function() {
  Thing.create({
    name : 'Development Tools',
    info : 'Integration with popular tools such as Bower, Grunt, Karma, Mocha, JSHint, Node Inspector, Livereload, Protractor, Jade, Stylus, Sass, CoffeeScript, and Less.'
  }, {
    name : 'Server and Client integration',
    info : 'Built with a powerful and fun stack: MongoDB, Express, AngularJS, and Node.'
  }, {
    name : 'Smart Build System',
    info : 'Build system ignores `spec` files, allowing you to keep tests alongside code. Automatic injection of scripts and styles into your index.html'
  },  {
    name : 'Modular Structure',
    info : 'Best practice client and server structures allow for more code reusability and maximum scalability'
  },  {
    name : 'Optimized Build',
    info : 'Build process packs up your templates as a single JavaScript payload, minifies your scripts/css/images, and rewrites asset names for caching.'
  },{
    name : 'Deployment Ready',
    info : 'Easily deploy your app to Heroku or Openshift with the heroku and openshift subgenerators'
  });
});

User.find({}).remove(function() {
  User.create({
    provider: 'local',
    name: 'Test User',
    email: 'test@test.com',
    password: 'test'
  }, {
    provider: 'local',
    role: 'admin',
    name: 'Admin',
    email: 'admin@admin.com',
    password: 'admin'
  }, function() {
      console.log('finished populating users');
    }
  );
});