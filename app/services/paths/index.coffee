{resolve} = require 'path'
_ = require 'underscore'
module.exports = (root) ->
  console.log root
  root ?= process.cwd()
  paths =
    root:     ''
    app:      'app'
    models:   'app/models'
    services: 'app/services'
    client:   'app/web/client'
    server:   'app/web/server'
    public:   'app/web/public'
    npmBin:   'node_modules/.bin'

  _.reduce paths, (paths, route, path) ->     
    paths[path] = resolve "#{root}/#{route}"
    paths
  , {}