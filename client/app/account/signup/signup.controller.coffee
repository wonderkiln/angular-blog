'use strict'

getFileUrl = (file, callback) ->
  reader = new FileReader
  reader.onload = (loadEvent) ->
    callback loadEvent.target.result
  reader.readAsDataURL file

uploadFile = ($scope, S3, file, callback) ->
  if file
    $scope.progress = 0
    S3.upload file, (finished, progress, err, url) ->
      $scope.$apply ->
        if !finished
          $scope.progress = progress
        else
          delete $scope.progress
          callback url
  else
    callback ''

angular.module 'beepBoopWebsiteApp'
.controller 'SignupCtrl', ($scope, $http, $location, S3) ->

  $scope.photoFileChanged = (input) ->
    $scope.newPhotoFile = input.files[0]
    getFileUrl $scope.newPhotoFile, (url) ->
      $scope.$apply ->
        $scope.newPhoto = url

  $scope.register = (user) ->
    uploadFile $scope, S3, $scope.newPhotoFile, (url) ->
      user.photo = url
      $http.post('/api/users/register', user).success ->
        $location.path '/login'
