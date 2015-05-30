'use strict'

angular.module 'beepBoopWebsiteApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngAnimate',
  'btford.socket-io',
  'ui.router'
]
.directive 'redactor', [ ->
  {
    require: '?ngModel'
    link: (scope, element, attributes, controller) ->
      element.redactor
        minHeight: 300
        maxHeight: 300
        changeCallback: ->
          scope.$apply ->
            controller.$setViewValue element.val()
      controller.$render = ->
        $_element = angular.element element
        $_element.redactor 'code.set', controller.$viewValue || ''
  }
]
.directive 'jsonStringToDate', [ ->
  {
    restrict: 'A'
    require: 'ngModel'
    link: (scope, element, attributes, controller) ->
      jsonStrToDate = (str) ->
        new Date str
      controller.$formatters.push jsonStrToDate
  }
]
.directive 'ngFileModel', [ ->
  {
    scope: ngFileModel: '='
    link: (scope, element, attributes) ->
      element.bind 'change', (changeEvent) ->
        scope.$apply ->
          scope.ngFileModel = changeEvent.target.files[0]
  }
]
.directive 'ngFileSrc', [ ->
  {
    restrict: 'A'
    link: (scope, element, attributes) ->
      scope.$watch attributes.ngFileSrc, ->
        fileKey = attributes.ngFileSrc
        file = scope[fileKey]

        if file?
          reader = new FileReader
          reader.onload = (loadEvent) ->
            attributes.$set 'src', loadEvent.target.result
          reader.readAsDataURL file
  }
]
.config ($stateProvider, $urlRouterProvider, $locationProvider, $httpProvider) ->
  $urlRouterProvider
  .otherwise '/reviews'

  $locationProvider.html5Mode true
  $httpProvider.interceptors.push 'authInterceptor'

.factory 'authInterceptor', ($rootScope, $q, $cookieStore, $location) ->
  # Add authorization token to headers
  request: (config) ->
    config.headers = config.headers or {}
    config.headers.Authorization = 'Bearer ' + $cookieStore.get 'token' if $cookieStore.get 'token'
    config

  # Intercept 401s and redirect you to login
  responseError: (response) ->
    if response.status is 401
      $location.path '/login'
      # remove any stale tokens
      $cookieStore.remove 'token'

    $q.reject response

.run ($rootScope, $location, Auth) ->
  # Redirect to login if route requires auth and you're not logged in
  $rootScope.$on '$stateChangeStart', (event, next) ->
    Auth.isLoggedInAsync (loggedIn) ->
      $location.path "/login" if next.authenticate and not loggedIn
