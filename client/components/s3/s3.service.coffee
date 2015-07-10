'use strict'

angular.module 'beepBoopWebsiteApp'
.factory 'S3', ($location, $rootScope, $http, $q, S3Config) ->

  uploadFileToFolder: (folder, prefix, file, callback, progressCallback) ->
    S3Config.getParams folder, prefix, (p) ->

      params = p
      params.ContentType = file.type
      params.Body = file

      console.log 'Uploading file w/ config... ' + JSON.stringify params

      S3Config.configS3 ->
        s3 = new AWS.S3()
        s3.putObject params, (err) ->
          console.log 'Done uploading w/ err ' + err
          url = S3Config.getPublicUrlFromKey params.Bucket, params.Key
          callback err, url if callback
        .on 'httpUploadProgress', (progress) ->
          value = Math.round progress.loaded / progress.total * 100
          progressCallback value if progressCallback

  deleteFile: (url, callback) ->
    console.log 'Deleting file... ' + url
    S3Config.getKeyFromPublicUrl url, (params) ->
      console.log 'Deleting file w/ config... ' + JSON.stringify params
      S3Config.configS3 ->
        s3 = new AWS.S3()
        s3.deleteObject params, (err) ->
          callback err if callback
