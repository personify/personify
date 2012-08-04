mori = require 'mori'
_ = require 'underscore' 

module.exports = (agent) ->
  console.log "starting agent '#{agent.name}'..."

  agent.jobs = mori.set ( agent.jobs or [] )

  jobsMap =   
    models:   'archivist'
    archive:  'archivist'
    #services: apiServer
    views:    'dashboard'

  for key, job of jobsMap
    if agent[key]? then agent.jobs = mori.conj agent.jobs, job

  agent.jobs = mori.into_array(agent.jobs)

  # extend agent with jobs
  ext = (a, job, name) -> 
    return _.extend( a, (agent.load "jobs.#{job}") agent)
  
  return _.reduce agent.jobs, ext, {}
