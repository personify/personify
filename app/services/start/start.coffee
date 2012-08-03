#mongo   = require "./lib/mongo"
#paths   = require './config'
_ = require 'underscore'

module.exports = (agent) ->

  console.log "starting agent '#{agent.name}'..."

  agent.jobs ?= {}

  jobsMap =   
    models:   'archivist'
    archive:  'archivist'
    #services: apiServer
    views:    'dashboard'

  for key, job of jobsMap
    if agent[key]? and !agent.jobs[job]?
      agent.jobs[job] = agent.load "jobs.#{job}"

  i = (a, job, name) -> return _.extend( a, job(agent) )
  _.reduce agent.jobs, i, {}
    