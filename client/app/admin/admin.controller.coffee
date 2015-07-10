'use strict'

getFileUrl = (file, callback) ->
  reader = new FileReader
  reader.onload = (loadEvent) ->
    callback loadEvent.target.result
  reader.readAsDataURL file

uploadFile = ($scope, S3, folder, file, callback) ->
  delete $scope.progress
  if file
    S3.uploadFileToFolder folder, 'image', file, ((err, url) ->
      callback url unless err
    ), (progress) ->
      $scope.$apply ->
        $scope.progress = progress
  else
    callback ''

angular.module 'beepBoopWebsiteApp'
.controller 'AdminPostsCtrl', ($scope, $http, S3) ->

  $scope.removeFromList = (list, item) ->
    list.splice list.indexOf item, 1

  $scope.addToList = (list, item) ->
    list.push item

  $scope.toggleItemInList = (list, item) ->
    index = list.indexOf item
    if index == -1
      list.push item
    else
      list.splice index, 1

  $scope.photoFileChanged = (input) ->
    $scope.newPhotoFile = input.files[0]
    getFileUrl $scope.newPhotoFile, (url) ->
      $scope.$apply ->
        $scope.newPhoto = url

  $http.get('/api/posts').success (posts) ->
    $scope.posts = posts

  $http.get('/api/posts/fields/title').success (relevant) ->
    $scope.relevant = relevant

  $http.get('/api/users/fields/name,role').success (users) ->
    $scope.users = users

  $scope.select = (post) ->
    delete $scope.newPhotoFile
    delete $scope.newPhoto
    delete $scope.isNewPost
    $scope.selectedPost = post

  $scope.create = ->
    $scope.isNewPost = true
    $scope.selectedPost =
      authors: []
      tags: []
      gameCard:
        platforms: []
        relevantGameIds: []

  $scope.removeImage = (url) ->
    S3.deleteFile url, (err) ->
      $scope.$apply ->
        $scope.selectedPost.cover = '' unless err

  $scope.publish = (post) ->
    uploadFile $scope, S3, $scope.selectedPost.title, $scope.newPhotoFile, (url) ->
      post.cover = url
      $http.post('/api/posts', post).success (newPost) ->
        $scope.posts.push newPost
        $scope.selectedPost = newPost
        delete $scope.isNewPost

  $scope.save = (post) ->
    uploadFile $scope, S3, $scope.selectedPost.title, $scope.newPhotoFile, (url) ->
      post.cover = url
      $http.put '/api/posts/' + post._id, post

  $scope.delete = (post) ->
    if confirm 'Delete'
      $http.delete('/api/posts/' + post._id).success ->
        $scope.posts.splice $scope.posts.indexOf post, 1
        delete $scope.selectedPost

.controller 'AdminUsersCtrl', ($scope, $http, S3) ->

  $scope.photoFileChanged = (input) ->
    $scope.newPhotoFile = input.files[0]
    getFileUrl $scope.newPhotoFile, (url) ->
      $scope.$apply ->
        $scope.newPhoto = url

  $http.get('/api/users').success (users) ->
    $scope.users = users

  $scope.select = (user) ->
    delete $scope.newPhotoFile
    delete $scope.newPhoto
    delete $scope.isNewUser
    $scope.selectedUser = user

  $scope.create = ->
    $scope.isNewUser = true
    $scope.selectedUser = {}

  $scope.register = (user) ->
    uploadFile $scope, S3, user.name, $scope.newPhotoFile, (url) ->
      user.photo = url
      $http.post('/api/users', user).success (newUser) ->
        $scope.users.push newUser
        $scope.selectedUser = newUser
        delete $scope.isNewUser

  $scope.save = (user) ->
    uploadFile $scope, S3, user.name, $scope.newPhotoFile, (url) ->
      user.photo = url
      $http.put '/api/users/' + user._id, user

  $scope.delete = (user) ->
    if confirm 'Delete'
      $http.delete('/api/users/' + user._id).success ->
        $scope.users.splice $scope.users.indexOf user, 1
        delete $scope.selectedUser

.controller 'AdminAboutCtrl', ($scope, $http) ->

  $http.get('/api/pages/about').success (page) ->
    $scope.page = page

  $scope.save = (page) ->
    $http.put '/api/pages/' + page._id, page
