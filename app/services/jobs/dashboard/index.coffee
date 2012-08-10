connect = require "connect"
Vein    = require "vein"
views   = require './views'
module.exports = (agent) -> 
  agent.web      ?= {}
  agent.web.port ?= 8080
  console.log agent
 
  # HTTP Server
  Connect = connect()
  Connect.use connect.favicon()
  Connect.use connect.static agent.paths.public
  agent.web.server = Connect.listen agent.web.port
  agent.log "WebServer started on #{agent.web.port}"
 
  # Vein - websockets
  agent.web.socket = Vein.createServer server: agent.web.server
  agent.log "WebSocket server started"
 
  # views
  agent = views agent

  return agent