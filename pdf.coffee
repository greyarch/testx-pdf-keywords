q = require 'q'
downloadPdf = require 'download-pdf'
pdfText = require 'pdf-text'

options =
  directory: '/tmp'
  filename: 'testx.pdf'

module.exports =
  download: (url) ->
    deferred = q.defer()
    downloadPdf url, options, (err) ->
      deferred.reject err if err
      deffered.resolve()
    deferred.promise

  getText: (file) ->
    deferred = q.defer()
    pdfText file, (err, chunks) ->
      deferred.reject err if err
      deffered.resolve chunks
    deferred.promise
