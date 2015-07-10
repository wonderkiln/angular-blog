'use strict'

angular.module 'beepBoopWebsiteApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'about',
    url: '/about'
    templateUrl: 'app/about/about.html'
    controller: 'AboutCtrl'
