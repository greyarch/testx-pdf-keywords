pdf = require './pdf'
_ = require 'lodash'

pdf = 'http://apps.who.int/iris/bitstream/10665/137592/1/roadmapsitrep_7Nov2014_eng.pdf'

module.exports =
  'check text in pdf': (args) ->
    msgPromise = mailbox.getMessages args.host, args.port, args.username, args.password
    msgPromise.then (messageData) ->
      for key, val of _.omit(args, ['url'])
        console.log val
        expect(messageData).toMatch(val)
    .catch (error) ->
      console.log error
