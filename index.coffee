pdf = require './pdf'
_ = require 'lodash'

module.exports =
  'check text in pdf': expectText(toMatch true)
  'check text not in pdf': expectText(toMatch false)

expectText = (matcher) ->
  (args) ->
    if args.file
      pdf.getText(args.file)
      .then(matcher)
    else if args.url
      pdf.download(args.url)
      .then(pdf.getText)
      .then(matcher)
    else if args.link
      console.warn 'The "link" parameter is not supported yet.'
    else
      throw new Error 'One of "file", "url" or "link" parameters has to be set in order to use this keyword.'

toMatch = (match = true) ->
  (text) ->
    for expected in _.omit(args, ['file', 'url', 'link'])
      if match
        expect(text).toMatch expected
      else
        expect(text).not.toMatch expected
