mori = require 'mori'

module.exports = (agent) ->

  agent.jobs = mori.set ( agent.jobs or [] )

  jobsMap =   
    models:   'archivist'
    archive:  'archivist'
    #services: apiServer
    views:    'dashboard'

  for key, job of jobsMap
    if agent[key]? then agent.jobs = mori.conj agent.jobs, job

  agent.jobs = mori.into_array(agent.jobs)

  return agent.jobs