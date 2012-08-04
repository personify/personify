connect = require "connect"
Vein    = require "vein"

module.exports = (agent) -> 

  agent.dashboard      ?= {}
  agent.dashboard.port ?= 8080

  # Static WebServer
  Connect = connect()
  Connect.use connect.favicon()
  Connect.use connect.staticCache()
  Connect.use connect.static agent.paths.public
  agent.dashboard.server = Connect.listen agent.dashboard.port

  # Vein - websockets
  agent.dashboard.vein = new Vein agent.dashboard.server

  agent.log "WebServer started on #{agent.dashboard.port}"
  agent.log "WebSocket server started"
  
  return agent
