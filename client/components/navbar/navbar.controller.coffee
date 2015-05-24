'use strict'

angular.module 'beepBoopWebsiteApp'
.controller 'NavbarCtrl', ($scope, $location, Auth) ->

  $scope.isLoggedIn = Auth.isLoggedIn()
  $scope.currentUser = Auth.getCurrentUser()

  $scope.logout = ->
    Auth.logout()
    $scope.isLoggedIn = false

  $scope.isActive = (route) ->
    $location.path().indexOf(route) > -1
