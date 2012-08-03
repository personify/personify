connect = require "connect"
#Vein    = require "vein"

module.exports = (agent) -> 

  console.log "dash"

  agent.dashboard      ?= {}
  agent.dashboard.port ?= 8080

  # Static WebServer
  Connect = connect()
  Connect.use connect.favicon()
  Connect.use connect.staticCache()
  #Connect.use connect.static agent.paths.public
 
  agent.dashboard.server = Connect.listen agent.dashboard.port

  agent

  #  agent.dashboard.server.fuckoff 
  
  # Vein
  #vein = new Vein server
  #vein.addFolder paths.services

  #console.log "Server started on #{config.app.port}"
  #console.log "Using database #{config.mongo.host}"