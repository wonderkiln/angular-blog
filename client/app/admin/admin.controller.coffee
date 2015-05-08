'use strict'

angular.module 'beepBoopWebsiteApp'
.controller 'AdminCtrl', ($scope, $http, Auth, User) ->

  $http.get('/api/posts').success (posts) ->
    $scope.posts = posts

.controller 'AdminPostsCtrl', ($scope, $http, Auth, User) ->

	$scope.add = (post) ->
		# TODO

	$scope.update = (post) ->
		# TODO

	$scope.delete = (post) ->
		# TODO