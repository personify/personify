should = require 'should'
path   = require 'path'
_      = require 'underscore'

start  = require './start'

# sample data

contract =
  name: "todos"
  goal: "keep track of todos"
  models:
    Todo:
      txt:  String
      done: Boolean
  archive:
    todos: 'Todo.Collection'
  views:
    index:
     route: '/'
     crud: 'todos'

  paths:
    root:     path.resolve __dirname + '/../test'
    app:      path.resolve __dirname + '/../test/app'
    models:   path.resolve __dirname + '/../test/app/models'
    services: path.resolve __dirname + '/../test/app/services'
    client:   path.resolve __dirname + '/../test/app/dashboard/client'
    server:   path.resolve __dirname + '/../test/app/dashboard/server'
    public:   path.resolve __dirname + '/../test/app/dashboard/public'
    npmBin:   path.resolve __dirname + '/../test/node_modules/.bin'
    
# spec

module.exports =
  start:
    'EXE start(contract)': ->
      @agent = start contract
    'agent.dashboard.server should exist': ->
      should.exist @agent.dashboard.server
    'agent.dashboard.vein should exist': ->
      should.exist @agent.dashboard.vein
    'agent.archive should be a Todo vector': ->
      @agent.archive.todos.type.should.eql 'List'
      @agent.archive.todos.on 'push', (item) -> 
        item.should.equal 1
      @agent.archive.todos.push 1
    'cleanup': ->
      @agent.dashboard.server.close() if @agent.dashboard.server?
