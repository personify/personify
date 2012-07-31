_ = require 'underscore'

# parse contract and return app
module.exports = (contract, schema) -> 
  schema ?= {}

  # return obj

  _.reduce contract, (app, val, key) -> 
    if typeof schema[key] is 'function' 
      app[key] = schema[key] key, val 
    else
      app[key] = val  
    return app
  , {} 
