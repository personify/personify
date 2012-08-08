mori = require 'mori'
_    = require 'underscore'
module.exports = (agent) ->
  agent.jobs = mori.set ( agent.jobs or [] )
  jobsMap =   
    models:   'archivist'
    archive:  'archivist'
    services: 'dashboard'
    views:    'dashboard'

  for key, job of jobsMap
    if agent[key]?
      agent.jobs = mori.conj agent.jobs, job
  agent.jobs = mori.into_array(agent.jobs)

  # extend agent with jobs
  _.reduce agent.jobs, (a, job, name) ->
    _.extend a, (require "../jobs/#{job}")(agent)
  , {}

  return agent