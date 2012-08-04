_ = require 'underscore'
String::contains = (what) -> @indexOf(what) isnt -1
EventEmitter = require('events').EventEmitter

class Collection extends EventEmitter
  constructor: (ns) -> 
    [@model, @type] = ns.split '.'
    @coll = []
  get: -> 
    #return @coll.reverse() if @model is 'Vector'
    return @coll
  find: (item) -> return item
  set: (@coll) -> @emit 'set', @coll
  push: (item) -> 
    @coll.push item
    @emit 'push', item

document = (model) -> return ""


module.exports = (agent) -> 

  if agent.archive?
    for key, val of agent.archive
      if typeof(val) is 'string' 
        # collection
        if val.contains '.' then agent.archive[key] = new Collection val 
        # document (model)
        else agent.archive[key] = document val

  return agent