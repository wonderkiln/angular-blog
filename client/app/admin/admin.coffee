'use strict'

angular.module 'beepBoopWebsiteApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'admin-posts',
    url: '/admin/posts'
    templateUrl: 'app/admin/posts/index.html'
    controller: 'AdminPostsCtrl'
  .state 'admin-users',
    url: '/admin/users'
    templateUrl: 'app/admin/users/index.html'
    controller: 'AdminUsersCtrl'
