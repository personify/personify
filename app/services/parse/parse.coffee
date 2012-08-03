_ = require 'underscore'

parse = ({contract, schema, parser}) -> 
  return "err: no contract" unless contract?
  return "err: no parser" unless parser?
  ctx = {}
  ctx.schema = schema or {}
  #TODO: better obj/array handling
  if typeof(contract) is 'object'
    return _.reduce contract, parser, {}, ctx
  else
    return parser contract

# personify.parse
module.exports = (contract, schema) -> 
  parse
    contract: contract
    schema: schema or {}
    parser: (app, val, key) ->
      if key? and @schema[key]?
        app[key] = parse 
          contract: val
          parser: @schema[key]
      else
        app[key] = val

      return app

