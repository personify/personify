_ = require 'underscore'
String::contains = (what) -> @indexOf(what) isnt -1

collection = (ns) -> 
  [model, type] = ns.split '.'
  type: type
  coll: []
  get: -> return @coll
  set: (coll) -> @coll = coll
  push: (item) -> @coll.push item

document = (model) -> return ""


module.exports = (agent) -> 

  if agent.archive?
    for key, val of agent.archive
      if typeof(val) is 'string' 
        # collection
        if val.contains '.' then agent.archive[key] = collection val 
        # document (model)
        else agent.archive[key] = document val

  return agent