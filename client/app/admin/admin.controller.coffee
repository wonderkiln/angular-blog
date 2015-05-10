'use strict'

angular.module 'beepBoopWebsiteApp'
.controller 'AdminCtrl', ($scope, $http, Auth, User) ->

  $http.get('/api/posts').success (posts) ->
    $scope.posts = posts

  $scope.toggleFeatured = (checked) ->
    # TODO

  $scope.togglePublished = (checked) ->
    # TODO

  $scope.delete = (post) ->
    # TODO

.controller 'AdminPostsCtrl', ($scope, $http, $stateParams) ->

  $http.get('/api/users').success (users) ->
    $scope.users = users

  url = if $stateParams.hasOwnProperty 'id' then '/api/posts/' + $stateParams.id else '/api/posts'
  $http.get(url).success (r) ->
    $scope.result = r

  $scope.add = (post) ->
    # TODO

  $scope.update = (post) ->
    # TODO

  $scope.delete = (post) ->
    # TODO

  $scope.filterAlreadyAdded = (post) ->
    $scope.users not in $scope.result.authors
