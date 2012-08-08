should = require 'should'
_      = require 'underscore'

start    = require './start'
contract = require '../test/contract'
 
# spec
module.exports =
  start:
    'EXE start(contract)': ->
      @agent = start contract
    'agent.dashboard.server should exist': ->
      should.exist @agent.dashboard.server
    'agent.dashboard.vein should exist': ->
      should.exist @agent.dashboard.vein
    'when i push an item to todos it should be appended': ->
      @agent.archive.todos.on 'push', (item) -> 
        item.should.equal 1
      @agent.archive.todos.push 1
    'cleanup': ->
      @agent.dashboard.server.close() if @agent.dashboard.server?
