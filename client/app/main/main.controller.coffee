'use strict'

angular.module 'beepBoopWebsiteApp'
.controller 'MainCtrl', ($scope, $http, socket) ->

  $http.get('/api/posts').success (posts) ->
    $scope.posts = posts

  $scope.getColor = (index) ->
    colors = ['#F0B67F', '#FE5F55', '#D6D1B1', '#C7EFCF', '#EEF5DB']
    colors[index % colors.length]

  $scope.getTile = (index) ->
    tiles = ['tile-50', 'tile-50', 'tile-25', 'tile-75', 'tile-25', 'tile-25', 'tile-25', 'tile-25']
    if index == 0 then 'tile-100 big' else tiles[(index - 1) % tiles.length]
