_ = require 'underscore' 

module.exports = (agent) ->
  agent.log   = console.log
  agent.load  = require '../load'

  agent.log "starting agent '#{agent.name}'..."

  # extend agent with jobs
  agent = require('../jobs') agent

  