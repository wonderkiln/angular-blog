'use strict'

angular.module 'beepBoopWebsiteApp'
.controller 'AboutCtrl', ($scope, $http) ->

  $http.get('/api/pages/about').success (page) ->
    $scope.page = page
