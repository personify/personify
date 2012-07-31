TODO:
service =
  name:     'parseContract' 
  services: 'buildApp'
  uses:
    '_': 'underscore'
  input: 
    contract: JSON
  output:
    app: Object  
  given: 
    contract: contract  
  can:
    "parse contract & return app correctly": (app) ->
      app.should.eql parsedApp  
  exe: ->
    _.reduce @contract, buildApp, {}
