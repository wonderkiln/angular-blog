'use strict'

angular.module 'beepBoopWebsiteApp'
.controller 'NavbarCtrl', ($scope, $location, Auth) ->

  $scope.isLoggedIn = Auth.isLoggedIn()
  $scope.currentUser = Auth.getCurrentUser()
  $scope.isAdmin = Auth.isAdmin()

  $scope.user =
    email: 'admin@admin.com'
    password: 'admin'

  $scope.login = ->
    Auth.login $scope.user
    .then ->
      window.location.reload()
    .catch (err) ->
      alert err

  $scope.logout = ->
    Auth.logout()
    window.location.reload()

  $scope.isActive = (route) ->
    $location.path().indexOf(route) > -1
