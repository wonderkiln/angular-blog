'use strict'

angular.module 'beepBoopWebsiteApp'
.controller 'SignupCtrl', ($scope, $http, $location) ->

  $scope.register = (user) ->
    $http.post('/api/users/register', user).success ->
      $location.path '/login'
