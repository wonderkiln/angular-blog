'use strict'

angular.module 'beepBoopWebsiteApp'
.factory 'S3', ($location, $rootScope, $http, $q) ->

  credentials =
    bucket: '***REMOVED***'
    access_key: '***REMOVED***'
    secret_key: '***REMOVED***'

  upload: (file, callback) ->
    # callback(finished, progress, err, url)
    AWS.config.update
      accessKeyId: credentials.access_key
      secretAccessKey: credentials.secret_key
    AWS.config.region = 'us-east-1'

    bucket = new AWS.S3
      params:
        Bucket: credentials.bucket

    params =
      Key: chance.guid()
      ContentType: file.type
      Body: file

    bucket.putObject params, (err, data) ->
      if err
        callback true, 0, true
      else
        callback true, 0, false, 'https://s3.amazonaws.com/' + credentials.bucket + '/' + params.Key
    .on 'httpUploadProgress', (progress) ->
      p = Math.round(progress.loaded / progress.total * 100)
      callback false, p

  delete: (key, callback) ->
    #
