_ = require 'underscore'
module.exports = (obj, ns) -> 
  
  _.reduce (ns.split '.'), (obj, space) ->
    return obj[space] if obj[space]?
  , obj