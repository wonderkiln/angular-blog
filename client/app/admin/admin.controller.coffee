'use strict'

angular.module 'beepBoopWebsiteApp'
.controller 'AdminCtrl', ($scope, $http, Auth, User) ->

  $http.get('/api/posts').success (posts) ->
    $scope.posts = posts

  $http.get('/api/users').success (users) ->
    $scope.users = users

  $scope.toggleFeatured = (post) ->
    post.featured = !post.featured
    $http.put '/api/posts/' + post._id, post

  $scope.togglePublished = (post) ->
    post.published = !post.published
    $http.put '/api/posts/' + post._id, post

  $scope.deletePost = (post) ->
    if confirm 'Delete'
      $http.delete '/api/posts/' + post._id
      .success ->
        index = $scope.posts.indexOf post
        $scope.posts.splice index, 1

  $scope.toggleRole = (user) ->
    user.role = if user.role == 'admin' then 'user' else 'admin'
    $http.put '/api/users/' + user._id + '/role', user

  $scope.deleteUser = (user) ->
    if confirm 'Delete'
      $http.delete '/api/users/' + user._id
      .success ->
        index = $scope.users.indexOf user
        $scope.users.splice index, 1

.controller 'AdminPostsCtrl', ($scope, $http, $stateParams, S3) ->

  $scope.result = {}

  $scope.toggleRelevantGame = (checked) ->
    alert if checked then 'YES' else 'NO'

  $http.get('/api/users').success (users) ->
    $scope.users = users

  $http.get('/api/posts').success (posts) ->
    $scope.posts = posts

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

.controller 'AdminUsersCtrl', ($scope, $http, $window, S3) ->

  $scope.user = {}

  $scope.upload = ->
    S3.upload $scope.photoFile, (finished, progress, err, url) ->
      $scope.$apply ->
        $scope.user.photo = url if finished

  $scope.delete = ->
    delete $scope.photoFile
    delete $scope.user.photo

  $scope.addUser = (user) ->
    $http.post '/api/users', user
    .success ->
      $window.history.back()
