'use strict'

angular.module 'beepBoopWebsiteApp'
.controller 'LoginCtrl', ($scope, Auth, $location) ->

  $scope.user =
    email: 'admin@admin.com'
    password: 'admin'

  $scope.login = ->
    Auth.login
      email: $scope.user.email
      password: $scope.user.password
    .then ->
      $location.path '/'
    .catch (err) ->
      alert err
