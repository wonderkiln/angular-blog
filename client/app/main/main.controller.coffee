'use strict'

angular.module 'beepBoopWebsiteApp'
.controller 'MainCtrl', ($scope, $http) ->

  $http.get('/api/posts').success (posts) ->
    $scope.posts = posts

  $scope.getColor = (index) ->
    colors = ['#26ADE4', '#FE5F55', '#009BA2', '#E89509', '#458585']
    colors[index % colors.length]

  $scope.getTile = (index) ->
    tiles = ['tile-50', 'tile-50', 'tile-25', 'tile-75', 'tile-50', 'tile-50', 'tile-75', 'tile-25']

    if index == 0
      return 'tile-100 big'

    if index == $scope.posts.length - 1 && $scope.posts.length % 2 == 0
      return 'tile-100'

    return tiles[(index - 1) % tiles.length]

.controller 'MainDetailCtrl', ($scope, $http, $stateParams, Auth) ->

  $scope.me = Auth.getCurrentUser()

  $http.get('/api/posts/' + $stateParams.id).success (post) ->
    $scope.post = post

  $http.get('/api/comments/' + $stateParams.id).success (comments) ->
    $scope.comments = comments

  $scope.addComment = (comment) ->
    comment.postId = $stateParams.id
    comment.user = $scope.me
    $http.post('/api/comments', comment).success (newComment) ->
      $scope.comments.push newComment
      delete $scope.comment

  $(window).scroll ->
    $('#cover').css
      opacity: 1 - ($(window).scrollTop() / $(window).height())
