'use strict'

angular.module 'beepBoopWebsiteApp'
.controller 'NavbarCtrl', ($scope, $location, Auth) ->

  $scope.isLoggedIn = Auth.isLoggedIn()

  $scope.user =
    email: 'admin@admin.com'
    password: 'admin'

  $scope.login = ->
    Auth.login
      email: $scope.user.email
      password: $scope.user.password
    .then ->
      $scope.isLoggedIn = true
    .catch (err) ->
      alert err

  $scope.logout = ->
    Auth.logout()
    $scope.isLoggedIn = false

  $scope.isActive = (route) ->
    $location.path().indexOf(route) > -1
