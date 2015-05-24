'use strict'

angular.module 'beepBoopWebsiteApp'
.controller 'AdminCtrl', ($scope, $http, Auth, User) ->

  $http.get('/api/posts').success (posts) ->
    $scope.posts = posts

  $scope.toggleFeatured = (post) ->
    post.featured = !post.featured
    $http.put '/api/posts/' + post._id, post

  $scope.togglePublished = (post) ->
    post.published = !post.published
    $http.put '/api/posts/' + post._id, post

  $scope.delete = (post) ->
    # TODO

.controller 'AdminPostsCtrl', ($scope, $http, $stateParams) ->

  $http.get('/api/users').success (users) ->
    $scope.users = users

  url = if $stateParams.hasOwnProperty 'id' then '/api/posts/' + $stateParams.id else '/api/posts'
  $http.get(url).success (result) ->
    $scope.result = result

  $scope.add = (post) ->
    $http.post '/api/posts', post

  $scope.update = (post) ->
    $http.put '/api/posts/' + post._id, post

  $scope.togglePlatform = (platform) ->
    index = $scope.result.gameCard.platforms.indexOf(platform)
    if index == -1
      $scope.result.gameCard.platforms.push(platform)
    else
      $scope.result.gameCard.platforms.splice(index, 1)
