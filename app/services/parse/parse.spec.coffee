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
        txt:  'string'
        done: 'boolean'
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
        name: (key, val) -> "foo"
      parse(contract, schema).name.should.eql "foo"

    'given (contract, schema) -> where schema uses the model parser will parse contract & return correct obj structure': ->
      schema = 
        models: require '../models/models'
      c = _.clone contract
      c['models']['User'] = "a user"
      parse(c, schema).models.User.should.eql {'_desc': "a user"}
