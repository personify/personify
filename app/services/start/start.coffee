_ = require 'underscore' 

module.exports = (agent) ->
  console.log "starting agent '#{agent.name}'..."

  agent.log   = console.log
  agent.load  = require '../load'
  agent.paths = require('../paths')()
  # extend agent with jobs
  agent = require('../jobs') agent
  