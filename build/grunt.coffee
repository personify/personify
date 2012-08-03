path       = require 'path'
fs         = require 'fs'
coffee     = require 'coffee-script'
Mocha      = require "mocha"
global.app = {}
app.paths  = 
  root:     path.resolve '.'
  app:      path.resolve './app'
  models:   path.resolve './app/models'
  services: path.resolve './app/services'
  jobs:     path.resolve './app/jobs'
  npmBin:   path.resolve './node_modules/.bin'


gruntConfig =

  pkg: "<json:package.json>"

  exec:
    mocha: 
      command: "mocha --compilers coffee:coffee-script
      $(find ./ -name '*.spec.coffee') -R spec --ui 
      exports"

  test:
    files: ["#{app.paths.app}/**/*.spec.coffee"]

  mocha: 
    options: 
      reporter: 'spec'
      ui:       'exports'

  watch:
    test:
      files: "<config:test.files>"
      tasks: "test"
    services:
      files: "#{app.paths.app}/**/services/**/*.coffee"
      tasks: "test"
    jobs:
      files: "#{app.paths.app}/**/jobs/**/*.coffee"
      tasks: "test"

  globals:
    exports: true


module.exports = (grunt) ->

  ## init config 
  
  grunt.initConfig gruntConfig
  grunt.loadTasks './build'
  #grunt.loadNpmTasks "grunt-exec"

  ## default 

  grunt.registerTask "default", "test watch"

  grunt.registerMultiTask "test", "Run unit tests with Mocha", ->
    
    # tell grunt this is an asynchronous task
    done = @async()

    for key of require.cache
      if require.cache[key]
        delete require.cache[key]

        console.warn "Mocha grunt task: Could not delete from require cache:\n" + key  if require.cache[key]
      else
        console.warn "Mocha grunt task: Could not find key in require cache:\n" + key

    # load the options if they are specified
    if typeof options is 'object'
      options = grunt.config(["mocha", @target, "options"])
    else
      options = grunt.config("mocha.options") 
    
    # create a mocha instance with our options
    mocha = new Mocha(options)

    # add files to mocha
    for file in grunt.file.expandFiles(@file.src)
      mocha.addFile file

    # run mocha asynchronously and catch errors!! (again, in case we are running this task in watch)

    try
      mocha.run (failureCount) ->
        console.log "Mocha completed with " + failureCount + " failing tests"
        done failureCount is 0
    catch e
      console.log "Mocha exploded!"
      console.log e
      done false
