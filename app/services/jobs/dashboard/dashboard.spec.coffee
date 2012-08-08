should    = require 'should'
dashboard = require './index'
#test = '../../test/'
paths = require '../../paths'
contract = require '../../test/app/contract'
collection = require '../archivist/collection'
module.exports =

  dashboard:
    'given a basic contract': ->
      contract.archive.todos = collection contract.archive.todos
      @agent = dashboard contract
    'server should exist': ->
      should.exist @agent.dashboard.server
    'vein should exist': ->
      should.exist @agent.dashboard.vein
    'views should': ->
    'cleanup': ->
      @agent.dashboard.server?.close()
