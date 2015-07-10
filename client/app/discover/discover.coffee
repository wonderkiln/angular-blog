'use strict'

angular.module 'beepBoopWebsiteApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'discover',
    url: '/discover'
    templateUrl: 'app/discover/discover.html'
    controller: 'DiscoverCtrl'
