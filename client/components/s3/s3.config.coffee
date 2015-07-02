'use strict'

angular.module 'beepBoopWebsiteApp'
.factory 'S3Config', ($rootScope, $http) ->

  publicUrlPrefix = 'https://s3.amazonaws.com/'

  configS3: (callback) ->
    $http.get('/api/s3/credentials').success (data) ->
      console.log 'Got credentials... ' + JSON.stringify data
      AWS.config.update data
      AWS.config.region = data.region
      callback()

  getParams: (folder, prefix, callback) ->
    $http.get('/api/s3/generate/' + folder + '/' + prefix).success (params) ->
      callback params

  getPublicUrlFromKey: (bucket, key) ->
    return publicUrlPrefix + bucket + '/' + key

  getKeyFromPublicUrl: (url, callback) ->
    $http.get('/api/s3/generate/0/0').success (params) ->
      count = (publicUrlPrefix + params.Bucket).length + 1
      params.Key = url.substring count, url.length
      callback params
