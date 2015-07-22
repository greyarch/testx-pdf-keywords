q = require 'q'
downloadPdf = require 'download-pdf'
pdfText = require 'pdf-text'
temp = require("temp").track()
path = require 'path'

module.exports =
  download: (url) ->
    deferred = q.defer()
    filePath = temp.path
      prefix: 'testx-'
      suffix: '.pdf'
    options =
      directory: path.dirname(filePath)
      filename: path.basename(filePath)
    downloadPdf url, options, (err) ->
      deferred.reject err if err
      deferred.resolve filePath
    deferred.promise

  getText: (file) ->
    deferred = q.defer()
    pdfText file, (err, chunks) ->
      deferred.reject err if err
      deferred.resolve chunks.join('')
    deferred.promise
