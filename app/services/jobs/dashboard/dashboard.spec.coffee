should     = require 'should'
dashboard  = require './index'
#test = '../../test/'
paths      = require '../../paths'
contract   = require '../../test/app/contract'
collection = require '../archivist/collection'
module.exports =

  dashboard:
    "start new @agent with contract": ->
      contract.log = -> # mute log
      #contract.archive.todos = collection contract.archive.todos
      contract.web = port: 8107
      @agent = dashboard contract
    'agent.web.server started on 8107': ->
      should.exist @agent.web.server
    'agent.web.socket (vein) started': ->
      should.exist @agent.web.socket
    'views should': ->
    'agent.web.server closed on 8107': ->
      @agent.web.server?.close()
