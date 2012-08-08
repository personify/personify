crud = require './crud'
module.exports = (agent) ->

  for view, props of agent.views
    if props.crud?
      agent = crud agent, agent.archive[props.crud]

  return agent
  ###

    if typeof(val) is 'string'
      views[key] = { "_desc": val }
    else if typeof(val) is 'object'
      views[key] = val
    return views
