'use strict'

angular.module 'beepBoopWebsiteApp'
.controller 'LoginCtrl', ($scope, Auth, $location, $window) ->
  $scope.user = {email: 'admin@admin.com', password: 'admin'}
  $scope.errors = {}
  $scope.login = (form) ->
    $scope.submitted = true

    if form.$valid
      # Logged in, redirect to home
      Auth.login
        email: $scope.user.email
        password: $scope.user.password

      .then ->
        $location.path '/'

      .catch (err) ->
        $scope.errors.other = err.message

  $scope.loginOauth = (provider) ->
    $window.location.href = '/auth/' + provider
