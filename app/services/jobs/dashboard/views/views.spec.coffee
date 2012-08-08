require 'should'
_ = require 'underscore'
views = require './index'
###
# sample data

viewContract =
  index:
   route: '/'
   crud: 'todos' 

# spec

module.exports =

  'parse:views':
    'given (contract) -> will return correct views': ->

      v = _.reduce viewContract, views, {}
      v.should.eql viewContract
