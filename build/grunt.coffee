path   = require 'path'
fs     = require 'fs'
coffee = require 'coffee-script'
global.app = require "../config"

gruntConfig =

  pkg: "<json:package.json>"

  test:
    files: [ "./**/*.spec.coffee" ]

  reload: {}

  lint:
    files: [ "grunt.js", "lib/**/*.js", "test/**/*.js" ]

  personify:
    files: "#{app.paths.app}/**/contract.coffee"

  ##
  ## watch
  ##

  watch:
    index:
      files: "#{app.paths.public}/index.html"
      tasks: "reload"

    # templates
    
    jaded:
      files: "#{app.paths.client}/templates/*.jade"
      tasks: "exec:jaded reload"

    personify:
      files: "<config:personify.files>"
      tasks: "personify"

    coffee:
      files: [ "<config:coffee.app.src>",
               "<config:coffee.services.src>",
               "<config:coffee.vendor.src>",  
               "<config:coffee.myTasks.src>" ]
      tasks: "coffee reload"    

    styles:
      files: "#{app.paths.public}/css/styles.css"
      tasks: "reload"

  globals:
    exports: true


module.exports = (grunt) ->

  ## init config 
  
  grunt.initConfig gruntConfig

  grunt.loadTasks './build'

  grunt.loadNpmTasks "grunt-coffee"
  grunt.loadNpmTasks "grunt-reload"
  grunt.loadNpmTasks "grunt-exec"

  ## default 

  grunt.registerTask "default", "personify lint test coffee reload start watch"

  ## start 

  grunt.registerTask "start", "start up servers", ->
    grunt.log.writeln "starting servers..."
    require "#{app.paths.server}/server"

 