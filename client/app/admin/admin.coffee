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
    templateUrl: 'app/admin/posts/posts.html'
    controller: 'AdminCtrl'
  .state 'admin-posts-add',
    url: '/admin/posts/add'
    templateUrl: 'app/admin/posts/form.html'
    controller: 'AdminPostsCtrl'
  .state 'admin-posts-edit',
    url: '/admin/posts/edit/:id'
    templateUrl: 'app/admin/posts/form.html'
    controller: 'AdminPostsCtrl'
  .state 'admin-users',
    url: '/admin/users'
    templateUrl: 'app/admin/users/users.html'
    controller: 'AdminCtrl'
  .state 'admin-users-add',
    url: '/admin/users/add'
    templateUrl: 'app/admin/users/form.html'
    controller: 'AdminUsersCtrl'
  .state 'admin-users-edit',
    url: '/admin/users/edit/:id'
    templateUrl: 'app/admin/users/form.html'
    controller: 'AdminUsersCtrl'
