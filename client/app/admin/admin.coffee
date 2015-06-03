'use strict'

angular.module 'beepBoopWebsiteApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'admin-posts',
    url: '/admin/posts'
    templateUrl: 'app/admin/posts/index.html'
    controller: 'AdminPostsCtrl'
    authenticate: true

  .state 'admin-users',
    url: '/admin/users'
    templateUrl: 'app/admin/users/index.html'
    controller: 'AdminUsersCtrl'
    authenticate: true

  .state 'admin-about',
    url: '/admin/about'
    templateUrl: 'app/admin/about/index.html'
    controller: 'AdminAboutCtrl'
    authenticate: true
