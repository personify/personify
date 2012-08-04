should = require 'should'
_ = require 'underscore'
path = require 'path'
start = require './start'

## MOVE TO UTIL

namespace = (obj, ns) -> 
  _.reduce (ns.split '.'), (obj, space) ->
    return obj[space] if obj[space]?
  , obj

ns2path = (root, ns) -> root + '/' + ns.replace '.', '/'

# sample data

contract =
  name: "todos"
  goal: "keep track of todos"
  models:
    Todo:
      txt:  String
      done: Boolean
  archive:
    todos: 'Todo.List'
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

  # standard 

  load: (ns) -> 

    # already in the agent's namespace
    return (namespace @, ns) if (namespace @, ns)?
    # or try to load from fs relative to agent
    try
      require( ns2path @paths.app, ns )
    catch e
    # or try to load from personify core
      try
        require( ns2path app.paths.app, ns )
      catch err
        console.log "#{@name}.load.err:"
        console.log err
        ## TODO: any other loading strategy
        ## npm, github

  log: (str) -> console.log str
    
# spec

module.exports =
  start:
    'EXE start(contract)': ->
      @agent = start(contract)
    'agent.dashboard.server should exist': ->
      should.exist @agent.dashboard.server
    'agent.dashboard.vein should exist': ->
      should.exist @agent.dashboard.vein
    'agent.archive should be a Todo vector': ->
      @agent.archive.todos.type.should.eql 'List'
    'cleanup': ->
      @agent.dashboard.server.close() if @agent.dashboard.server?
