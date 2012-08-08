require 'should'
_ = require 'underscore'
models = require './models'

# sample data

modelContract =
  Todo:
    txt:  String
    done: Boolean

# spec

module.exports =

  'parse:models':
    'given (contract) -> with inline models will return equivalent': ->
      m = _.reduce modelContract, models, {}
      m.should.eql modelContract
