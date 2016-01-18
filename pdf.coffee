path = require 'path'
fs = require 'fs'
http = require 'http'
q = require 'q'
pdfText = require 'pdf-text'
temp = require("temp").track()

module.exports =
  download: (url) ->
    deferred = q.defer()
    dest = temp.path
      prefix: 'testx-'
      suffix: '.pdf'
    file = fs.createWriteStream(dest)
    http.get url, (response) ->
      response.pipe file
      file.on 'finish', ->
        file.close()
        deferred.resolve dest
    .on 'error', (err) -> deferred.reject err
    deferred.promise

  getText: (file) ->
    deferred = q.defer()
    pdfText file, (err, chunks) ->
      deferred.reject err if err
      deferred.resolve (c.trim() for c in chunks).join(' ')
    deferred.promise
