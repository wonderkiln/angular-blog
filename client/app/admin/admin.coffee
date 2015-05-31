'use strict'

angular.module 'beepBoopWebsiteApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'posts',
    url: '/admin/posts'
    templateUrl: 'app/admin/posts/index.html'
    controller: 'AdminPostsCtrl'
    authenticate: true

  .state 'users',
    url: '/admin/users'
    templateUrl: 'app/admin/users/index.html'
    controller: 'AdminUsersCtrl'
    authenticate: true
