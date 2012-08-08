should   = require 'should'
start    = require './index'
contract = require '../test/app/contract'
module.exports =

  start:
    'EXE start(contract)': ->
      @agent = start contract
    'cleanup': ->
      @agent.dashboard.server?.close()
