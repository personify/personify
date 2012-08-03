require 'should'
_ = require 'underscore'

archive  = require './archive'

# sample data

contract =
  todos: 'Todo.vector'
 
# spec

module.exports =

  'parse:archive':
    'given (contract) -> with inline models will return equivalent': ->
  
      a = _.reduce contract, archive, {}
      a.should.eql { todos: [] }
    
