should   = require 'should'
start    = require './index'
contract = require '../test/app/contract'
module.exports =

  start:
    "start new @agent if it's not running": ->
      contract.log = -> # mute log
      console.log contract
      contract.web = port: 8080      
      @agent = start contract unless @agent.web.server?
    #'cleanup': ->
      #@agent.dashboard.server?.close()
