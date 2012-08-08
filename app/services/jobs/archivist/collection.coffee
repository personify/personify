{EventEmitter} = require 'events'

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

module.exports =
  collection = (ns) -> new Collection ns
