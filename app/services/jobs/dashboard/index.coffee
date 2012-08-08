connect = require "connect"
Vein    = require "vein"
views   = require './views'
module.exports = (agent) -> 
  agent.dashboard      ?= {}
  agent.dashboard.port ?= 8080
 
  # HTTP Server
  Connect = connect()
  Connect.use connect.favicon()
  Connect.use connect.static agent.paths.public
  agent.dashboard.server = Connect.listen agent.dashboard.port
  agent.log "WebServer started on #{agent.dashboard.port}"
 
  # Vein - websockets
  agent.dashboard.vein = Vein.createServer server: agent.dashboard.server
  agent.log "WebSocket server started"
 
  # views
  agent = views agent

  return agent