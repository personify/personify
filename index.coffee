parse = require './parser/services/parse'

module.exports = 
  parse: (contract, schema) -> parse {}, contract, schema
###      
    for k, v of contract
      app[k] = contractSchema[k]? grunt, k, v 
    return app