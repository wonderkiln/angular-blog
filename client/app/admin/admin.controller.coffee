'use strict'

angular.module 'beepBoopWebsiteApp'
.controller 'AdminCtrl', ($scope, $http, Auth, User) ->

  $http.get('/api/posts').success (posts) ->
    $scope.posts = posts

.controller 'AdminPostsCtrl', ($scope, $http, $stateParams) ->

	url = if $stateParams.hasOwnProperty 'id' then '/api/posts/' + $stateParams.id else '/api/posts'
	$http.get(url).success (r) ->
		$scope.result = r

	$scope.add = (post) ->
		# TODO

	$scope.update = (post) ->
		# TODO

	$scope.delete = (post) ->
		# TODO