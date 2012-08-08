require 'should'
_ = require 'underscore'

parse  = require './parse'
echo   = (key, val) -> val

# sample data

contract =
    name: "todos"
    goal: "keep track of todos"
    models:
      Todo:
        txt:  String
        done: Boolean
    archive:
      todos: 'Todo.vector'
    views:
      index:
       route: '/'
       crud: 'todos'    
 
# spec

module.exports =

  parse:

    'given (contract) -> will parse & return obj eql to contract': -> 
      parse(contract).should.eql contract

    'given (contract, schema) -> will parse contract & return correct app structure': ->
      schema = 
        name: (val) -> 
          return memo = "foo"
      parse(contract, schema).name.should.eql "foo"