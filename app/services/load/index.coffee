{ns2obj, ns2path} = require '../namespace'

## load
module.exports = (ns) -> 
  # already in the agent's namespace
  return (ns2obj @, ns) if (ns2obj @, ns)?
  # or try to load from fs relative to agent
  try
    return require( ns2path @paths.app, ns )
  catch e
    # or try to load from personify core
    try
      return require( ns2path app.paths.app, ns )
    catch err
      console.log "#{@name}.load.err: #{ns}"
      console.log err
      ## TODO: any other loading strategy
      ## global ns, npm, github, amd if client
