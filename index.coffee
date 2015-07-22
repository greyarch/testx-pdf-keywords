pdf = require './pdf'
_ = require 'lodash'

expectText = (matcher) ->
  (args) ->
    expecteds = _.omit(args, ['file', 'url', 'link'])
    if args.file
      pdf.getText(args.file)
      .then(matcher expecteds)
    else if args.url
      pdf.download(args.url)
      .then(pdf.getText)
      .then(matcher expecteds)
    else if args.link
      console.warn 'The "link" parameter is not supported yet.'
    else
      throw new Error 'One of "file", "url" or "link" parameters has to be set in order to use this keyword.'

toMatch = (match = true) -> (expecteds) ->
  (text) ->
    console.log 'expecteds:', expecteds
    for key, expected of expecteds
      console.log 'expected:', expected
      if match
        expect(text).toMatch expected
      else
        expect(text).not.toMatch expected

module.exports =
  'check text in pdf': expectText(toMatch true)
  'check text not in pdf': expectText(toMatch false)
