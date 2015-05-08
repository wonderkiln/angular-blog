'use strict'

angular.module 'beepBoopWebsiteApp'
.controller 'MainCtrl', ($scope, $http, socket) ->
  $scope.posts = []

  $scope.is = ['http://dormroomfund.com/img/slider-images/new-york-city.jpg', 'http://www.hilton.com/top-destinations/assets/uploads/hero-images/Destinations_Header_NewYork.jpg']
  $scope.i = $scope.is[Math.floor Math.random() * $scope.is.length]

  $http.get('/api/posts').success (posts) ->
    $scope.posts = posts