pdf = require './pdf'
_ = require 'lodash'
el = require('testx').element

expectText = (matcher) ->
  (args) ->
    expecteds = _.omit(args, ['file', 'url', 'link', 'timeout'])
    if args.file
      pdf.getText(args.file)
      .then(matcher expecteds)
    else if args.url
      url = if args.url.match(/^https?:\/\//i) then args.url else browser?.baseUrl + args.url
      pdf.download(url)
      .then(pdf.getText)
      .then(matcher expecteds)
    else if args.link
      link = el(args.link)
      link.wait(parseInt(args.timeout || 5000))
      link.getAttribute('href')
      .then(pdf.download)
      .then(pdf.getText)
      .then(matcher expecteds)
    else
      throw new Error 'One of "file", "url" or "link" parameters has to be set in order to use this keyword.'

toMatch = (match = true) -> (expecteds) ->
  (text) ->
    for key, expected of expecteds
      if match
        expect(text).toMatch expected
      else
        expect(text).not.toMatch expected

module.exports =
  'check in pdf': expectText(toMatch true)
  'check not in pdf': expectText(toMatch false)
