parse = require './services/parse/parse'

module.exports = 
  parse: (contract, schema) -> parse contract, schema
