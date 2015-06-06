'use strict'

angular.module 'beepBoopWebsiteApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'main',
    url: '/reviews'
    templateUrl: 'app/main/main.html'
    controller: 'MainCtrl'
  .state 'main-detail',
    url: '/reviews/:id'
    templateUrl: 'app/main/main-detail.html'
    controller: 'MainDetailCtrl'
