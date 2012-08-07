_ = require 'underscore' 

module.exports = (agent) ->
  console.log "starting agent '#{agent.name}'..."

  agent.log  = console.log
  agent.load = require '../load'
  agent.jobs = require('../jobs')(agent)

  ext = (a, job, name) ->
    _.extend a, (agent.load "jobs.#{job}")(agent)

  _.reduce agent.jobs, ext, {}
