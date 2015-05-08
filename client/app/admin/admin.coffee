'use strict'

angular.module 'beepBoopWebsiteApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'admin',
    url: '/admin'
    templateUrl: 'app/admin/admin.html'
    controller: 'AdminCtrl'
  .state 'admin-posts',
    url: '/admin/posts'
    templateUrl: 'app/admin/admin-posts.html'
    controller: 'AdminCtrl'
  .state 'admin-posts-edit',
    url: '/admin/posts/edit/:id'
    templateUrl: 'app/admin/admin-post-add.html'
    controller: 'AdminPostsCtrl'
