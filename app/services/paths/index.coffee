{resolve} = require 'path'
_ = require 'underscore'
module.exports = (root) ->
  root ?= process.cwd()
  paths =
    root:     root
    app:      'app'
    models:   'app/models'
    services: 'app/services'
    client:   'app/dashboard/client'
    server:   'app/dashboard/server'
    public:   'app/dashboard/public'
    npmBin:   'node_modules/.bin'

  _.reduce paths, (paths, route, path) ->     
    paths[path] = resolve "#{root}/#{route}"
    paths
  , {}