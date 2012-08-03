require 'should'
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

agent =
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

  paths:
    root:     path.resolve './test'
    app:      path.resolve './test/app'
    models:   path.resolve './test/app/models'
    services: path.resolve './test/app/services'
    client:   path.resolve './test/app/dashboard/client'
    server:   path.resolve './test/app/dashboard/server'
    public:   path.resolve './test/app/dashboard/public'
    npmBin:   path.resolve './test/node_modules/.bin'

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
    
# spec

module.exports =

  start:
    'given (agent) -> will start the agent': -> 
      console.log "agent came back: "
      agent = start(agent)
      console.log agent
      agent.dashboard.server.close()
      #start(agent).should.eql agent